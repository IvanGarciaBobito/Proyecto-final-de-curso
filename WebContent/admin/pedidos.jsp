<%@page import="com.tienda.entidades.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="com.tienda.daos.DaoPedidosMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="cabecera.jsp"/>

<%
DaoPedidosMysql dao = new DaoPedidosMysql();
List<Pedido> listaPedidos = dao.listar();
%>
<div id="page-wrapper">
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Pedidos</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Fecha pedido</th>
                                        <th>Fecha envio</th>
                                        <th>Fecha entrega</th>
                                        <th>Importe</th>
                                        <th width="165" align="right">Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="<%=listaPedidos%>" var="pedido">
                                    <tr>
                                    	<td>${pedido.id}</td>
                                        <td>${pedido.fechaPedido}</td>
                                        <td>${pedido.fechaEnvio}</td>
                                        <td>${pedido.fechaEntrega}</td>
                                        <td>${pedido.importe} €</td>
                                        <td><form action="DatosControlador" method="post">         
                                       <button type="submit"  name ="op" value="eliminar,pedido,${pedido.id}" >borrar</button>
                                       <button type="submit" name ="op" id="op" value="modificar,pedido,${pedido.id}">Modificar</button></form></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
                 </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>

        <!-- /#page-wrapper -->
<jsp:include page="pie.jsp"/>