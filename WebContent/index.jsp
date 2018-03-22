<%@page import="com.tienda.daos.DaoCategoriaMysql"%>
<%@page import="com.tienda.daos.DaoProductosMysql"%>
<%@page import="com.tienda.daos.DaoMysql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.tienda.entidades.Producto" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="cabecera.jsp"/>
<!-- BEGIN SLIDER -->
    <div class="page-slider margin-bottom-35">
        <div id="carousel-example-generic" class="carousel slide carousel-slider">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>

            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <!-- First slide -->
                <div class="item carousel-item-four active">
                    <div class="container">
                        <div class="carousel-position-four text-center">
                            <h2 class="margin-bottom-20 animate-delay carousel-title-v3 border-bottom-title text-uppercase" data-animation="animated fadeInDown">
                                <br/><span class="color-red-v2">Envios por todo el mundo</span><br/> Servicio Express
                            </h2>
                            <p class="carousel-subtitle-v2" data-animation="animated fadeInUp">Disfruta de nuestros productos en cualquier parte del mundo <br/>
                            con el servicio express recibira sus productos en el menor tiempo posible.</p>
                        </div>
                    </div>
                </div>
                

            <!-- Controls -->
            <a class="left carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="prev">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
            </a>
            <a class="right carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="next">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
            </a>
        </div>
    </div>
    <!-- END SLIDER -->
    
     <%		DaoCategoriaMysql dcat = new DaoCategoriaMysql();
            List<Producto> productosHombre = dcat.listarProdHombre();
         
            
            List<Producto> productosMujer = dcat.listarProdMujer();
           
            %>

    <div class="main">
      <div class="container">
        <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SALE PRODUCT -->
          <div class="col-md-12 sale-product">
            <h2>Nuevos Productos de Mujer</h2>
            <div class="owl-carousel owl-carousel5">
            <c:forEach items="<%=productosMujer %>" var="producto">
              <div>
                <div class="product-item">
                <input type="hidden" value="Rosa,azul,negro,verde" id="colores${producto.id}">
                <input type="hidden" value="38,39,40,41,42" id="tallas${producto.id}">
             	<input type="hidden" id="descripcion${producto.id}" value="${producto.descripcion}" >
                  <div class="pi-img-wrapper">
                    <img id="imagen${producto.id}" src="${producto.imagenUrl}" class="img-responsive" alt="${producto.nombre}">
                    <div>
                      <a href="${producto.imagenUrl}" class="btn btn-default fancybox-button">Zoom</a>
                      <a onclick="ventana(${producto.id})"	href="#product-pop-up" class="btn btn-default fancybox-fast-view">Ver</a>
                    </div>
                  </div>
                  <h3><a href="javascritp:void()" id="nombre${producto.id}">${producto.nombre}</a></h3>
                  <div class="pi-price" id="precio${producto.id}">${producto.precio}</div> <span> &euro;</span>
                  <a href="javascript:void(0)" class="btn btn-default add2cart">A&ntilde;adir</a>
                  <div class="sticker sticker-new"></div>
                </div>
              </div>
              </c:forEach>
          </div>
        </div>
       </div>  
       </div> 
          </div>
          <!-- END SALE PRODUCT -->
        
        <!-- END SALE PRODUCT & NEW ARRIVALS -->
    
      
       <div class="main">
      <div class="container">
        <!-- BEGIN productos de hombre-->
        <div class="row margin-bottom-40">
          <!-- BEGIN SALE PRODUCT -->
          <div class="col-md-12 sale-product">
            <h2>Nuevos Productos de Hombre</h2>
            <div class="owl-carousel owl-carousel5">

            <c:forEach items="<%=productosHombre %>" var="producto">
              <div>
                <div class="product-item">
             	<input type="hidden" id="descripcion${producto.id}" value="${producto.descripcion}" >
                  <div class="pi-img-wrapper">
                    <img id="imagen${producto.id}" src="${producto.imagenUrl}" class="img-responsive" alt="${producto.nombre}">
                    <div>
                    
                      <a href="${producto.imagenUrl}" class="btn btn-default fancybox-button">Zoom</a>
                      <a onclick="ventana(${producto.id})"	href="#product-pop-up" class="btn btn-default fancybox-fast-view">Ver</a>
                    </div>
                  </div>
                  <h3><a  id="nombre${producto.id}">${producto.nombre}</a></h3>
                  <div class="pi-price" id="precio${producto.id}">${producto.precio}</div>
                  <!--  <a href=""  class="btn btn-default add2cart">A&ntilde;adir</a>-->
                  <div class="sticker sticker-new"></div>
                   <input type="hidden" value="azul,rosa,negro,verde" id="colores${producto.id}">
                <input type="hidden" value="38,39,40,41,42" id="tallas${producto.id}">
                </div>
              </div>
              </c:forEach>
          </div>
        </div>
       </div>  
       </div> 
          </div>
    <!-- Fin productos de hombre -->
    
    
    
    <!-- BEGIN BRANDS -->
    <div class="brands">
      <div class="container">
            <div class="owl-carousel owl-carousel6-brands">
              <a href="javascript:void()"><img src="assets/pages/img/brands/Adidas.jpg" alt="adidas" title="Adidas"></a>
              <a href="javascript:void()"><img src="assets/pages/img/brands/ElGanso.jpg" alt="elganso" title="El Ganso"></a>
              <a href="javascript:void()"><img src="assets/pages/img/brands/Krisp.jpg" alt="krisp" title="Krisp"></a>
              <a href="javascript:void()"><img src="assets/pages/img/brands/Mustang.jpg" alt="mustang" title="Mustang"></a>
              <a href="javascript:void()"><img src="assets/pages/img/brands/NewBalance.jpg" alt="newbalance" title="New Balance"></a>
              <a href="javascript:void()"><img src="assets/pages/img/brands/Reebok.jpg" alt="reebok" title="Reebok"></a>
              <!--  <a href="shop-product-list.html"><img src="assets/pages/img/brands/canon.jpg" alt="canon" title="canon"></a>
              <a href="shop-product-list.html"><img src="assets/pages/img/brands/esprit.jpg" alt="esprit" title="esprit"></a>
              <a href="shop-product-list.html"><img src="assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a>
              <a href="shop-product-list.html"><img src="assets/pages/img/brands/next.jpg" alt="next" title="next"></a>
              <a href="shop-product-list.html"><img src="assets/pages/img/brands/puma.jpg" alt="puma" title="puma"></a>
              <a href="shop-product-list.html"><img src="assets/pages/img/brands/zara.jpg" alt="zara" title="zara"></a>-->
            </div>
        </div>
    </div>

    <!-- END BRANDS -->

    <!-- BEGIN STEPS -->
    <div class="steps-block steps-block-red">
      <div class="container">
        <div class="row">
          <div class="col-md-4 steps-block-col">
            <i class="fa fa-truck"></i>
            <div>
              <h2>Envio Express</h2>
              <em>Disfruta de tus productos en el menor tiempo posible;</em>
            </div>
            <span>&nbsp;</span>
          </div>
          <div class="col-md-4 steps-block-col">
            <i class="fa fa-phone"></i>
            <div>
              <h2>919999999</h2>
              <em>24/7 Atencion al cliente</em>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END STEPS --> 
           <!-- BEGIN ventana de producto -->
           <div id="product-pop-up" style="display: none; width: 700px;">
            <div class="product-page product-pop-up">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                  <div class="product-main-image">
                    <img  id="imgproducto" src="assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                  <h2 id="nombreproducto"></h2>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span id="productoprecio"></span><span> &euro;</span></strong>
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

                    <button  class="btn btn-primary add2cart" type="button" onclick="cerrar()">Sumar al carro</button> 
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
    </div>                              
    <!-- END ventana de producto -->
          
        
        
    <jsp:include page="pie.jsp"></jsp:include>
    
   <!-- Scripts  --> 
     <script type="text/javascript">

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
        	
        	
        	
        	
          }	
			/*Actualizar el precio en el popup al cambiar la cantidad*/
          function actualizaPrecio (){
        	var precio =  $("#productopreciounitario").val();
        	var cantidad = $("#product-quantity").val();
        	var nuevoPrecio = precio*cantidad;
        	$("#productoprecio").html(nuevoPrecio.toFixed(2));
          }
			function prueba(){
				alert("hola");
			}

			
          </script>
    
    