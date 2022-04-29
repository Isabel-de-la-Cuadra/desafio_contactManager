<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Isabel de la Cuadra Lunas">
<title>Mantenedor de Contactos</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script type="text/javascript">
	var idSelect = 0;
	function submitFormAction(action, method){
		document.getElementById("frmAcciones").action = action;
		document.getElementById("frmAcciones").method = method;
		document.getElementById("frmAcciones").submit();
	}
	
	function setIdSelect(id){
		idSelect = id;
	}
	
	function deleteRow(){
		window.location.href = "/contactManager/deleteContact/?id=" + idSelect;
	}
</script>

</head>

<body>
<br>

<div>
	<h3 class="ms-5">Registro de Contactos</h3>
</div>

<div class="card m-5 p-2" align="center" style="background-image: linear-gradient(to bottom right, red, yellow);">
  <div class="card-body">
    <form:form id="frmAcciones" modelAttribute="contacto">
		<div>
			<fieldset>
				<table style="border-style: double;">
					<tr>
						<td>Nombre: </td>
						<td><input type="text" id="idNombre" name="nombre" placeholder="Escribe el nombre del contacto"/></td>
						<td>Apellido Paterno: </td>
						<td><input type="text" id="idApellidoPaterno" name="apellidoPaterno" placeholder="Apellido paterno del contacto"/></td>
						<td>Apellido Materno: </td>
						<td><input type="text" id="idApellidoMaterno" name="apellidoMaterno" placeholder="Apellido materno del contacto"/></td>
					</tr>
					<tr>
						<td>Dirección: </td>
						<td colspan="3"><input type="text" id="idDireccion" name="direccion" placeholder="Dirección del contacto"/></td>
						<td>Teléfono: </td>
						<td><input type="text" id="idTelefono" name="telefono" placeholder="Teléfono del contacto"/></td>
					</tr>
					<tr>
						<td>
							<input style= "border:2px ridge SlateBlue; border-radius:4px; background-color:rgb(255,0,0);opacity:0,6;" type="button" value="Agregar" onclick="submitFormAction('/contactManager/addContact', 'post')"/>
						</td>
					</tr>
				</table>
			</fieldset>
		</div>
	</form:form>
  </div>
</div>

<div class="card">
	<div class="card-body">
		<fieldset>
			<legend class="ms-5">Lista de contactos</legend>
			<br>
				<div class="ms-5" align="center">
					<table class="table">
					<tr>
						<th scope="col"></th>
						<th scope="col">Id</th>
						<th scope="col">Nombre</th>
						<th scope="col">Apellido Paterno</th>
						<th scope="col">Apellido Materno</th>
						<th scope="col">Dirección</th>
						<th scope="col">Teléfono</th>
						<th scope="col">Acción</th>
					</tr>
					<tbody>
						<c:forEach items="${listContact}" var="contact">
							<tr>
								<td><input type="radio" id="optSelectRow${contact.idContacto}" name="optSelectRow" onclick="setIdSelect(${contact.idContacto})"/></td>
								<td>${contact.idContacto}</td>
								<td>${contact.nombre}</td>
								<td>${contact.apellidoPaterno}</td>
								<td>${contact.apellidoMaterno}</td>
								<td>${contact.direccion}</td>
								<td>${contact.telefono}</td>
								<td>
								<input style= "border:2px ridge SlateBlue; border-radius:4px; background-color:rgb(255,0,0);opacity:0,6;" type="button" value="Eliminar" onclick="deleteRow()"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
			</fieldset>
	</div>
</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>