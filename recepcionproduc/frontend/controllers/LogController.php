<?php

namespace frontend\controllers;

use app\models\Log;
use yii\data\ActiveDataProvider;
use yii\helpers\Url;

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
    public function actionReview() {
        $items = [
            [
                'label' => 'Carga' ,
                'url'   => Url::to(['/log/charge']) ,
            ] ,
            [
                'label' => 'Recepción' ,
                'url'   => Url::to(['/log/index']) ,
            ] ,
        ] ;
        return $this->render('review',[
            'items'=>$items
        ]);
    }

}
