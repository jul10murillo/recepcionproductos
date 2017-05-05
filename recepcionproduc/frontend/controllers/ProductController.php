<?php

namespace frontend\controllers;

use app\models\Product;
use yii\data\ActiveDataProvider;


class ProductController extends \yii\web\Controller
{
    public function actionIndex() {
        $items = [
            [
                'label' => 'Buscar Mapping' ,
                'url'   => ['/mapping/index'] ,
            ] ,
            [
                'label' => 'Subir Mapping' ,
                'url'   => ['/mapping/upload'] ,
            ] ,
            [
                'label' => 'Exportar Mapping' ,
                'url'   => ['/mapping/export'] ,
            ] ,
        ] ;

        return $this->render('index' , [
                    'items' => $items
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
