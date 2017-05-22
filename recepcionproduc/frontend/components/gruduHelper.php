<?php

namespace app\components ;

use Yii ;
use yii\base\Component ;
use yii\base\InvalidConfigException ;
use ruskid\csvimporter\CSVImporter ;
use ruskid\csvimporter\CSVReader ;
use ruskid\csvimporter\MultipleImportStrategy ;
use yii\helpers\Url ;
use app\models\Log ;


class gruduHelper extends Component {

    public function processCsv() {
        $importer = new CSVImporter ;

        $importer->setData(new CSVReader([
            'filename'       => $_FILES['archivo']['tmp_name'] ,
            'fgetcsvOptions' => [
                'delimiter' => '/' ,
                'enclosure' => '*'
            ] ,
            'startFromLine'  => 3
        ])) ;

        try {
            $numberRowsAffected = $importer->import(new MultipleImportStrategy([
                'tableName' => 'product_prev' ,
                'configs'   => [
                    [
                        'attribute' => 'cod_barra' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[17] ;
                        } ,
                        'unique' => true ,
                    ] ,
                    [
                        'attribute' => 'marca' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[0] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'departamento' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[1] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'seccion' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[2] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'familia' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[3] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'subfamilia' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[4] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'temporada' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[5] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'ano' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[6] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'capsula' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[7] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'color' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[8] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'talla' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[9] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'proveedor' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[10] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'cantidad' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[11] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'pvptienda' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[12] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'peso' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[13] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'serie' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[14] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'referencia' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[15] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'descripcion' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[16] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'costodist' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[18] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'pvpmgta' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[19] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'carac' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[20] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'gpeso' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[21] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codmarca' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[22] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'coddepto' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[23] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codseccion' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[24] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codfamilia' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[25] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codsubfamilia' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[26] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codtemporada' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[27] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codano' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[28] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codcapsula' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[29] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codcolor' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[30] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codtalla' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[31] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'codprov' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[32] ;
                        } ,
                    ] ,
                    [
                        'attribute' => 'descapsula' ,
                        'value'     => function($line) {
                            $value = explode(',' , $line[0]) ;
                            return $value[33] ;
                        } ,
                    ] ,
                ] ,
                    ])) ;

