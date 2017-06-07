<?php

namespace frontend\controllers;

use Yii;
use app\models\Product;
use yii\data\ActiveDataProvider;
use yii\helpers\Url;
use yii\filters\AccessControl;


class ProductController extends \yii\web\Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'view'],
                'rules' => [
                    [
                        'actions' => ['index', 'view'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'actions' => ['index', 'view'],
                        'allow' => false,
                        'roles' => ['?'],
                    ],
                ],
            ],
        ];
    }
    
    public function actionIndex() {

        $items = [
            [
                'label' => 'Aishop' ,
                'url'   => Url::to(['/mapping/index','M'=>1]) ,
            ] ,
            [
                'label' => 'Exotik' ,
                'url'   => Url::to(['/mapping/index','M'=>2]) ,
            ] ,
            [
                'label' => 'Vesimenta',
                'url'   => Url::to(['/mapping/index','M'=>3]) ,
            ] ,
            [
                'label' => 'Xinfoni',
                'url'   => Url::to(['/mapping/index','M'=>4]) ,
            ] ,
        ] ;

        return $this->render('index' , [
                'items' => $items,
        ]) ;
    }

    public function actionView()
    {
        $model = Product::find();
        
        $provider = new ActiveDataProvider([
            'query'      => $model ,
        ]) ;

        return $this->render('index' , [
                    'provider' => $provider
        ]) ;
        
        return $this->render('view');
    }

}
