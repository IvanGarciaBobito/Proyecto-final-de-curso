
<%@page import="com.tienda.entidades.Categoria"%>
<%@page import="com.tienda.daos.DaoCategoriaMysql"%>
<%@page import="com.tienda.daos.DaoProductoMysql"%>
<%@page import="com.tienda.daos.DaoMysql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.tienda.entidades.Producto" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="cabecera.jsp"></jsp:include>





  <meta charset="utf-8">
  <title>Tu tienda</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="favicon.ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"> 
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link href="assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
  <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
  <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
  <link href="assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="assets/pages/css/components.css" rel="stylesheet">
  <link href="assets/corporate/css/style.css" rel="stylesheet">
  <link href="assets/pages/css/style-shop.css" rel="stylesheet" type="text/css">
  <link href="assets/corporate/css/style-responsive.css" rel="stylesheet">
  <link href="assets/corporate/css/themes/red.css" rel="stylesheet" id="style-color">
  <link href="assets/corporate/css/custom.css" rel="stylesheet">
  <!-- Theme styles END -->

<!-- Head END -->

    <div class="main">  
   
	<form id="frm" method="post" action="ControladorProduto">

      <div class="container">
  
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <div class="sidebar-filter margin-bottom-25">
              <h2>Buscar por</h2>

              <h3>Precio</h3>
              
                <label for="amount">Rango de precios:</label><br>
           <input id="precioMinimo" name="precioMinimo" type="number" placeholder="Precio M&iacute;nimo"> <br/><br>
		 <input id="precioMaximo" name="precioMaximo" type="number"  placeholder="Precio M&aacute;ximo">  <br/><br/>
    		<button class="btn btn-primary" type="button" onclick="porPrecio()">Buscar por precio</button>
    		<br><br><hr>
    		
    		<h3>Categor&iacute;a</h3>
    		<select id="categoriasSelect" name="categoriasSelect" onchange="c">
          <option value="0">Todas</option>
          <%
         
          
          String categoria = "0";
          if (request.getAttribute("categoria") != null || request.getAttribute("categoria") != ""){
        	  categoria = (String)request.getAttribute("categoria");
          }
          
          DaoCategoriaMysql dcat = new DaoCategoriaMysql();
          List<Categoria> categorias = dcat.listar();
          %>
          <c:forEach items="<%=categorias%>" var="categoria">
			<option value="${categoria.id}">${categoria.nombre} ${categoria.genero}</option>
			</c:forEach>
			</select>
			<br><br>
			<button class="btn btn-primary" type="button" onclick="cambiarCategoria()" >Buscar por categor&iacute;a </button>
			<input type="hidden" name="categoriaControlador" id="categoriaControlador" value="<%=categoria%>">
          </div>
          <br/>
          <!-- LISTAR CATEGORIAS -->
   				<script>
   				function porPrecio() {
   					var preciomax = $("#precioMaximo").val();
   					var preciomin = $("#precioMinimo").val();
   					if (preciomax =="" || preciomin == ""){
   						alert("Rellene precio Máximo y mínimo");
   						return;
   						if (preciomin > preciomax){
   							alert("El precio máximo tiene que ser mayor que el mínimo");
   							return;
   						}
   					}
   					document.getElementById("op").value = "precio";
   					 $("#frm").submit();
   					
				}
   				
   				function cambiarCategoria(){
   	          		document.getElementById("op").value = "cat";
   	          		var categoria = $("#categoriasSelect").val();
   	          		
   	          		document.getElementById("categoriaControlador").value = categoria;
   	          	
   	          	 $("#frm").submit();
   	          		
   	          	}
   				</script>
   
   
          
          </div>
          <!-- END SIDEBAR -->
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="content-search margin-bottom-20">
              <div class="row">
                <div class="col-md-6">
                  <h1>Busqueda de productos </h1>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                      <input type="text" placeholder="Haga una b&uacute;squeda" class="form-control" id="bpn" name="bpn">
                      <span class="input-group-btn">
                        <button class="btn btn-primary" type="button" onclick="porNombre()">Buscar por nombre</button>
                        <input type="hidden" id="nombrehid" name="nombrehid" value="">
                      </span>
                    </div>
                  <script>
                  function porNombre() {
                	  
                	  document.getElementById("op").value ="nombre";
                	  $("#frm").submit();
				}
                  
                  </script>
                </div>
              </div>
            </div>
            <div class="row list-view-sorting clearfix">
              <div class="col-md-2 col-sm-2 list-view">
                <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                <a href="javascript:;"><i class="fa fa-th-list"></i></a>
              </div>
              <div class="col-md-10 col-sm-10">
                <div class="pull-right">
                  <label class="control-label">Mostrar:</label>
                  <select class="form-control input-sm" name="ppp" id="ppp">
                    <option value="6">6</option>
                    <option value="12">12</option>
                    <option value="24">24</option>
                  </select>
               </div>
                <div class="pull-right">
                  <label class="control-label">Ordernar por:</label>
                  <select class="form-control input-sm" name="sorter" id="sorter" onchange="listaSort()">
                    <option value="aa">Alfab&eacute;ticamente (A-Z)</option>
                    <option value="ad">Alfab&eacute;ticamente (Z-A)</option>
                    <option value="pa">Precio m&aacute;s bajo</option>
                    <option value="pd">Precio m&aacute;s alto</option>
                  </select>
                </div>
              </div>
            </div>
            <!-- BEGIN PRODUCT LIST -->
            
             <%
        
             List<Producto> productos  = null;
             int total = 0;
             if (request.getAttribute("lista") != null){
             	 productos = (List<Producto>)request.getAttribute("lista");
             	 total = productos.size();
             }
            
            
            int bajo = 0;
            int arriba = 10;
            if (request.getAttribute("bajo") != null){
             bajo =(int) request.getAttribute("bajo");
             arriba =(int) request.getAttribute("arriba");}
            %>
       	
            <div class="row product-list">
                <c:forEach begin="<%=bajo %>" end="<%=arriba-1%>" items="<%=productos %>" var="producto">
              <!-- PRODUCT ITEM START -->
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="product-item">
                  <div class="pi-img-wrapper">
                     <img src="${producto.imagenUrl}" id="imagen${producto.id}"  class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="${producto.imagenUrl}" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" onclick="ventana(${producto.id})">Ver</a>
                    </div>
                  </div>
                 <h3><a href="shop-item.html" id="pruducto${producto.id }">${producto.nombre}</a></h3>
                   <div class="pi-price" id="precio${producto.id}" >${producto.precio} </div><span>&euro;</span>
                  <a href="javascript:;" class="btn btn-default add2cart" onclick="addCarro(${producto.id})" ><span >Sumar al carro</span></a>
                </div>
              </div>
                <input type="hidden" id="descripcion${producto.id}" value="${producto.descripcion}" >
               <input type="hidden" value="Negro,Blanco,Rosa,Azul" id="colores${producto.id}">
                <input type="hidden" value="38,39,40,41,42" id="tallas${producto.id}">
               </c:forEach>
              <!-- PRODUCT ITEM END -->
              </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
                 <%int numeroDePaginas = 1;
                  if (request.getAttribute("numeroDePaginas") != null){
                	   numeroDePaginas = (int)request.getAttribute("numeroDePaginas");
                	  }
                  
                  	String sort = "aa";
                	if (request.getAttribute("ordenar") != null || request.getAttribute("ordenar")!=null){
                  	   sort = (String)request.getAttribute("ordenar");}
                  int paginaActual = 0;
                  if (request.getAttribute("paginaActual") != "" || request.getAttribute("paginaActual")!= null){
               	   //paginaActual = (int)request.getAttribute("paginaActual");
                  }
               	%>
            <div class="row">
            <% if(total == 0){ %>
              <div class="col-md-4 col-sm-4 items-info">Productos 0 de 0 de 0 en total</div>
              <%}else{ %>
                     <div class="col-md-4 col-sm-4 items-info">Items <%=bajo %> to <%=arriba %> of <%=total %> total</div>
               <%} %>  
               <input type="hidden" id="paginaActual" name="paginaActual" value="<%=paginaActual%>"/>
            
                 
                   <div class="col-md-8 col-sm-8">
             	 <ul class="pagination pull-right">
                  <c:forEach  var="i" begin="0" end="<%=numeroDePaginas%>" >
                 <li onclick="cambiaPagina(${i})"><a>${i+1} </a></li>
     			 </c:forEach>
              </ul>  
              </div>
            </div>
            <input type="hidden" id="ordenar" name="ordenar" value="<%=sort%>">
            <input type="hidden" id="op" name="op" value="listar">
            <input type="hidden" value="<%=paginaActual %>" id="numPag" name="numPag">
            
            <script>           
          	
          	
            function listaSort (){
            	document.getElementById("op").value = "cat";
	          	var categoria = $("#categoriasSelect").val();
	          	document.getElementById("categoriaControlador").value = categoria;
            	orden =	$("#sorter").val();
            	$("#ordenar").val(orden);
            	$("#op").val("sort");
            	$("#numPag").val("0");
            	$("#frm").submit();
            	
            }
            
            function cambiaPagina (numPag){
            	document.getElementById("op").value = "cat";
	          		var categoria = $("#categoriasSelect").val();
	          		
	          		document.getElementById("categoriaControlador").value = categoria;
            	$("#numPag").val(numPag);
            	$("#frm").submit();
            	
            }
            </script>
            <!-- END PAGINATOR -->
          </div>
          <!-- END CONTENT -->
        
        <!-- END SIDEBAR & CONTENT -->
       
   
    <!-- BEGIN fast view of a product -->
       <div id="product-pop-up" class="ven" style="display: none; width: 700px;">
            <div class="product-page product-pop-up">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                  <div class="product-main-image">
                    <img id="imgproducto" src="assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                  <h2 id="nombreproducto"></h2>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span id="productoprecio"></span>&euro;</strong>
                     </div>
                     <input type="hidden" id="productopreciounitario">
                    <div class="availability">
                      Disponibilidad: <strong>En stock</strong>
                    </div>
                  </div>
                  <div class="description" >
                    <p id="productodescripcion"></p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label" id="productotallas">Tallas:</label>
                      <select class="form-control input-sm" id="selecttallas">
                       
                      </select>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">Colores:</label>
                      <select id="selectcolores" class="form-control input-sm">
                        
                      </select>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly onchange="actualizaPrecio()" name="product-quantity" class="form-control input-sm">
                    </div>
                    <button id="botonSumacarro" class="btn btn-primary" type="button">Sumar al carro</button>
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
    </div>                              
    <!-- END ventana de producto -->
   
   
   
 		
      </div>
      
     </div>
   </form>
 </div>
 <script>
 
 function ventana (id){
	  //Cogemos los valores del div en el que se clickea
	 var nombre = $("#nombre"+id).html();
	 var descripcion = $("#descripcion"+id).val();
	 var imagen = $("#imagen"+id).attr("src");
	var precio = $("#precio"+id).html();
	var talla = $("#tallas"+id).val();
	var tallas = talla.split(","); //Hay que pintar las tallas en el div de cada producto separadas por comas, los colores igual.
	var tallasdef = "";	
	$.each(tallas, function( index, value ) {
	tallasdef+= "<option value='"+value+"'>"+value+"</option>";
					});
	
	var color = $("#colores"+id).val();
	var colores = color.split(","); //Hay que pintar las tallas en el div de cada producto separadas por comas, los colores igual.
	var coloresdef = "";	
	$.each(colores, function( index, value ) {
	coloresdef+= "<option value='"+value+"'>"+value+"</option>";
					});
	
	
	// Pasamos los valores a la ventana y las funciones
	$("#selectcolores").html(" ");
	$("#selecttallas").html(" ");
	$("#selectcolores").append(coloresdef);
	$("#selecttallas").append(tallasdef);
	$("#imgproducto").attr ("src" , imagen);
	$("#imgproducto").attr ("src" , imagen);
	$(".zoomImg").attr("src" , imagen);
	$("#productoprecio").html(precio);
	$("#nombreproducto").html(nombre);
	$("#productodescripcion").html(descripcion);
	$("#productopreciounitario").val(precio);
	$("#product-quantity").val("1");
	
	$('#botonSumacarro').off('click');
	$('#botonSumacarro').click(function(){
		cambiarProd();
	
		//$('#product-pop-up').modal('hide');
		// var qqq = $(this).closest('.modal');
		  // $(qqq).modal('hide');
		//AQUÍVA EL AJAX
	//	$(this).parent().parent().parent().parent().css("display" , "none");
	//	$("#product-pop-up").parent().modal('hide');
	//	document.getElementById("product-pop-up").style.visibility = "hidden";
		
	});
	
 }	
	/*Actualizar el precio en el popup al cambiar la cantidad*/
 function actualizaPrecio (){
	var precio =  parseFloat($("#productopreciounitario").val());
	var cantidad = $("#product-quantity").val();
	var nuevoPrecio = precio*cantidad;
	$("#productoprecio").html(nuevoPrecio.toFixed(2));
 }
 
 </script>
   
    
    <!-- END fast view of a product -->

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
    <![endif]-->  
    <script src="assets/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script src="assets/corporate/scripts/back-to-top.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
    <script src='assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
    <script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><!-- for slider-range -->

    <script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initTwitter();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initUniform();
            Layout.initSliderRange();
        });
        
        
        
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->

<jsp:include page="pie.jsp"></jsp:include>
</html>