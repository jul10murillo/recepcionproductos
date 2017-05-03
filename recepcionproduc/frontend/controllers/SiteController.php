<?php
namespace frontend\controllers;

use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use frontend\models\CsvForm;
use ruskid\csvimporter\CSVImporter;
use ruskid\csvimporter\CSVReader;
use ruskid\csvimporter\ARImportStrategy;
use ruskid\csvimporter\MultipleImportStrategy;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        $model = new CsvForm;
        $importer = new CSVImporter;
        
        if (Yii::$app->request->isPost) {
            $importer->setData(new CSVReader([
                        'filename' => $_FILES['CsvForm']['tmp_name']['file_csv'],
                        'fgetcsvOptions' => [
                            'delimiter' => '/',
                            'enclosure'=>'*'
                        ],
                        'startFromLine'=>3
                    ]));
            
            $dataArray = $importer->getData();

            $numberRowsAffected = $importer->import(new MultipleImportStrategy([
                'tableName' => \app\models\Product::tableName(),
                'configs' => [
                    [
                        'attribute' => 'cod_barra',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[17];
                        },
                    ],
                    [
                        'attribute' => 'marca',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[0];
                        },
                    ],
                    [
                        'attribute' => 'departamento',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[1];
                        },
                    ],
                    [
                        'attribute' => 'seccion',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[2];
                        },
                    ],
                    [
                        'attribute' => 'familia',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[3];
                        },
                    ],
                    [
                        'attribute' => 'subfamilia',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[4];
                        },
                    ],
                    [
                        'attribute' => 'temporada',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[5];
                        },
                    ],
                    [
                        'attribute' => 'ano',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[6];
                        },
                    ],
                    [
                        'attribute' => 'capsula',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[7];
                        },
                    ],
                    [
                        'attribute' => 'color',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[8];
                        },
                    ],
                    [
                        'attribute' => 'talla',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[9];
                        },
                    ],
                    [
                        'attribute' => 'proveedor',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[10];
                        },
                    ],
                    [
                        'attribute' => 'cantidad',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[11];
                        },
                    ],
                    [
                        'attribute' => 'pvptienda',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[12];
                        },
                    ],
                    [
                        'attribute' => 'peso',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[13];
                        },
                    ],
                    [
                        'attribute' => 'serie',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[14];
                        },
                    ],
                    [
                        'attribute' => 'referencia',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[15];
                        },
                    ],
                    [
                        'attribute' => 'descripcion',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[16];
                        },
                    ],
                    [
                        'attribute' => 'costodist',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[18];
                        },
                    ],
                    [
                        'attribute' => 'pvpmgta',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[19];
                        },
                    ],
                    [
                        'attribute' => 'carac',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[20];
                        },
                    ],
                    [
                        'attribute' => 'gpeso',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[21];
                        },
                    ],
                    [
                        'attribute' => 'codmarca',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[22];
                        },
                    ],
                    [
                        'attribute' => 'coddepto',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[23];
                        },
                    ],
                    [
                        'attribute' => 'codseccion',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[24];
                        },
                    ],
                    [
                        'attribute' => 'codfamilia',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[25];
                        },
                    ],
                    [
                        'attribute' => 'codsubfamilia',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[26];
                        },
                    ],
                    [
                        'attribute' => 'codtemporada',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[27];
                        },
                    ],
                    [
                        'attribute' => 'codano',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[28];
                        },
                    ],
                    [
                        'attribute' => 'codcapsula',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[29];
                        },
                    ],
                    [
                        'attribute' => 'codcolor',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[30];
                        },
                    ],
                    [
                        'attribute' => 'codtalla',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[31];
                        },
                    ],
                    [
                        'attribute' => 'codprov',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[32];
                        },
                    ],
                    [
                        'attribute' => 'descapsula',
                        'value' => function($line) {
                            $value = explode(',', $line[0]);
                            return $value[33];
                        },
                    ],
                ],
            ]));
                print_r($numberRowsAffected);exit;
            foreach ($dataArray as $key => $value) {
                
            }
            
        }
        return $this->render('about',[
            'model' => $model,
        ]);
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for the provided email address.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
}
