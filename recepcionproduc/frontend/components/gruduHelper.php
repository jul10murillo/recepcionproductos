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
use yii\db\Query ; 
use yii\helpers\ArrayHelper ;


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
        $marca = (new \yii\db\Query())
                ->select('nombre')
                ->from('marca')
                ->where(['id' => $M])
                ->one() ;
        return $marca['nombre'] ;
    }
    
    /**
     * 
     * @param type $id
     * @return type
     */
    public function getDataProveedor($id) {
        $result = ( new Query())
                ->select('*')
                ->from('proveedor')
                ->where(['idmarca'=>$id])
                ->all();
        return ArrayHelper::map($result, 'codproveedor', 'nombre');
        
    }

    /**
     * 
     * @return string
     */
    public function getDataDepartamento() {
        
        $result = ( new Query())
                ->select('*')
                ->from('departamento')
                ->all();
                
        return ArrayHelper::map($result, 'coddepartamento', 'nombre');
        
    }

    /**
     * 
     * @return string
     */
    public function getDataSeccion() {
        $result = ( new Query())
                ->select('*')
                ->from('seccion')
                ->all();
                
        return ArrayHelper::map($result, 'codseccion', 'nombre');
        
    }

    /**
     * 
     * @return string
     */
    public function getDataTemporada() {
        $result = ( new Query())
                ->select('*')
                ->from('temporada')
                ->all();
                
        return ArrayHelper::map($result, 'codtemporada', 'nombre');

    }

    /**
     * 
     * @return string
     */
    public function getDataAno() {
        $result = ( new Query())
                ->select('*')
                ->from('ano')
                ->all();
                
        return ArrayHelper::map($result, 'codano', 'nombre');
    }

    /**
     * 
     * @return string
     */
    public function getDataCapsula() {
        $result = ( new Query())
                ->select('*')
                ->from('capsula')
                ->all();
                
        return ArrayHelper::map($result, 'id', 'nombre');
    }

    /**
     * 
     * @return string
     */
    public function getDataTalla() {
        
        $result = ( new Query())
                ->select('*')
                ->from('talla')
                ->all();
                
        return ArrayHelper::map($result, 'id', 'nombre');
       
    }

    /**
     * 
     * @return string
     */
    public function getSubFamilia() {
        $result = ( new Query())
                ->select('*')
                ->from('subfamilia')
                ->all();
                
        return ArrayHelper::map($result, 'id', 'codsubfamilia');
    }

    /**
     * 
     * @return string
     */
    public function getFamiliaInicial() {
        $result = ( new Query())
                ->select('*')
                ->from('familia')
                ->all();
        
        foreach ($result as $key => $value) {
            $dataFamilia[] = [
                'text' => $value['nombre'] ,
                'id' => $value['nombre'].'-'.$value['codfamilia'] ,
            ] ;
        }
        
        return $dataFamilia ;
    }

    /**
     * 
     * @return string
     */
    public function getDataColor() {
        $result = ( new Query())
                ->select('*')
                ->from('color')
                ->all();
                
        return ArrayHelper::map($result, 'codcolor', 'nombre');
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
    
    public function getDepartamento($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('departamento')
                ->where(['coddepartamento'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
    public function getSeccion($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('seccion')
                ->where(['codseccion'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
    public function getTemporada($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('temporada')
                ->where(['codtemporada'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
    public function getAno($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('ano')
                ->where(['codano'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
    public function getCapsula($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('capsula')
                ->where(['id'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
    public function getCapsulaCod($id) {
        $result = ( new Query())
                ->select('capsulacol')
                ->from('capsula')
                ->where(['id'=>$id])
                ->one();
                
        return $result['capsulacol'];
    }
    
    public function getColor($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('color')
                ->where(['codcolor'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
    public function getTalla($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('talla')
                ->where(['id'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    public function getTallaCod($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('talla')
                ->where(['id'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
    public function getProveedor($id) {
        $result = ( new Query())
                ->select('nombre')
                ->from('proveedor')
                ->where(['codproveedor'=>$id])
                ->one();
                
        return $result['nombre'];
    }
    
//    public function getProveedorCod($id) {
//        $result = ( new Query())
//                ->select('nombre')
//                ->from('proveedor')
//                ->where(['codproveedor'=>$id])
//                ->one();
//                
//        return $result['nombre'];
//    }

}
