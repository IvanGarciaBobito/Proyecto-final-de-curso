<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.tienda.daos.DaoCategoriaMysql"%>
<%@page import="com.tienda.entidades.Categoria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="cabecera.jsp"></jsp:include>
<%
DaoCategoriaMysql dao = new DaoCategoriaMysql();
List<Categoria> listaCategorias = dao.listar();
%>
<div id="page-wrapper">
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Categorias</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                       
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Nombre</th>
                                        <th>Genero</th>
                                        <th width="165" align="right">Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="<%=listaCategorias %>" var="categoria">
                                    <tr>
                                        <td>${categoria.id}</td>
                                        <td>${categoria.nombre }</td>
                                        <td>${categoria.genero }</td>
                                        <td><form action="DatosControlador" method="post">         
                                       <button  type="submit"  name ="op" value="eliminar,categoria,${categoria.id}" >borrar</button>
                                       <button type="submit" name ="op" id="op" value="modificar,categoria,${categoria.id}">Modificar</button></form></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <button class="btn btn-primary">Añadir categorias</button>
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
        <jsp:include page="pie.jsp"></jsp:include>