<?php

namespace frontend\controllers;

use app\models\Log;
use yii\data\ActiveDataProvider;
use yii\helpers\Url;
use yii\filters\AccessControl ;

class LogController extends \yii\web\Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['delete', 'review','index'],
                'rules' => [
                    [
                        'actions' => ['delete', 'review','index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'actions' => ['delete', 'review','index'],
                        'allow' => false,
                        'roles' => ['?'],
                    ],
                ],
            ],
        ];
    }
    
    public function actionIndex() {
        $dataProvider = new ActiveDataProvider([
            'query' => Log::find()->where(['not', ['id_producto' => null]]) ,
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
    public function actionCharge() {
        $dataProvider = new ActiveDataProvider([
            'query' => Log::find()->where(['id_producto' => null]) ,
            'sort' => [
                    'defaultOrder' => [
                        'fecha' => SORT_DESC
                    ]
                ],
            ]) ;

        return $this->render('charge' , [
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
