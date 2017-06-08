<?php

namespace app\models;

use Yii;

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
class Product extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_barra', 'marca', 'departamento', 'seccion', 'familia', 'temporada', 'ano', 'capsula', 'color', 'cantidad', 'pvptienda', 'peso', 'serie', 'referencia', 'descripcion', 'costodist', 'pvpmgta', 'gpeso', 'coddepto', 'codseccion', 'codfamilia', 'codsubfamilia', 'codano', 'codcapsula', 'codcolor', 'codtalla', 'codprov'], 'string'],
            [['id_mapping', 'acumulado'], 'integer'],
            ['cod_barra','unique'],
            [['subfamilia', 'talla', 'proveedor', 'carac', 'codmarca', 'codtemporada', 'descapsula'], 'string', 'max' => 255],
            [['id_mapping'], 'exist', 'skipOnError' => true, 'targetClass' => Mapping::className(), 'targetAttribute' => ['id_mapping' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cod_barra' => 'Cod Barra',
            'marca' => 'Marca',
            'departamento' => 'Departamento',
            'seccion' => 'Seccion',
            'familia' => 'Familia',
            'subfamilia' => 'Subfamilia',
            'temporada' => 'Temporada',
            'ano' => 'Año',
            'capsula' => 'Capsula',
            'color' => 'Color',
            'talla' => 'Talla',
            'proveedor' => 'Proveedor',
            'cantidad' => 'Cantidad',
            'pvptienda' => 'Pvptienda',
            'peso' => 'Peso',
            'serie' => 'Serie',
            'referencia' => 'Referencia',
            'descripcion' => 'Descripcion',
            'costodist' => 'Costodist',
            'pvpmgta' => 'Pvpmgta',
            'carac' => 'Carac',
            'gpeso' => 'Gpeso',
            'codmarca' => 'Codmarca',
            'coddepto' => 'Coddepto',
            'codseccion' => 'Codseccion',
            'codfamilia' => 'Codfamilia',
            'codsubfamilia' => 'Codsubfamilia',
            'codtemporada' => 'Codtemporada',
            'codano' => 'Codano',
            'codcapsula' => 'Codcapsula',
            'codcolor' => 'Codcolor',
            'codtalla' => 'Codtalla',
            'codprov' => 'Codprov',
            'descapsula' => 'Descapsula',
            'id_mapping' => 'Id Mapping',
            'acumulado' => 'Acumulado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdMapping()
    {
        return $this->hasOne(Mapping::className(), ['id' => 'id_mapping']);
    }
}
