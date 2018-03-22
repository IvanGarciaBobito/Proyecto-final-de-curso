<%@page import="com.tienda.entidades.TallaDisponible"%>
<%@page import="java.util.List"%>
<%@page import="com.tienda.daos.DaoTallasMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="cabecera.jsp"/>
<%
DaoTallasMysql dao = new DaoTallasMysql();
List<TallaDisponible> listatallas = dao.listar();
%>
<div id="page-wrapper">
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tallas</h1>
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
                                        <th>Talla</th>
                                        <th width="165" align="right">Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="<%=listatallas%>" var="producto">
                                    <tr>
                                    	<td>${producto.id}</td>
                                        <td>${producto.nombre}</td>   
                                        <td><form action="DatosControlador" method="post">         
                                       <button type="submit"  name ="op" value="eliminar,talla,${producto.id}" >borrar</button>
                                       <button type="submit" name ="op" id="op" value="modificar,talla,${producto.id}">Modificar</button></form></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <button class="btn btn-primary" >Añadir tallas</button>
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