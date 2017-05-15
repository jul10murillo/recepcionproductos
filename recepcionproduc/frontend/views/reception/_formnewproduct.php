<?php

use kartik\form\ActiveForm;
use yii\bootstrap\Html;
use yii\bootstrap\Modal;
use kartik\select2\Select2;
use yii\web\JsExpression;
use yii\helpers\ArrayHelper;


$dataDepartamento = [
    'WOMAN-1' => 'WOMAN' ,
    'MAN-2'   => 'MAN' ,
    'KIDS-3'  => 'KIDS' ,
    'BABY-4'  => 'BABY' ,
] ;

$dataSeccion = [
    'TEXTIL-1'      => 'TEXTIL' ,
    'SHOES-2'       => 'SHOES' ,
    'JEWELRY-3'     => 'JEWELRY' ,
    'ACCESSORIES-4' => 'ACCESSORIES' ,
] ;
$data = [
    ''=>''
] ;
$dataTemporada = [
    'SPRING-S'  => 'SPRING' ,
    'SUMMER-U'  => 'SUMMER' ,
    'FALL-F'    => 'FALL' ,
    'WINTER-W'  => 'WINTER' ,
    'HOLIDAY-H' => 'HOLIDAY' ,
    'RESORT-R'  => 'RESORT' ,
    'TRAVEL-T'  => 'TRAVEL' ,
    ] ;
$dataAno = [
    '2015-15'  => '2015',
    '2016-16'  => '2016',
    '2017-17'  => '2017',
    '2018-18'  => '2018',
    ] ;
$dataCapsula = [
    'JANUARY-1'   => 'JANUARY' ,
    'FEBRUARY-2'  => 'FEBRUARY' ,
    'MARCH-3'     => 'MARCH' ,
    'APRIL-1'     => 'APRIL' ,
    'MAY-2'       => 'MAY' ,
    'JUNE-3'      => 'JUNE' ,
    'JULY-1'      => 'JULY' ,
    'AUGUST-2'    => 'AUGUST' ,
    'SEPTEMBER-3' => 'SEPTEMBER' ,
    'OCTOBER-1'   => 'OCTOBER' ,
    'NOVEMBER-2'  => 'NOVEMBER' ,
    'DECEMBER-3'  => 'DECEMBER' ,
    ] ;
$dataTalla = [
    'XS-01'       => 'XS',
    'S-02'        => 'S' ,
    'M-03'        => 'M' ,
    'L-04'        => 'L' ,
    'XL-05'       => 'XL' ,
    'ONE SIZE-06' => 'ONE SIZE' ,
    '26-07'       => '26' ,
    '27-08'       => '27' ,
    '28-09'       => '28' ,
    '29-10'       => '29' ,
    '30-11'       => '30' ,
    ] ;
$dataColor     = [
    'WHITE-01'         => 'WHITE' ,
    'OFF WHITE-02'     => 'OFF' ,
    'IVORY-03'         => 'IVORY' ,
    'WHITE PRINT-05'   => 'WHITE PRINT' ,
    'BLUE PRINT-08'    => 'BLUE PRINT' ,
    'AQUA-09'          => 'AQUA' ,
    'BLUE-10'          => 'BLUE' ,
    'DEEP BLUE-11'     => 'DEEP BLUE' ,
    'LIGHT BLUE-12'    => 'LIGHT BLUE' ,
    'SKY BLUE-13'      => 'SKY BLUE' ,
    'BLUE GREY-14'     => 'BLUE GREY' ,
    'INDIGO-15'        => 'INDIGO' ,
    'NAVY-16'          => 'NAVY' ,
    'TURQUOISE-17'     => 'TURQUOISE' ,
    'YELLOW-20'        => 'YELLOW' ,
    'MUSTARD-21'       => 'MUSTARD' ,
    'APRICOT-22'       => 'APRICOT' ,
    'LEMON-23'         => 'LEMON' ,
    'YELLOW PRINT-24'  => 'YELLOW PRINT' ,
    'ORANGE-30'        => 'ORANGE' ,
    'ORANGE PRINT-31'  => 'ORANGE PRINT' ,
    'RED PRINT-38'     => 'RED PRINT' ,
    'BRICK-39'         => 'BRICK' ,
    'RED-40'           => 'RED' ,
    'CORAL-41'         => 'CORAL' ,
    'RUST-42'          => 'RUST' ,
    'ROSE-43'          => 'ROSE' ,
    'WINE-44'          => 'WINE' ,
    'PEACH-45'         => 'PEACH' ,
    'PINK PRINT-49'    => 'PINK PRINT' ,
    'PINK-50'          => 'PINK' ,
    'DUST PINK-51'     => 'DUST PINK' ,
    'LIGHT PINK-52'    => 'LIGHT PINK' ,
    'FUSCHIA-53'       => 'FUSCHIA' ,
    'LILY-54'          => 'LILY' ,
    'PURPLE-55'        => 'PURPLE' ,
    'LIGHT PURPLE-56'  => 'LIGHT PURPLE' ,
    'GREEN PRINT-59'   => 'GREEN PRINT' ,
    'GREEN-60'         => 'GREEN' ,
    'OLIVE-61'         => 'OLIVE' ,
    'EMERALD-62'       => 'EMERALD' ,
    'LIGHT GREEN-63'   => 'LIGHT GREEN' ,
    'ARMY GREEN-64'    => 'ARMY GREEN' ,
    'LIME-65'          => 'LIME' ,
    'BEIGE PRINT-68'   => 'BEIGE PRINT' ,
    'DUST-69'          => 'DUST' ,
    'BROWN-70'         => 'BROWN' ,
    'CAMEL-71'         => 'CAMEL' ,
    'KHAKI-72'         => 'KHAKI' ,
    'BEIGE-73'         => 'BEIGE' ,
    'NUDE-74'          => 'NUDE' ,
    'TAUPE-75'         => 'TAUPE' ,
    'TAN-76'           => 'TAN' ,
    'COFFEE-77'        => 'COFFEE' ,
    'BROWN PRINT-78'   => 'BROWN PRINT' ,
    'BLACK-80'         => 'BLACK' ,
    'CHARCOAL-81'      => 'CHARCOAL' ,
    'GREY-82'          => 'GREY' ,
    'SILVER PRINT-83'  => 'SILVER PRINT' ,
    'GOLD PRINT-84'    => 'GOLD PRINT' ,
    'PEWTER-85'        => 'PEWTER' ,
    'BLACK PRINT-86'   => 'BLACK PRINT' ,
    'LIGHT GREY-87'    => 'LIGHT GREY' ,
    'GREY PRINT-88'    => 'GREY' ,
    'MULTI-90'         => 'MULTI' ,
    'SNAKE-91'         => 'SNAKE' ,
    'METALLICS-92'     => 'METALLICS' ,
    'MULTI NEON-93'    => 'MULTI NEON' ,
    'MULTI PASTEL-94'  => 'MULTI PASTEL' ,
    'GOLD+SILVER-95'   => 'GOLD' ,
    'BLACK & WHITE-96' => 'BLACK & WHITE' ,
    'ANIMAL PRINT-97'  => 'ANIMAL PRINT' ,
    'GOLD-98'          => 'GOLD' ,
    'SILVER-99'        => 'SILVER' ,
        ] ;

