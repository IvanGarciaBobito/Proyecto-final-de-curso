<%@page import="java.util.ArrayList"%>
<%@page import="com.tienda.entidades.ColorDisponible"%>
<%@page import="java.util.List"%>
<%@page import="com.tienda.daos.DaoColoresMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="cabecera.jsp"></jsp:include>
<%
DaoColoresMysql dao = new DaoColoresMysql();
List<ColorDisponible> listaColores = dao.listar();

//https://stackoverflow.com/questions/20802123/select-an-item-from-a-list-in-jstl
//https://stackoverflow.com/questions/6946358/writing-a-single-servlet-to-add-edit-delete-an-item-and-also-to-list-items
%>


<div id="page-wrapper">
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Colores</h1>
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
                                        <th>Color</th>
                                        <th width="165" align="right">Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
  
                                <c:forEach items="<%=listaColores%>" var="color">
                                    <tr>
                                    	<td>${color.id}</td>
                                        <td>${color.nombre}</td>
                                       <td><form action="DatosControlador" method="post">         
                                       <button type="submit"  name ="op" value="eliminar,color,${color.id}" >borrar</button>
                                       <button type="submit" name ="op" id="op" value="modificar,color,${color.id}">Modificar</button></form></td>
                                    </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <button class="btn btn-primary" >Añadir colores</button>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
                 </div>
            <!-- /.row -->

        <!-- /#page-wrapper -->
<jsp:include page="pie.jsp"></jsp:include>