<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mapping".
 *
 * @property integer $id
 * @property integer $id_marca
 * @property string $fecha
 * @property string $tipo
 * @property string $archivo
 *
 * @property Marca $idMarca
 * @property MappingHeader[] $mappingHeaders
 * @property Product[] $products
 */
class Mapping extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'mapping';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_marca', 'fecha', 'tipo', 'archivo'], 'required'],
            [['id_marca'], 'integer'],
            [['fecha'], 'safe'],
            [['tipo', 'archivo'], 'string'],
            [['id_marca'], 'exist', 'skipOnError' => true, 'targetClass' => Marca::className(), 'targetAttribute' => ['id_marca' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_marca' => 'Id Marca',
            'fecha' => 'Fecha',
            'tipo' => 'Tipo',
            'archivo' => 'Archivo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdMarca()
    {
        return $this->hasOne(Marca::className(), ['id' => 'id_marca']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMappingHeaders()
    {
        return $this->hasMany(MappingHeader::className(), ['id_mapping' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['id_mapping' => 'id']);
    }
}
