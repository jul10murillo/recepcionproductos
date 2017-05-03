<?php

use yii\db\Schema;
use yii\db\Migration;


class m170502_143609_product extends Migration
{
    public function up()
    {
        
        $this->createTable('product', [
            'id' => Schema::TYPE_PK,
            'cod_barra' => Schema::TYPE_TEXT,
            'marca' => Schema::TYPE_TEXT,
            'departamento' => Schema::TYPE_TEXT,
            'seccion' => Schema::TYPE_TEXT,
            'familia' => Schema::TYPE_TEXT,
            'subfamilia' => Schema::TYPE_STRING,
            'temporada' => Schema::TYPE_TEXT,
            'ano' => Schema::TYPE_TEXT,
            'capsula' => Schema::TYPE_TEXT,
            'color' => Schema::TYPE_TEXT,
            'talla' => Schema::TYPE_STRING,
            'proveedor' => Schema::TYPE_STRING,
            'cantidad' => Schema::TYPE_TEXT,
            'pvptienda' => Schema::TYPE_TEXT,
            'peso' => Schema::TYPE_TEXT,
            'serie' => Schema::TYPE_TEXT,
            'referencia' => Schema::TYPE_TEXT,
            'descripcion' => Schema::TYPE_TEXT,
            'costodist' => Schema::TYPE_TEXT,
            'pvpmgta' => Schema::TYPE_TEXT,
            'carac' => Schema::TYPE_STRING,
            'gpeso' => Schema::TYPE_TEXT,
            'codmarca' => Schema::TYPE_STRING,
            'coddepto' => Schema::TYPE_TEXT,
            'codseccion' => Schema::TYPE_TEXT,
            'codfamilia' => Schema::TYPE_TEXT,
            'codsubfamilia' => Schema::TYPE_TEXT,
            'codtemporada' => Schema::TYPE_STRING,
            'codano' => Schema::TYPE_TEXT,
            'codcapsula' => Schema::TYPE_TEXT,
            'codcolor' => Schema::TYPE_TEXT,
            'codtalla' => Schema::TYPE_TEXT,
            'codprov' => Schema::TYPE_TEXT,
            'descapsula' => Schema::TYPE_STRING,
        ]);
        
    }

    public function down()
    {
        $this->dropTable('product');
    }

    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }

    public function safeDown()
    {
    }
    */
}
