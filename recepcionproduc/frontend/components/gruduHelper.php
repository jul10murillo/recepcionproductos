<?php

namespace app\components;
 
 
use Yii;
use yii\base\Component;
use yii\base\InvalidConfigException;
use ruskid\csvimporter\CSVImporter;
use ruskid\csvimporter\CSVReader;
use ruskid\csvimporter\MultipleImportStrategy; 
use yii\helpers\Url;

class gruduHelper extends Component {

    public function processCsv() {
        $importer = new CSVImporter;
        
        $importer->setData(new CSVReader([
                        'filename' => $_FILES['archivo']['tmp_name'],
                        'fgetcsvOptions' => [
                            'delimiter' => '/',
                            'enclosure'=>'*'
                        ],
                        'startFromLine'=>3
                    ]));

        try {
            $numberRowsAffected = $importer->import(new MultipleImportStrategy([
            'tableName' => 'product_prev',
            'configs' => [
                [
                    'attribute' => 'cod_barra',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[17];
                    },
                    'unique' => true,
                ],
                [
                    'attribute' => 'marca',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[0];
                    },
                ],
                [
                    'attribute' => 'departamento',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[1];
                    },
                ],
                [
                    'attribute' => 'seccion',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[2];
                    },
                ],
                [
                    'attribute' => 'familia',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[3];
                    },
                ],
                [
                    'attribute' => 'subfamilia',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[4];
                    },
                ],
                [
                    'attribute' => 'temporada',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[5];
                    },
                ],
                [
                    'attribute' => 'ano',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[6];
                    },
                ],
                [
                    'attribute' => 'capsula',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[7];
                    },
                ],
                [
                    'attribute' => 'color',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[8];
                    },
                ],
                [
                    'attribute' => 'talla',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[9];
                    },
                ],
                [
                    'attribute' => 'proveedor',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[10];
                    },
                ],
                [
                    'attribute' => 'cantidad',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[11];
                    },
                ],
                [
                    'attribute' => 'pvptienda',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[12];
                    },
                ],
                [
                    'attribute' => 'peso',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[13];
                    },
                ],
                [
                    'attribute' => 'serie',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[14];
                    },
                ],
                [
                    'attribute' => 'referencia',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[15];
                    },
                ],
                [
                    'attribute' => 'descripcion',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[16];
                    },
                ],
                [
                    'attribute' => 'costodist',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[18];
                    },
                ],
                [
                    'attribute' => 'pvpmgta',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[19];
                    },
                ],
                [
                    'attribute' => 'carac',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[20];
                    },
                ],
                [
                    'attribute' => 'gpeso',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[21];
                    },
                ],
                [
                    'attribute' => 'codmarca',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[22];
                    },
                ],
                [
                    'attribute' => 'coddepto',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[23];
                    },
                ],
                [
                    'attribute' => 'codseccion',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[24];
                    },
                ],
                [
                    'attribute' => 'codfamilia',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[25];
                    },
                ],
                [
                    'attribute' => 'codsubfamilia',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[26];
                    },
                ],
                [
                    'attribute' => 'codtemporada',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[27];
                    },
                ],
                [
                    'attribute' => 'codano',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[28];
                    },
                ],
                [
                    'attribute' => 'codcapsula',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[29];
                    },
                ],
                [
                    'attribute' => 'codcolor',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[30];
                    },
                ],
                [
                    'attribute' => 'codtalla',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[31];
                    },
                ],
                [
                    'attribute' => 'codprov',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[32];
                    },
                ],
                [
                    'attribute' => 'descapsula',
                    'value' => function($line) {
                        $value = explode(',', $line[0]);
                        return $value[33];
                    },
                ],
            ],
        ]));
        
        return true;
        
        } catch (\yii\base\ErrorException $ex) {
            return false;
        }
    }
    
    /**
     * Set marca
     * @param type $M
     * @return string
     */
    public function setBrand($M){
        switch ($M){
                case '1':
                    $marca = 'Aishop';
                    break ;
                case '2':
                    $marca = 'Exotik';
                    break ;
                case '3':
                    $marca = 'Vesimenta';
                    break ;
                case '4':
                    $marca = 'Xinfoni';
                    break ;
            }
        return $marca;
    }

}
