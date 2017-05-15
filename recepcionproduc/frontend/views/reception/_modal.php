<?php

use kartik\form\ActiveForm;
use yii\bootstrap\Html;
use yii\bootstrap\Modal;
use kartik\select2\Select2;
use yii\web\JsExpression;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Tabs;

Modal::begin([
    'header' => '<h2>Agregar Producto</h2>' ,
    'size'   => Modal::SIZE_LARGE
]) ;

echo Tabs::widget([
    'items' => [
        [
            'label' => 'Producto Nuevo',
            'content' => $this->render('_formnewproduct',[
                            'model' => $newProduct,
                            'dataProveedor' => $dataProveedor
                        ]),
            'active' => true
        ],
        [
            'label' => 'Producto existente',
            'content' => $this->render('_formproductexist',[
                            'model' => $newProduct,
                            'dataProveedor' => $dataProveedor
                        ]),
        ],
    ],
]);
?>

<?php
Modal::end() ;