for ($i = 0; $i <= 999; $i++) {
    $value = str_pad($i,3,0,STR_PAD_LEFT);
    $dataSubFamilia[] = [
        'id' => $value,
        'text' => $value,
        ] ;
}
//print_r($dataSubFamilia);exit;
$urlFamilia = yii\helpers\Url::to(['/recepction/getFamilia']);

$form = ActiveForm::begin(
        [
            'type' => ActiveForm::TYPE_HORIZONTAL,
            'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_SMALL]
        ]
        ) ;
?>
<div class="col-lg-6">
    <?= $form->field($model,'cod_barra')?>
    <?= $form->field($model,'departamento')->dropDownList($dataDepartamento, [
        'options' => ['placeholder' => 'Seleccionar Departamento ...'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]); ?>
    <?= $form->field($model,'familia')->dropDownList($data, [
        'options' => ['placeholder' => 'Seleccionar Familia ...'],
        'onchange'=>'
                $.post( "'.yii\helpers\Url::to(['reception/subfamiliadata']).'", { id: $(this).val() })
                    .done(function(data) {
                        $( "#product-familia" ).html( data );
                    });'
        ]); 
        ?>
    <?= $form->field($model,'temporada')->dropDownList($dataTemporada, [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'],
        ]); ?>
    <?= $form->field($model,'capsula')->dropDownList($dataCapsula, [
        'options' => ['placeholder' => 'Seleccionar Capsula ...'],
        ]); ?>
    <?= $form->field($model,'talla')->dropDownList($dataTalla, [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'],
        ]); ?>
    <?= $form->field($model,'cantidad') ?>
    <?= $form->field($model,'carac') ?>
</div>
<div class="col-lg-6">
    <?= $form->field($model,'marca')->textInput(['readonly' => true]) ?>
    <?= $form->field($model,'seccion')->dropDownList($dataSeccion, [
        'options' => ['placeholder' => 'Seleccionar Sección ...'],
        'onchange'=>'
                $.post( "'.yii\helpers\Url::to(['reception/familiadata']).'", { id: $(this).val() })
                    .done(function(data) {
                        $( "#product-familia" ).html( data );
                    });'
    ]); ?>
    <?= $form->field($model,'subfamilia')->dropDownList(ArrayHelper::map($dataSubFamilia, 'id' , 'text'), [
        'options' => ['placeholder' => 'Seleccionar Subfamilia ...'],
        ]); ?>
    <?= $form->field($model,'ano')->dropDownList($dataAno, [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'],
        ]); ?>
    <?= $form->field($model,'descapsula') ?>
    <?= $form->field($model,'color')->dropDownList($dataColor, [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'],
        ]); ?>
    <?= $form->field($model,'proveedor')->dropDownList(ArrayHelper::map($dataProveedor, 'id' , 'text'), [
        'options' => ['placeholder' => 'Seleccionar Proveedor ...'],
        ]); ?>
    <?= $form->field($model,'descripcion') ?>
    <?= $form->field($model,'id_mapping')->hiddenInput()->label(false); ?>
    
</div>




<div class="form-group">
    <?= Html::submitButton('Submit' , ['class' => 'btn btn-primary']) ?>
</div>
<?php ActiveForm::end() ; ?>
