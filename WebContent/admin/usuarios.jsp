<%@page import="com.tienda.daos.DaoUsuarioMysql"%>
<%@page import="com.tienda.entidades.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="cabecera.jsp"/>
<%
DaoUsuarioMysql dao = new DaoUsuarioMysql();
List<Usuario> listaUsuarios = dao.listar();
%>

<div id="page-wrapper">
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Usuarios</h1>
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
                                        <th>Apellidos</th>
                                        <th>Email</th>
                                        <th>Telefono</th>
                                        <th>TipoUsuario</th>
                                        <th width="165" align="right">Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="<%=listaUsuarios %>" var="usuario">
                                    <tr>
                                        <td>${usuario.id}</td>
                                        <td>${usuario.nombre }</td>
                                        <td>${usuario.apellidos }</td>
                                        <td>${usuario.email }</td>
                                        <td>${usuario.telefono }</td>
                                        <td>${usuario.tipoUsuario}</td>
                                        <td><form action="DatosControlador" method="post">         
                                       <button type="submit"  name ="op" value="eliminar,usuario,${usuario.id}" >borrar</button>
                                       <button type="submit" name ="op" id="op" value="modificar,usuario,${usuario.id}">Modificar</button></form></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <button class="btn btn-primary" >Añadir usuarios</button>
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