            return true ;
        } catch (\yii\base\ErrorException $ex) {
            return false ;
        }
    }

    /**
     * Set marca
     * @param type $M
     * @return string
     */
    public function setBrand($M) {
        switch ($M) {
            case '1':
                $marca = 'Aishop' ;
                break ;
            case '2':
                $marca = 'Exotik' ;
                break ;
            case '3':
                $marca = 'Vesimenta' ;
                break ;
            case '4':
                $marca = 'Xinfoni' ;
                break ;
        }
        return $marca ;
    }

    /**
     * 
     * @return string
     */
    public function getDataDepartamento() {
        return [
            '' => '' ,
            'WOMAN-1' => 'WOMAN' ,
            'MAN-2'   => 'MAN' ,
            'KIDS-3'  => 'KIDS' ,
            'BABY-4'  => 'BABY' ,
                ] ;
    }

    /**
     * 
     * @return string
     */
    public function getDataSeccion() {
        return [
            ''      => '' ,
            'TEXTIL-1'      => 'TEXTIL' ,
            'SHOES-2'       => 'SHOES' ,
            'JEWELRY-3'     => 'JEWELRY' ,
            'ACCESSORIES-4' => 'ACCESSORIES' ,
                ] ;
    }

    /**
     * 
     * @return string
     */
    public function getDataTemporada() {
        return [
            ''  => '' ,
            'SPRING-S'  => 'SPRING' ,
            'SUMMER-U'  => 'SUMMER' ,
            'FALL-F'    => 'FALL' ,
            'WINTER-W'  => 'WINTER' ,
            'HOLIDAY-H' => 'HOLIDAY' ,
            'RESORT-R'  => 'RESORT' ,
            'TRAVEL-T'  => 'TRAVEL' ,
                ] ;
    }

    /**
     * 
     * @return string
     */
    public function getDataAno() {
        return [
            '' => '' ,
            '2015-15' => '2015' ,
            '2016-16' => '2016' ,
            '2017-17' => '2017' ,
            '2018-18' => '2018' ,
                ] ;
    }

    /**
     * 
     * @return string
     */
    public function getDataCapsula() {
        return [
            ''   => '' ,
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
    }

    /**
     * 
     * @return string
     */
    public function getDataTalla() {
        return [
            ''       => '' ,
            'XS-01'       => 'XS' ,
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
    }

    /**
     * 
     * @return string
     */
    public function getSubFamilia() {
        for ($i = 0 ; $i <= 999 ; $i++) {
            $value            = str_pad($i , 3 , 0 , STR_PAD_LEFT) ;
            $dataSubFamilia[] = [
                'id'   => $value ,
                'text' => $value ,
                    ] ;
        }
        return $dataSubFamilia ;
    }

    /**
     * 
     * @return string
     */
    public function getFamiliaInicial() {
        $dataFamilia = [
            [
                'text' => 'BLOUSE' ,
                'id'   => 'BLOUSE-01' ,
            ] ,
            [
                'text' => 'TOP' ,
                'id'   => 'TOP-02' ,
            ] ,
            [
                'text' => 'SHIRT' ,
                'id'   => 'SHIRT-04' ,
            ] ,
            [
                'text' => 'SWEATER' ,
                'id'   => 'SWEATER-05' ,
            ] ,
            [
                'text' => 'JACKET' ,
                'id'   => 'JACKET-06' ,
            ] ,
            [
                'text' => 'BLAZER' ,
                'id'   => 'BLAZER-07' ,
            ] ,
            [
                'text' => 'VEST' ,
                'id'   => 'VEST-08' ,
            ] ,
            [
                'text' => 'COAT' ,
                'id'   => 'COAT-09' ,
            ] ,
            [
                'text' => 'PANT' ,
                'id'   => 'PANT-10' ,
            ] ,
            [
                'text' => 'JEAN' ,
                'id'   => 'JEAN-11' ,
            ] ,
            [
                'text' => 'JOGGER' ,
                'id'   => 'JOGGER-12' ,
            ] ,
            [
                'text' => 'SHORT' ,
                'id'   => 'SHORT-13' ,
            ] ,
            [
                'text' => 'SET' ,
                'id'   => 'SET-14' ,
            ] ,
            [
                'text' => 'SKIRT' ,
                'id'   => 'SKIRT-15' ,
            ] ,
            [
                'text' => 'JUMPER' ,
                'id'   => 'JUMPER-16' ,
            ] ,
            [
                'text' => 'DRESS' ,
                'id'   => 'DRESS-17' ,
            ] ,
            [
                'text' => 'JUMPSUIT' ,
                'id'   => 'JUMPSUIT-18' ,
            ] ,
            [
                'text' => 'CARDIGAN' ,
                'id'   => 'CARDIGAN-19' ,
            ] ,
            [
                'text' => 'LEGGING' ,
                'id'   => 'LEGGING-20' ,
            ] ,
            [
                'text' => 'POLO' ,
                'id'   => 'POLO-21' ,
            ] ,
                ] ;
        return $dataFamilia ;
    }

    /**
     * 
     * @return string
     */
    public function getDataColor() {
        return [
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
    }
    
    
    public function setLog($param) {
        $data = [
            'id_user' => Yii::$app->user->id,
            'operacion' => $param['operacion'],
            'id_mapping' => $param['id_mapping'],
            'fecha' => date("Y-m-d H:i:s"),
            'id_producto' => isset($param['id_producto']) ? $param['id_producto'] : '',
            'acumulado' => isset($param['acumulado']) ? $param['acumulado'] : '',
            'cantidad' => isset($param['cantidad']) ? $param['cantidad'] : '',
        ];
        $log = new Log();
        $log->attributes = $data;
        $log->save();
    }

}
