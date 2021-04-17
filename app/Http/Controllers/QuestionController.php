<?php

namespace App\Http\Controllers;

use App\Question;
use App\Session;

class QuestionController extends Controller
{

    public function index($session_id, $point)
    {
        if ($session_id == 0) { //session is not exist, it's first question
            $question = Question::inRandomOrder()->with('answers')->first();
            $session_array = array($question->id);
            $id = Session::create([
                'array' => json_encode($session_array),
                'points' => 0,
            ])->id;
            $result = array(
                'id' => $id,
                'question' => $question,
            );
            return $result;
        } else { //session is already exist, it's not first question
            $session = Session::find($session_id);
            if (isset($session)) {
                $session_array = json_decode($session->array);
                if (count($session_array) >= 5) { //finish of the quiz
                    return array(
                        'points' => $session->points //final points
                    );
                }
                $question = Question::whereNotIn('id', $session_array)->inRandomOrder()->with('answers')->first();
                $session_array[] = $question->id;
                $session->array = $session_array;
                $session->points += $point;
                $session->save();
                $result = array(
                    'id' => $session_id,
                    'question' => $question,
                );
                return $result;
            }
            return 'Session not Found';
        }

    }


}
