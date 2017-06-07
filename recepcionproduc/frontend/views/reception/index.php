<?php

/* @var $this yii\web\View */

use kartik\grid\GridView ;
use yii\bootstrap\Html ;
use yii\helpers\Url ;

$this->title = 'Recepción';
$this->params['breadcrumbs'][] = $this->title;
?>

<?=

GridView::widget([
    'dataProvider' => $dataProvider ,
    'columns'      => [
        'marca' ,
        'fecha' ,
        'tipo' ,
        'archivo' ,
        [
            'class'  => '\kartik\grid\FormulaColumn' ,
            'header' => 'Cantidad de Productos' ,
            'value'  => function ($model , $key , $index , $widget) {
                return $model->getProducts()->sum('cantidad') ;
            }
        ] ,
        [
            'class'  => '\kartik\grid\FormulaColumn' ,
            'header' => 'Acumulado de Productos' ,
            'value'  => function ($model , $key , $index , $widget) {
                return $model->getProducts()->sum('acumulado') ;
            }
        ] ,
        [
            'class'         => '\kartik\grid\ActionColumn' ,
            'template'      => '{view} {export} {delete}' ,
            'deleteOptions' => ['label' => '<i class="glyphicon glyphicon-remove"></i>'] ,
            'buttons'       => [
                'export' => function ($url , $model) {
            
                    return Html::a('<i class="glyphicon glyphicon-save-file"></i>', Url::to(['/reception/export','id'=>$model->id]),['title'=>'Exportar']);
                }
            ]
        ]
    ]
]) ;
?>