<?php

namespace frontend\controllers ;

use Yii ;
use app\models\Mapping ;
use yii\data\ActiveDataProvider ;
use app\models\Product ;
use yii\helpers\Json ;
use yii\helpers\Url ;
use yii\db\Query ;
use yii\widgets\ActiveForm ;
use yii\web\Response ;
use app\models\Productnew ;
use yii\filters\AccessControl ;

class ReceptionController extends \yii\web\Controller {

    public function behaviors() {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only'  => ['delete', 'export', 'getrefererencia', 'index', 'post-acum', 'view', 'test', 'setcountref'],
                'rules' => [
                    [
                        'actions' => ['delete', 'export', 'getrefererencia', 'index', 'post-acum', 'view', 'test', 'setcountref'],
                        'allow'   => true,
                        'roles'   => ['@'],
                    ],
                    [
                        'actions' => ['delete', 'export', 'getrefererencia', 'index', 'post-acum', 'view', 'setcountref'],
                        'allow'   => false,
                        'roles'   => ['?'],
                    ],
                ],
            ],
                ] ;
    }

    /**
     * 
     * @return type
     */
    public function actionIndex() {
        $dataProvider = new ActiveDataProvider([
            'query' => Mapping::find(),
                ]) ;

        return $this->render('index', [
                    'dataProvider' => $dataProvider
                ]) ;
    }

    /**
     * 
     */
    public function actionView($id) {
        $mapping = Mapping::find()->where(['id' => $id])->one() ;
        $product = Product::find()->where(['id_mapping' => $id])->andWhere(['not', ['acumulado' => null]])->all() ;


        $newProduct  = new Productnew ;
        $newProduct1 = new \app\models\Productexist ;

        $dataProveedor = Yii::$app->gruduHelper->getDataProveedor($id) ;

        $sumProduct  = Product::find()->where(['id_mapping' => $id])->sum('cantidad') ;
        $acumProduct = Product::find()->where(['id_mapping' => $id])->sum('acumulado') ;

        if (Yii::$app->request->isAjax && $newProduct1->load(Yii::$app->request->post()))
        {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON ;

            $error = json_encode(ActiveForm::validate($newProduct1)) ;

            if ($error != '[]')
            {
                echo $error ;
                \Yii::$app->end() ;
            }
        }
        if (Yii::$app->request->isAjax && $newProduct->load(Yii::$app->request->post()))
        {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON ;

            $error = json_encode(ActiveForm::validate($newProduct)) ;

            if ($error != '[]')
            {
                echo $error ;
                \Yii::$app->end() ;
            }
        }

        if (Yii::$app->request->isPost)
        {
            $postnew   = Yii::$app->request->post('Productnew') ;
            $postexist = Yii::$app->request->post('Productexist') ;
            if (isset($postnew))
            {
                $result = $this->setArrayPostProduct($postnew, $id) ;
                $data   = $this->setReferenciaData($result) ;
            } else
            {
                $data = $this->setArrayPostProduct($postexist, $id) ;
            }
            $productnew             = new Product ;
            $productnew->attributes = $data ;
            if ($productnew->validate())
            {
                $productnew->save() ;

                $param = [
                    'operacion'   => 'Crear Producto',
                    'id_mapping'  => $productnew['id_mapping'],
                    'id_producto' => $productnew['id'],
                    'acumulado'   => $productnew['acumulado'],
                    'cantidad'    => $productnew['cantidad'],
                        ] ;
                Yii::$app->gruduHelper->setLog($param) ;

                return $this->redirect(Url::to(['/reception/view', 'id' => $id])) ;
            }
        }


        return $this->render('view', [
                    'product'       => $product,
                    'mapping'       => $mapping,
                    'sumProduct'    => $sumProduct,
                    'acumProduct'   => $acumProduct,
                    'newProduct'    => $newProduct,
                    'newProduct1'   => $newProduct1,
                    'dataProveedor' => $dataProveedor,
                ]) ;
    }

    public function setReferenciaData($result) {
        $marca        = substr($result['marca'], 0, 1) ;
        $temporada    = $result['codtemporada'] ;
        $ano          = $result['codano'] ;
        $capsula      = $result['codcapsula'] ;
        $departamento = $result['coddepto'] ;
        $seccion      = $result['codseccion'] ;
        $familia      = $result['codfamilia'] ;
        $subfamilia   = str_pad((int) $result['codsubfamilia'], 3, 0, STR_PAD_LEFT) ;

        $result['referencia'] = $marca . $temporada . $ano . $capsula . '-' . $departamento . $seccion . $familia . '-' . $subfamilia ;
        return $result ;
    }

    public function actionSetcountref() {
        $post = Yii::$app->request->post() ;
        $id   = $post['id'] ;
        unset($post['id']) ;
        unset($post['cod_barra']) ;
        unset($post['_csrf-frontend']) ;
        foreach ($post as $cod_barra => $cantidad) {
            $product     = Product::find()->where(['cod_barra' => $cod_barra])->one() ;
            $acumProduct = $product['acumulado'] ;
            if (is_null($acumProduct))
            {
                $acumProduct = 0 ;
            }
            $newAcumProduct = $acumProduct + $cantidad ;
            Yii::$app->db->createCommand()->update('product', ['acumulado' => $newAcumProduct], ['cod_barra' => $cod_barra])->execute() ;

            $product = Product::find()->where(['cod_barra' => $cod_barra])->one() ;
            $param   = [
                'operacion'   => 'Conteo',
                'id_mapping'  => $product['id_mapping'],
                'id_producto' => $product['id'],
                'acumulado'   => $product['acumulado'],
                'cantidad'    => $product['cantidad'],
                    ] ;
            Yii::$app->gruduHelper->setLog($param) ;
        }
        return $this->redirect(Url::to(['/reception/view', 'id' => $id])) ;
    }

    /**
     * 
     * @param type $post
     */
    public function setArrayPostProduct($post, $idMapping) {
        $data['cod_barra'] = $post['cod_barra'] ;
        $data['marca']     = $post['marca'] ;

        $data['coddepto']     = $post['departamento'] ;
        $data['departamento'] = Yii::$app->gruduHelper->getDepartamento($data['coddepto']) ;

        $data['codseccion'] = $post['seccion'] ;
        $data['seccion']    = Yii::$app->gruduHelper->getSeccion($data['codseccion']) ;

        $familia            = explode('-', $post['familia']) ;
        $data['codfamilia'] = $familia[1] ;
        $data['familia']    = $familia[0] ;

        $data['subfamilia']    = $post['subfamilia'] ;
        $data['codsubfamilia'] = $post['subfamilia'] ;

        $data['codtemporada'] = $post['temporada'] ;
        $data['temporada']    = Yii::$app->gruduHelper->getTemporada($data['codtemporada']) ;

        $data['codano'] = $post['ano'] ;
        $data['ano']    = Yii::$app->gruduHelper->getAno($data['codano']) ;

        $data['codcapsula'] = Yii::$app->gruduHelper->getCapsulaCod($post['capsula']) ;
        $data['capsula']    = Yii::$app->gruduHelper->getCapsula($post['capsula']) ;

        $data['codcolor'] = $post['color'] ;
        $data['color']    = Yii::$app->gruduHelper->getColor($data['codcolor']) ;

        $data['codtalla'] = Yii::$app->gruduHelper->getTallaCod($post['talla']) ;
        $data['talla']    = Yii::$app->gruduHelper->getTalla($post['talla']) ;

        $data['codprov']   = $post['proveedor'] ;
        $data['proveedor'] = Yii::$app->gruduHelper->getProveedor($post['proveedor']) ;

        $data['cantidad']    = ($post['cantidad']) ? $post['cantidad'] : "" ;
        $data['referencia']  = isset($post['referencia']) ? $post['referencia'] : '' ;
        $data['descripcion'] = $post['descripcion'] ;
        $data['carac']       = $post['carac'] ;
        $data['id_mapping']  = $post['id_mapping'] ;
        $data['acumulado']   = 1 ;

        return $data ;
    }

    public function actionGetreferencia($q) {
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON ;
        if (!is_null($q))
        {
            $query          = new Query ;
            $query->select('referencia AS id, referencia AS text')
                    ->from('product')
                    ->where(['like', 'referencia', $q])
                    ->distinct() ;
            $command        = $query->createCommand() ;
            $data           = $command->queryAll() ;
            $out['results'] = array_values($data) ;
        } elseif ($id > 0)
        {
            $out['results'] = ['id' => Product::find()->referencia, 'text' => Product::find()->referencia] ;
        }


        return $out ;
    }

    /**
     * 
     * @param type $id
     * @return type
     */
    public function actionDelete($id) {
        Yii::$app
                ->db
                ->createCommand()
                ->delete('product', ['id_mapping' => $id])
                ->execute() ;

        Yii::$app
                ->db
                ->createCommand()
                ->delete('mapping', ['id' => $id])
                ->execute() ;

        $dataProvider = new ActiveDataProvider([
            'query' => Mapping::find(),
                ]) ;

        return $this->render('index', [
                    'dataProvider' => $dataProvider
                ]) ;
    }

    /**
     * Metodo que se usa para traer producto en ajax
     * @return booleancom
     */
    public function actionGetreferenciaajax() {
        $q = Yii::$app->request->post('ref') ;
        if (!is_null($q))
        {
            $product = Product::find()->where(['referencia' => $q])->one() ;

            $result['departamento'] = $product['coddepto'] ;
            $result['seccion']      = $product['codseccion'] ;
            $result['familia']      = $product['familia'] . '-' . str_pad((int) $product['codfamilia'], 2, 0, STR_PAD_LEFT) ;
            $result['temporada']    = $product['codtemporada'] ;
            $result['ano']          = $product['codano'] ;
            $result['capsula']      = $product['codcapsula'] ;
            $result['proveedor']    = $product['codprov'] ;
            $result['descapsula']   = $product['descapsula'] ;
            $result['carac']        = $product['carac'] ;
            $result['descripcion']  = $product['descripcion'] ;
            $result['subfamilia']   = $product['subfamilia'] ;
            return Json::encode($result) ;
        }
        return false ;
    }

    /**
     * Metodo utilizado para conteo ajax
     * @return int
     */
    public function actionPostAcum() {
        $cod_barra = $_POST['cod_barra'] ;
        $product   = Product::find()->where(['cod_barra' => $cod_barra])->one() ;
        if ($product)
        {
            $acumProduct  = $product['acumulado'] ;
            $countProduct = $product['cantidad'] ;
            if (is_null($acumProduct))
            {
                $acumProduct = 0 ;
            }
            $newAcumProduct = $acumProduct + 1 ;
            Yii::$app->db->createCommand()->update('product', ['acumulado' => $newAcumProduct], ['cod_barra' => $cod_barra])->execute() ;
            $product        = Product::find()->where(['cod_barra' => $cod_barra])->one() ;
            $param          = [
                'operacion'   => 'Conteo',
                'id_mapping'  => $product['id_mapping'],
                'id_producto' => $product['id'],
                'acumulado'   => $product['acumulado'],
                'cantidad'    => $product['cantidad'],
                    ] ;
            Yii::$app->gruduHelper->setLog($param) ;

            $result = [
                'cod_barra' => $cod_barra,
                'ref'       => $product['referencia'],
                'talla'     => $product['talla'],
                'color'     => $product['color'],
                'cant'      => $countProduct,
                'acum'      => $newAcumProduct,
                    ] ;

            //Si encuentra cod_barra
            return Json::encode($result) ;
        } else
        {
            $product = Product::find()->where(['referencia' => $cod_barra])->all() ;

            if ($product)
            {
                foreach ($product as $key => $value) {
                    $result[] = [
                        'cod_barra'  => $value->cod_barra,
                        'ref'        => $value->referencia,
                        'talla'      => $value->talla,
                        'color'      => $value->color,
                        'cant'       => $value->cantidad,
                        'acum'       => $value->acumulado,
                        'referencia' => 1,
                            ] ;
                }
                //si encuentra referencia aún no se cuenta
                return Json::encode($result) ;
            }
        }
        // Si no encuentra nada
        return 0 ;
    }

    public function actionTest() {
        $mappingHeaderPrev   = \app\models\MappingHeaderPrev::find()->one() ;
        $attr                = $mappingHeaderPrev->attributes ;
        unset($attr['id']) ;
        $mapping             = new \app\models\MappingHeader() ;
        $mapping->attributes = $mappingHeaderPrev->attributes ;
        $mapping->save() ;
        print_r($mappingHeaderPrev->attributes) ;
        exit ;
    }

    public function actionExport($id) {

        $mapping = Mapping::findOne($id) ;
        $query   = (new Query) ;
        $product = $query->from('product')->select('marca,departamento,seccion,familia,subfamilia,temporada,ano,capsula,color,talla,proveedor,acumulado,pvptienda,peso,serie,referencia,descripcion,cod_barra,costodist,pvpmgta,carac,gpeso,codmarca,coddepto,codseccion,codfamilia,codsubfamilia,codtemporada,codano,codcapsula,codcolor,codtalla,codprov')->where(['id_mapping' => $id])->all() ;
        $file    = \Yii::createObject([
                    'class'  => 'codemix\excelexport\ExcelFile',
                    'sheets' => [
                        'MAPPING' => [
                            'data'      => $product,
                            'idmapping' => $id,
                            'titles'    => [
                                'MARCA',
                                'DEPARTAMENTO',
                                'SECCION',
                                'FAMILIA',
                                'SUBFAMILIA',
                                'TEMPORADA',
                                'ANO',
                                'CAPSULA',
                                'COLOR',
                                'TALLA',
                                'PROVEEDOR',
                                'CANTIDADFACT',
                                'PVPTIENDA',
                                'PESO',
                                'SERIE',
                                'REFERENCIA',
                                'DESCRIPCION',
                                'CODBARRA',
                                'COSTODIST',
                                'PVPMGTA',
                                'CARAC',
                                'GPESO',
                                'CODMARCA',
                                'CODDEPTO',
                                'CODSECCION',
                                'CODFAMILIA',
                                'CODSUBFAMILIA',
                                'CODTEMPORADA',
                                'CODANO',
                                'CODCAPSULA',
                                'CODCOLOR',
                                'CODTALLA',
                                'CODPROV',
                            ]
                        ]
                    ]
                ]) ;
        $file->send(substr($mapping->archivo, 0, -4) . '.xlsx') ;
    }

}
