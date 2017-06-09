<?php

/* @var $this yii\web\View */

use kartik\grid\GridView ;
use yii\bootstrap\Html ;
use yii\helpers\Url ;
use kartik\export\ExportMenu ;
use yii\data\ActiveDataProvider ;
use app\models\Product ;

$this->title                   = 'Recepción' ;
$this->params['breadcrumbs'][] = $this->title ;
?>

<?=

GridView::widget([
    'dataProvider' => $dataProvider,
    'columns'      => [
        'marca',
        'fecha',
        'tipo',
        'archivo',
        [
            'class'  => '\kartik\grid\FormulaColumn',
            'header' => 'Cantidad de Productos',
            'value'  => function ($model, $key, $index, $widget) {
                return $model->getProducts()->sum('cantidad') ;
            }
        ],
        [
            'class'  => '\kartik\grid\FormulaColumn',
            'header' => 'Acumulado de Productos',
            'value'  => function ($model, $key, $index, $widget) {
                return $model->getProducts()->sum('acumulado') ;
            }
        ],
        [
            'class'         => '\kartik\grid\ActionColumn',
            'template'      => '{view} {export} {delete}',
            'deleteOptions' => ['label' => '<i class="glyphicon glyphicon-remove"></i>'],
            'buttons'       => [
                'export' => function ($url, $model) {
//                    $dataProvider = new ActiveDataProvider([
//                        'query' => Product::find()->where(['id_mapping' => $model->id]),
//                            ]) ;
//
//                    return ExportMenu::widget([
//                                'dataProvider' => $dataProvider,
//                                'columns'      => [
//                                    'cod_barra',
//                                    'marca',
//                                    'departamento',
//                                    'seccion',
//                                    'familia',
//                                    'subfamilia',
//                                    'temporada',
//                                    'ano',
//                                    'capsula',
//                                    'color',
//                                    'talla',
//                                    'proveedor',
//                                    'cantidad',
//                                    'pvptienda',
//                                    'peso',
//                                    'serie',
//                                    'referencia',
//                                    'descripcion',
//                                    'costodist',
//                                    'pvpmgta',
//                                    'carac',
//                                    'gpeso',
//                                    'codmarca',
//                                    'coddepto',
//                                    'codseccion',
//                                    'codfamilia',
//                                    'codsubfamilia',
//                                    'codtemporada',
//                                    'codano',
//                                    'codcapsula',
//                                    'codcolor',
//                                    'codtalla',
//                                    'codprov',
//                                    'descapsula',
//                                    'acumulado'
//                                ],
//                                'fontAwesome'  => true,
//                            ]) ;
//                    ;
                    return Html::a('<i class="glyphicon glyphicon-save-file"></i>', Url::to(['/reception/export','id'=>$model->id]),['title'=>'Exportar']);
                }
            ]
        ]
    ]
]) ;
?>