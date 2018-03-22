<%@page import="com.tienda.entidades.Producto"%>
<%@page import="com.tienda.entidades.PedidoProducto"%>
<%@page import="com.tienda.daos.DaoPedidosMysql"%>
<%@page import="com.tienda.daos.DaoPedidosProductos"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="cabecera.jsp"></jsp:include>
<%
DaoPedidosProductos dao = new DaoPedidosProductos();
List<PedidoProducto> listaPedidos = dao.listar();

	/*String imagen= listaPedidos.get(0).getProducto().getImagenUrl();
	String descripcion = listaPedidos.get(0).getProducto().getDescripcion();
	String cantidad =String.valueOf( listaPedidos.get(0).getCantidad());
	String color = listaPedidos.get(0).getProducto().getColorElegido();
	String talla = listaPedidos.get(0).getProducto().getTallaElegida();
	String precio =String.valueOf( listaPedidos.get(0).getProducto().getPrecio());
	String total = String.valueOf( listaPedidos.get(0).getSubtotal());*/

%>
<div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>Cesta</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
              <!-- Comienza la cabecera de la lista de productos -->
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart" id="tablaProductos">
                  <tr>
                    <th class="goods-page-image">Imagen</th>
                    <th class="goods-page-description">Descripcion</th>

                    <th class="goods-page-quantity">Cantidad</th>
                    <th class="goods-page-price">Precio por unidad</th>
                    <th class="goods-page-total" colspan="2">Total</th>
                  </tr>
                  <!-- finaliza la cabecera de la lista de productos -->
                  <!-- repetir producto en bloque -->
                  <c:if test="<%=listaPedidos !=null%>">
                  <c:forEach var="producto" items="<%=listaPedidos %>" varStatus="contador">
                  <tr>
                    <td class="goods-page-image">
                      <a href="javascript:;"><img src="${producto.producto.imagenUrl}" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3><a href="javascript:;">"${producto.producto.descripcion}"</a></h3>
                      <p><strong>${producto.producto.nombre}</strong> - Color: ${producto.producto.colorElegido}; Talla: ${producto.producto.tallaElegida}</p>

                    </td>
    
                    <td class="goods-page-quantity">
                      <div class="product-quantity">
                          <input id="product-quantity"  type="text" value="${producto.cantidad}" readonly class="form-control input-sm">
                      </div>
                    </td>
                    <td class="goods-page-price" width="100">
                      <strong>${producto.producto.precio} €</strong>
                    </td>
                    <td class="goods-page-total" width="100">
                      <strong>${producto.producto.precio * producto.cantidad} €</strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:;">&nbsp;</a>
                    </td>
                  </tr>
                  <!-- repetir producto en bloque -->
                  </c:forEach>
                 </c:if>
                </table>
                </div>

                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>Subtotal</em>
                      <strong class="price"><span>170.48 </span>&euro;</strong>
                    </li>
                    <li>
                      <em>Coste de envio</em>
                      <strong class="price"><span>6.75 </span>&euro;</strong>
                    </li>
                    <li class="shopping-total-price">
                      <em>Total</em>
                      <strong class="price">177,23 &euro;</strong>
                    </li>
                  </ul>
                </div>
              </div>
              <a class="btn btn-default"  href="index.jsp" type="submit">Continuar comprando <i class="fa fa-shopping-cart"></i></a>
              <a class="btn btn-primary" href="confirmacion.jsp">Tramitar pedido <i class="fa fa-check"></i></a>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>
    
    <jsp:include page="pie.jsp"/>
   