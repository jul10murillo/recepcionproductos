<?php

/* @var $this yii\web\View */

use kartik\grid\GridView ;
use yii\helpers\Html ;
use kartik\export\ExportMenu;
?>

<h2>
    Log de cargas de Mapping
</h2>
<?=

ExportMenu::widget([
    'dataProvider' => $dataProvider ,
    'columns'      => [
        'idUser.username' ,
        'idMapping.archivo' ,
        'operacion' ,
        'fecha' ,
    ] ,
    'exportConfig' => [
        ExportMenu::FORMAT_CSV => false ,
        ExportMenu::FORMAT_EXCEL_X => false ,
        ExportMenu::FORMAT_HTML => false ,
        ExportMenu::FORMAT_PDF => false ,
        ExportMenu::FORMAT_TEXT => false ,
        ExportMenu::FORMAT_EXCEL => [
            'label' => 'Excel',
            'filename'=>'s'
        ],
    ] ,
])
?>
<?=

GridView::widget([
    'dataProvider'  => $dataProvider ,
    'columns'       => [
        'idUser.username' ,
        'idMapping.archivo' ,
        'operacion' ,
        'fecha' ,
    ] ,
    'toolbar' => [
        '{export}' ,
    ] ,

]) ;
?>