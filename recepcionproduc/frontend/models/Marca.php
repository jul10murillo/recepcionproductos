<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "marca".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $codmarca
 *
 * @property Mapping[] $mappings
 * @property Proveedor[] $proveedors
 */
class Marca extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'marca';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'codmarca'], 'required'],
            [['nombre', 'codmarca'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre',
            'codmarca' => 'Codmarca',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMappings()
    {
        return $this->hasMany(Mapping::className(), ['id_marca' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProveedors()
    {
        return $this->hasMany(Proveedor::className(), ['idmarca' => 'id']);
    }
}
