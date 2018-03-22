<%@page import="com.tienda.daos.DaoCategoriaMysql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tienda.entidades.Categoria"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>Tu Tienda</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">
<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<!--- fonts for slider on the index page -->
<!-- Fonts END -->

<!-- Global styles START -->
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link href="assets/pages/css/animate.css" rel="stylesheet">
<link href="assets/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet">
<link href="assets/plugins/owl.carousel/assets/owl.carousel.css"
	rel="stylesheet">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="assets/pages/css/components.css" rel="stylesheet">
<link href="assets/pages/css/slider.css" rel="stylesheet">
<link href="assets/pages/css/style-shop.css" rel="stylesheet"
	type="text/css">
<link href="assets/corporate/css/style.css" rel="stylesheet">
<link href="assets/corporate/css/style-responsive.css" rel="stylesheet">
<link href="assets/corporate/css/themes/red.css" rel="stylesheet"
	id="style-color">
<link href="assets/corporate/css/custom.css" rel="stylesheet">
<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">

	<!-- BEGIN TOP BAR -->
	<div class="pre-header">
		<div class="container">
			<div class="row">
				<!-- BEGIN TOP BAR LEFT PART -->
				<div class="col-md-6 col-sm-6 additional-shop-info">
					<ul class="list-unstyled list-inline">
						<li><i class="fa fa-phone"></i><span>919999999</span></li>
						<!-- BEGIN CURRENCIES -->
						<script>
						function monedas (id){
							$("#euros").removeClass("current");
							$("#dolar").removeClass("current");
							$("#bc").removeClass("current");
							
							$("#"+id).addClass("current");
							$("#currentMoneda").val(id);
						}
						</script>
						<input type="hidden" id="currentMoneda">
						<li class="shop-currencies">
						<a id="euros" href="javascript:void(0);"
							class="current" onclick="monedas('euros')">&euro; euro </a> <a onclick="monedas('dolar')" id="dolar" href="javascript:void(0);">&dollar;
								dollar</a> <a onclick="monedas('bc')" id="bc" href="javascript:void(0);">&#8383; bitcoin</a></li>
								
						<!-- END CURRENCIES -->
						<!-- BEGIN LANGS -->
						<li class="langs-block"><a href="javascript:void(0);"
							class="current">Espa&ntilde;ol </a>
							<div class="langs-block-others-wrapper">
								<div class="langs-block-others">
									<a href="javascript:void(0);">French</a> 
									<a href="javascript:void(0);">Germany</a>
								</div>
							</div></li>
						<!-- END LANGS -->
					</ul>
				</div>
				<!-- END TOP BAR LEFT PART -->
				<!-- BEGIN TOP BAR MENU -->
				
				<!-- COPIAR DESDE AQUÍ -->
				<div class="col-md-6 col-sm-6 additional-nav">
					<ul class="list-unstyled list-inline pull-right">
					<% if (request.getSession().getAttribute("usuario")== null ){ %>
					<li><a href="" data-toggle="modal" data-target="#myModal">
								<span class="fa fa-sign-in fa-lg" aria-hidden="true"></span>
								Login
						</a></li>
						<li><a href="registro.jsp"><span
								class="fa fa-user-plus fa-lg" aria-hidden="true"></span>
								Registrarse</a></li>
								
								<% }else{ %>
								
								<%if(("Admin").equals(request.getSession().getAttribute("tipo"))){ %>
								<li><a href="admin/index.jsp"><span class="fa fa-user fa-lg"
								aria-hidden="true"></span> Panel de Administracion</a></li>
								<li><a href="cuenta.jsp"><span class="fa fa-user fa-lg"
								aria-hidden="true"></span> Mi cuenta</a></li>
						<li><a href="cestavacia.jsp"><span
								class="fa fa-shopping-cart fa-lg" aria-hidden="true"></span>
								Cesta</a></li>
						<li onclick="cerrarSesion()"><form id="frmlogout" action="LoginControlador" method="post">
						<input type="hidden" name="op" value="cerrarSesion">
						<span class="fa fa-times fa-lg" aria-hidden="true"></span>
								Salir</form></li>
								<% }else{ %>
						<li><a href="cuenta.jsp"><span class="fa fa-user fa-lg"
								aria-hidden="true"></span> Mi cuenta</a></li>
						<li><a href="cestavacia.jsp"><span
								class="fa fa-shopping-cart fa-lg" aria-hidden="true"></span>
								Cesta</a></li>
						<li onclick="cerrarSesion()"><form id="frmlogout" action="LoginControlador" method="post">
						<input type="hidden" name="op" value="cerrarSesion">
						<span class="fa fa-times fa-lg" aria-hidden="true"></span>
								Salir</form></li>
								
								<%  } }%>
					</ul>
				</div>
				<!-- HASTA AQUÍ -->
				<!-- END TOP BAR MENU -->
			</div>
		</div>
	</div>
				<!-- END TOP BAR LEFT PART -->
				

	<!-- END TOP BAR -->
	<!-- Modal LOGIN-->
	<div id="myModal" class="modal fade" role="dialog">
		<form method="post" action="LoginControlador">
			<input type="hidden" value="login" name="op">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Log in</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="username">Email</label> <input type="email"
								name="emaillog" id="username" tabindex="1" class="form-control"
								placeholder="Email" value="" autocomplete="off" required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								name="passwordlog" id="password" tabindex="2" class="form-control"
								placeholder="Password" autocomplete="off" required>
						</div>
						
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Log In</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					</div>
				</div>

			</div>
		</form>
	</div>
	<!-- END MODAL LOGIN -->


	<!-- BEGIN HEADER -->
	<div class="header">
		<div class="container">
			<a class="site-logo" href="index.jsp"><img
				src="assets/corporate/img/logos/online-shop.png"
				alt="Metronic Shop UI"> Tu<span style="font-style: italic;">Tienda</span></a> <a href="index.jsp" class="mobi-toggler"><i
				class="fa fa-bars"></i></a>

			<!-- BEGIN CART -->
			<div class="top-cart-block">
				<div class="top-cart-info">
				<%int productos = 0 ;
				int dinero = 0 ;
	
				
			/*if (request.getAttribute("productos") != null || request.getAttribute("productos") != "" || request.getAttribute("dinero").equals(null)  || request.getAttribute("dinero") != ""){
										productos = (int) request.getAttribute("productos");
										dinero = (int) request.getAttribute("dinero");
									}*/
						String mostrar = productos + " productos";
									%>
					<a href="cesta.jsp" class="top-cart-info-count"><span id="mostrar"><%=mostrar %></span></a> <a href="cesta.jsp"
						class="top-cart-info-value">&euro; <span id="precio"><%=dinero %></span></a>
						<input type="hidden" id="mostrarHidden" name="mostrarHidden" value="<%=productos%>">
						<input type="hidden" id="precioHidden" name="precioHidden" value="<%= dinero%>">
				</div>
				<i class="fa fa-shopping-cart"></i>

				
			</div>
			<!--END CART -->

			<%
				DaoCategoriaMysql daoCat = new DaoCategoriaMysql();

				List<Categoria> categorias = daoCat.listar();
			%>

			<!-- BEGIN NAVIGATION -->
			<div class="header-navigation">
				<ul>
					<li><a href="index.jsp"><span><i
								class="fa fa-home fa-lg"></i></span>Principal</a></li>
					<li class="dropdown dropdown-megamenu"><a
						class="dropdown-toggle" data-toggle="dropdown" data-target="#"
						href="javascript:;"> <span><i
								class="fa fa-female fa-lg"></i></span>Mujer
					</a>
						<ul class="dropdown-menu">
							<li>
								<div class="header-navigation-content">
									<div class="row">
										<div class="col-md-4 header-navigation-col">
											<h4>Mujer</h4>
											<ul>
												<% for(Categoria categoria : categorias){
													if("Mujer".equals(categoria.getGenero())){
														%>
														<li><a href="listaproducto.jsp"><%=categoria.getNombre() %></a></li>
													<%
													}
												}
												
													%>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
					<li class="dropdown dropdown-megamenu"><a
						class="dropdown-toggle" data-toggle="dropdown" data-target="#"
						href="javascript:;"><span><i class="fa fa-male fa-lg"></i></span>Hombre</a>
						<ul class="dropdown-menu">
							<li>
								<div class="header-navigation-content">
									<div class="row">
										<div class="col-md-4 header-navigation-col">
											<h4>Hombre</h4>
											<ul>
											<% for(Categoria categoria : categorias){
													if("Hombre".equals(categoria.getGenero())){
														%>
														<li><a href="listaproducto.jsp"><%=categoria.getNombre() %></a></li>
													<%
													}
												}
												
													%>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
					

					<!-- BEGIN TOP SEARCH -->
					
						
						<li><a href="listaproducto.jsp">Todos los productos</a></li>
					<!-- END TOP SEARCH -->
				</ul>
			</div>
			<!-- END NAVIGATION -->
		</div>
	</div>
			<!-- END NAVIGATION -->
	<!-- Header END -->
	<!--  PANEL DE AVISO DE MENSAJES DE ERROR -->
	
	<% if ( request.getAttribute("error") != null){ 
	String error = (String)request.getAttribute("error");
	%>
	<div class="alert alert-danger" role="alert">
  <strong>Error!</strong> <%= error %>
</div>
	<% } %>
	
	<!-- PANEL DE AVISO DE MENSAJES DE INFORMACIÓN -->
	
		<% if ( request.getAttribute("informacion") != null){ 
	String info = (String)request.getAttribute("informacion");
	%>
	<div class="alert alert-info" role="alert">
  <strong>Info:</strong> <%= info %>
</div>
	<% } %>
					<!-- HASTA AQUÍ -->
	
	<!-- SCRIPTS -->
	<script>
	 //Script para cerrar la sesión
	function cerrarSesion (){
	$("#frmlogout").submit();
}
	 </script>
	 
	 <script>
function cambiarProd (){
		var productos = $("#mostrarHidden").val();
	
		productos++;
		$('#mostrar').html(productos + ' productos');
		$('#mostrarHidden').val(productos);
		var precio =  parseFloat($('#productoprecio').html());
		var aDinero =  parseFloat($('#precioHidden').val());
		aDinero += precio;
		$('#precio').html(aDinero.toFixed(2));
		$('#precioHidden').val(aDinero);
}
function addCarro (id){
	producto++;
	$('#mostrar').html(productos + ' productos');
	$('#mostrarHidden').val(productos);

	var precio =  parseFloat($("#precio"+id).html());
	alert(precio)
	var aDinero =  parseFloat($('#precioHidden').val());
	aDinero += precio;
	$('#precio').html(aDinero.toFixed(2));
	$('#precioHidden').val(aDinero);
}
</script>

