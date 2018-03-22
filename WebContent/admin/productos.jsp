<%@page import="com.tienda.entidades.Producto"%>
<%@page import="java.util.List"%>
<%@page import="com.tienda.daos.DaoProductosMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="cabecera.jsp"/>
<%
DaoProductosMysql dao = new DaoProductosMysql();
List<Producto> listaProductos = dao.listar();
%>
<div id="page-wrapper">
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Productos</h1>
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
                                        <th>Nombre</th>
                                        <th>Precio</th>
                                        <th>Descripcion</th>
                                        <th>ImagenUrl</th>
                                        <th>Color</th>
                                        <th>Talla</th>
                                        <th width="165" align="right">Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="<%=listaProductos%>" var="producto">
                                    <tr>
                                    	<td>${producto.id}</td>
                                        <td>${producto.nombre}</td>
                                        <td>${producto.precio} €</td>
                                        <td>${producto.descripcion }</td>
                                        <td>${producto.imagenUrl }</td>
                                        <td>${producto.colorElegido}</td>
                                        <td>${producto.tallaElegida}</td>
                                        <td><form action="DatosControlador" method="post">         
                                       <button type="submit"  name ="op" value="eliminar,producto,${producto.id}" >borrar</button>
                                       <button type="submit" name ="op" id="op" value="modificar,producto,${producto.id}">Modificar</button></form></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <button class="btn btn-primary" >Añadir productos</button>
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