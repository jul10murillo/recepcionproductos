<?php

namespace app\models;

use Yii;

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
 * @property integer $cod_barra
 * @property string $referencia
 * @property string $archivo
 *
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
            [['id_user', 'operacion', 'id_mapping'], 'required'],
            [['id_user', 'id_mapping', 'id_producto', 'acumulado', 'cantidad', 'cod_barra'], 'integer'],
            [['operacion', 'referencia', 'archivo'], 'string'],
            [['fecha'], 'safe'],
            [['id_user'], 'exist', 'skipOnError' => true, 'targetClass' => \common\models\User::className(), 'targetAttribute' => ['id_user' => 'id']],
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
            'cod_barra' => 'Cod Barra',
            'referencia' => 'Referencia',
            'archivo' => 'Archivo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdUser()
    {
        return $this->hasOne(\common\models\User::className(), ['id' => 'id_user']);
    }
}
