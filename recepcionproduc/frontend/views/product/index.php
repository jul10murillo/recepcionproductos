<?php
/* @var $this yii\web\View */

use kartik\grid\GridView ;
use kartik\export\ExportMenu ;
use yii\bootstrap\Nav;
?>
<div class="site-index">
    <h2>
        Marcas
    </h2>
    <div class="col-lg-4 col-lg-offset-4 ">
        <?=
        Nav::widget([
            'items'   => $items,
            'options' => ['class' => 'nav nav-pills nav-stacked nav-custom'] , // set this to nav-tab to get tab-styled navigation
        ]) ;
        ?>
    </div>
    
</div>
