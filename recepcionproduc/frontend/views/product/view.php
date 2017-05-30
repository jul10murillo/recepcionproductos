<?php
/* @var $this yii\web\View */

use kartik\grid\GridView ;
use kartik\export\ExportMenu ;
use yii\widgets\Pjax ;

?>
<div class="site-index">
    <?php
    Pjax::begin() ;
    ?>
    <?=
    ExportMenu::widget([
        'dataProvider' => $provider ,
    ]) ;
    ?>

    <?=
    GridView::widget([
        'dataProvider' => $provider ,
        'columns'      => [
        ] ,
        'toolbar'      => [
            '{export}' ,
            '{toggleData}'
        ]
    ])
    ?>
    <?php
    Pjax::end() ;
    ?>
</div>
