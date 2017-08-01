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
        $user = new \common\models\User();
        $searchModel = new \app\models\LogSearch();
        $dataProvider = $searchModel->search(\Yii::$app->request->get());
        return $this->render('index' , [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
                    'user' => $user
                ]) ;
        
    }
    public function actionCharge() {
        $user = new \common\models\User();
        $searchModel = new \app\models\LogSearch();
        $dataProvider = $searchModel->searchCharge(\Yii::$app->request->get());
        return $this->render('charge' , [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
                    'user' => $user
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
