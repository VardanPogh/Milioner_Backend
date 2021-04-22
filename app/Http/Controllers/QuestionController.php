<?php

namespace App\Http\Controllers;

use App\Answer;
use App\Question;
use App\Session;

class QuestionController extends Controller
{

    public function index()
    {
        $question = Question::inRandomOrder()->with('answers')->first();
        $session_array = array($question->id);
        $id = Session::create([
            'array' => json_encode($session_array),
            'points' => 0,
        ])->id;

        $generatedQuestion = Question::generateFilteredQuestion($question);
        $result = array(
            'id' => $id,
            'question' => $generatedQuestion,
        );
        return $result;

    }

    /**
     *
     *
     * @param Session $session
     * @param Question $question
     * @param Answer $answer
     * @return array
     */
    public function check_answer(Session $session, Question $question, Answer $answer)
    {
        $session_array = json_decode($session->array);
        if (count($session_array) >= 5) { //finish of the quiz
            return array(
                'points' => $session->points //final points
            );
        }
        $tempQuestion = Question::whereNotIn('id', $session_array)->inRandomOrder()->with('answers')->first();
        $newQuestion = Question::generateFilteredQuestion($tempQuestion);
        $session_array[] = $newQuestion['id'];
        $session->array = $session_array;
        $response = array();
        $response['newQuestion'] = $newQuestion; //send a new question

        if ($answer['is_true'] === 1) {
            $session->points += $question->points;
            $response['is_true'] = 1; //tell the Frontend that is true answer
        } else {
            $rightAnswer = Answer::where([['question_id', $question->id], ['is_true', 1]])->first();
            $response['right_answer_id'] = $rightAnswer->id;
            $response['is_true'] = 0; //tell the Frontend that is wrong answer
        }

        $session->save();
        return $response;
    }
}
