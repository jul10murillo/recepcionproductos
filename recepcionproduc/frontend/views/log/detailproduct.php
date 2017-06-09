<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$product = app\models\Product::findOne($model['id_producto']);

?>

<?php if (isset($product)) {
?>
<table class="table">
<thead>
	<tr>
		<td>Departamento</td>
		<td>Sección</td>
		<td>Familia</td>
		<td>SubFamilia</td>
		<td>Temporada</td>
		<td>Año</td>
		<td>Capsula</td>
		<td>Talla</td>
		<td>Color</td>
	</tr>
</thead>
<tbody>
	<tr>
		<td><?= $product->departamento?></td>
		<td><?= $product->seccion?></td>
		<td><?= $product->familia?></td>
		<td><?= $product->subfamilia?></td>
		<td><?= $product->temporada?></td>
		<td><?= $product->ano?></td>
		<td><?= $product->capsula?></td>
		<td><?= $product->talla?></td>
		<td><?= $product->color?></td>
	</tr>
</tbody>
</table>
<?php }else{
    echo 'Producto borrado' ;
}