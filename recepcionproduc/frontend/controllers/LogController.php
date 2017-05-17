<?php

namespace frontend\controllers;

use app\models\Log;
use yii\data\ActiveDataProvider;

class LogController extends \yii\web\Controller
{
    public function actionIndex() {
        $dataProvider = new ActiveDataProvider([
            'query' => Log::find() ,
            'sort' => [
                'defaultOrder' => [
                    'fecha' => SORT_DESC
                ]
            ],
            ]) ;

        return $this->render('index' , [
                    'dataProvider' => $dataProvider
                ]) ;
        
    }

}
