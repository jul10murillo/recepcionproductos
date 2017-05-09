<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mapping".
 *
 * @property integer $id
 * @property string $marca
 * @property string $fecha
 * @property string $tipo
 * @property string $archivo
 *
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
            [['marca', 'fecha', 'tipo','archivo'], 'required'],
            [['marca', 'tipo','archivo'], 'string'],
            [['fecha','archivo'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'marca' => 'Marca',
            'fecha' => 'Fecha',
            'tipo' => 'Tipo',
            'archivo' => 'Archivo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['id_mapping' => 'id']);
    }
}
