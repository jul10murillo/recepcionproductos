<?php

namespace app\models ;

use Yii ;

/**
 * This is the model class for table "product".
 *
 * @property integer $id
 * @property string $cod_barra
 * @property string $marca
 * @property string $departamento
 * @property string $seccion
 * @property string $familia
 * @property string $subfamilia
 * @property string $temporada
 * @property string $ano
 * @property string $capsula
 * @property string $color
 * @property string $talla
 * @property string $proveedor
 * @property string $cantidad
 * @property string $pvptienda
 * @property string $peso
 * @property string $serie
 * @property string $referencia
 * @property string $descripcion
 * @property string $costodist
 * @property string $pvpmgta
 * @property string $carac
 * @property string $gpeso
 * @property string $codmarca
 * @property string $coddepto
 * @property string $codseccion
 * @property string $codfamilia
 * @property string $codsubfamilia
 * @property string $codtemporada
 * @property string $codano
 * @property string $codcapsula
 * @property string $codcolor
 * @property string $codtalla
 * @property string $codprov
 * @property string $descapsula
 * @property integer $id_mapping
 * @property integer $acumulado
 *
 * @property Mapping $idMapping
 */
class Productnew extends \yii\base\Model {

    public $cod_barra ;
    public $marca ;
    public $departamento ;
    public $seccion ;
    public $familia ;
    public $subfamilia ;
    public $temporada ;
    public $ano ;
    public $capsula ;
    public $color ;
    public $talla ;
    public $proveedor ;
    public $cantidad ;
    public $referencia ;
    public $descripcion ;
    public $descapsula ;
    public $carac ;
    public $id_mapping ;

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['cod_barra','marca','departamento','seccion','familia','subfamilia','temporada','ano','capsula','color','talla','proveedor','cantidad','referencia','descripcion'] , 'required'] ,
            [['cod_barra','cantidad'] , 'integer'] ,
            [['capsula' , 'referencia', 'familia' , 'subfamilia' , 'talla' , 'proveedor' , 'carac' , 'descapsula'] , 'string' , 'max' => 255] ,
        ] ;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'cod_barra'    => 'Cod Barra' ,
            'marca'        => 'Marca' ,
            'departamento' => 'Departamento' ,
            'seccion'      => 'Seccion' ,
            'familia'      => 'Familia' ,
            'subfamilia'   => 'Subfamilia' ,
            'temporada'    => 'Temporada' ,
            'ano'          => 'Año' ,
            'capsula'      => 'Capsula' ,
            'color'        => 'Color' ,
            'talla'        => 'Talla' ,
            'proveedor'    => 'Proveedor' ,
            'cantidad'     => 'Cantidad' ,
            'referencia'   => 'Referencia' ,
            'descripcion'  => 'Descripcion' ,
            'descapsula'   => 'Descapsula' ,
        ] ;
    }

}
