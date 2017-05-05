<?php
/* @var $this yii\web\View */

use kartik\grid\GridView;
use app\models\ProductQuery;

//$searchModel = New ProductQuery(); 
//$dataProvider = $searchModel->search(Yii::$app->request->queryParams);
?>
<?= GridView::widget([
    'dataProvider' => $dataProvider,
//    'filterModel' => $searchModel,
    'columns'=>[
        'cod_barra',
        'marca',
        'departamento',
        'seccion',
        'familia',
        'subfamilia',
        'temporada',
        'ano',
        'capsula',
        'color',
        'talla',
        'proveedor',
        'cantidad',
        'pvptienda',
        'peso',
        'serie',
        'referencia',
        'descripcion',
        'costodist',
        'pvpmgta',
        'carac',
        'gpeso',
        'codmarca',
        'coddepto',
        'codseccion',
        'codfamilia',
        'codsubfamilia',
        'codtemporada',
        'codano',
        'codcapsula',
        'codcolor',
        'codtalla',
        'codprov',
        'descapsula',
    ]
]) ?>