<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    public function answers()
    {
        return $this->hasMany('App\Answer');
    }

    static public function generateFilteredQuestion($question)
    {
        $question['answers'] = array_map(function ($answer) {   //filter answer without true versions.
            return array('id' => $answer['id'], 'answer' => $answer['answer']);
        }, $question['answers']->toArray());

        return array(
            'id' => $question['id'],
            'description' => $question['description'],
            'answers' => $question['answers']
        );
    }
}
