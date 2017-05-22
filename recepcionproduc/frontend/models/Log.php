<?php

namespace app\models;

use Yii;
use common\models\User;

/**
 * This is the model class for table "log".
 *
 * @property integer $idlog
 * @property integer $id_user
 * @property string $operacion
 * @property integer $id_mapping
 * @property string $fecha
 * @property integer $id_producto
 * @property integer $acumulado
 * @property integer $cantidad
 *
 * @property Mapping $idMapping
 * @property Product $idProducto
 * @property User $idUser
 */
class Log extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'log';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_user', 'operacion', 'id_mapping', 'fecha'], 'required'],
            [['id_user', 'id_mapping', 'id_producto', 'acumulado', 'cantidad'], 'integer'],
            [['operacion'], 'string'],
            [['fecha'], 'safe'],
            [['id_mapping'], 'exist', 'skipOnError' => true, 'targetClass' => Mapping::className(), 'targetAttribute' => ['id_mapping' => 'id']],
            [['id_producto'], 'exist', 'skipOnError' => true, 'targetClass' => Product::className(), 'targetAttribute' => ['id_producto' => 'id']],
            [['id_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['id_user' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'idlog' => 'Idlog',
            'id_user' => 'Id User',
            'operacion' => 'Operacion',
            'id_mapping' => 'Id Mapping',
            'fecha' => 'Fecha',
            'id_producto' => 'Id Producto',
            'acumulado' => 'Acumulado',
            'cantidad' => 'Cantidad',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdMapping()
    {
        return $this->hasOne(Mapping::className(), ['id' => 'id_mapping']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdProducto()
    {
        return $this->hasOne(Product::className(), ['id' => 'id_producto']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdUser()
    {
        return $this->hasOne(User::className(), ['id' => 'id_user']);
    }
}
