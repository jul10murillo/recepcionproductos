<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

?>

<?php if (isset($model->idProducto->departamento)) {
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
		<td><?= $model->idProducto->departamento?></td>
		<td><?= $model->idProducto->seccion?></td>
		<td><?= $model->idProducto->familia?></td>
		<td><?= $model->idProducto->subfamilia?></td>
		<td><?= $model->idProducto->temporada?></td>
		<td><?= $model->idProducto->ano?></td>
		<td><?= $model->idProducto->capsula?></td>
		<td><?= $model->idProducto->talla?></td>
		<td><?= $model->idProducto->color?></td>
	</tr>
</tbody>
</table>
<?php }else{
    echo 'Producto borrado' ;
}