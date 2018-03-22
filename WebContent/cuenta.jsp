<%@page import="com.tienda.entidades.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	Usuario u = (Usuario) request.getSession().getAttribute("usuario");
	String nombre = u.getNombre();
	String email = u.getEmail();
	String apellidos = u.getApellidos();
	String telefono = u.getTelefono();
	String poblacion = u.getDireccion().getPoblacion();
	String provincia = u.getDireccion().getProvincia();
	String direccion = u.getDireccion().getDireccion();
	String cpos = u.getDireccion().getCogidoPostal();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="cabecera.jsp" />

<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.jsp">Principal</a></li>

            <li class="active">Mi cuenta</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix" onclick="vista('cambiarInfo' , '<%=email %>' , '<%=nombre%>', '<%= apellidos %>' , '<%=telefono%>' , '<%=poblacion%>'  ,  '<%=provincia %>' , '<%=direccion%>' , '<%=cpos%>' )"><a href="javascript:;"><i class="fa fa-angle-right"></i> <span  >Modificar información</span></a></li>
              <li class="list-group-item clearfix" onclick="vista ('cambiarPass')"> <a href="javascript:;"><i class="fa fa-angle-right"></i> <span > Cambiar Password</span></a></li>
               <li class="list-group-item clearfix"><a href="javascript:;"><i class="fa fa-angle-right"></i> Ver pedidos realizados</a></li>
               <li class="list-group-item clearfix" onclick="vista('eliminar')"><a href="javascript:;"><i class="fa fa-angle-right"></i> Eliminar cuenta</a></li>

            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class=" col-xs-7">
             <h3>Mi cuenta</h3>
            <div class="content-page" id="contenido">
                           <!--  EMPIEZA AQUI EL FRM -->
				<!--  Modificar Datos de los Usuarios -->

			<!--  Cambiar password con el op para el controlador cambiaPass -->
			
				<!-- Fin del pass -->
				
				
			</div>
		</div>	
	<script>
				function validaNuevo(){
					var pass = $("#passw").val();
					var rep_pass = $("#rep_pass").val();
					if (pass !==rep_pass){
						alert("No coinciden las contraseñas");
						return;
						}
					else if (pass.length < 4){
						alert("El password debe tener más de 4 caracteres");
						return
					}
					else{
						$("#op").val("cambiarPass");
					$("#frmcambiapass").submit();
							}
					}
                  </script>
   		

            </div>
          </div>
          <!-- END CONTENT -->
          
    
          
        </div>
        <!-- END SIDEBAR & CONTENT -->
        <!-- ScriptS -->
     <script>
    function vista (id,email,nombre,apellidos,telefono,poblacion,provincia,direccion,cp){
       if (id == 'cambiarInfo'){
    	   document.getElementById("contenido").innerHTML ="<div class='main-login main-center' class='esconder' id='formreg' > <form id='frmNuevoUsuario' class='form-horizontal' method='post' action='LoginControlador'> <input type='hidden' value='cambiarInfo' name='op' id='op'><h1 class='title'>Datos Personales</h1><div class='form-group row'><label for='name' class='cols-xs-4 control-label'> Su email</label><div class='cols-xs-4'><div class='input-group'><span class='input-group-addon'><i class='fa fa-user fa' aria-hidden='true'></i></span>	<input type='email' class='form-control' value='" + email + "' name='email' id='email'  placeholder='Introduzca su email' required/></div></div></div><div class='form-group'><label for='email' class='cols-xs-4 control-label'>Su nombre</label><div class='cols-xs-4'><div class='input-group'><span class='input-group-addon'><i class='fa fa-envelope fa' aria-hidden='true'></i></span><input type='text' class='form-control' value='"+ nombre +"' name='nombre' id='nombre'  placeholder='Introduzca su nombre' required/></div></div></div><div class='form-group'><label for='username' class='cols-xs-4 control-label'>Apellidos</label><div class='cols-xs-4'>	<div class='input-group'><span class='input-group-addon'><i class='fa fa-users fa' aria-hidden='true'></i></span><input type='text' class='form-control' value='" + apellidos + "' name='apellidos' id='apellidos'  placeholder='Introduzca sus apellidos' required/>	</div></div></div>	<div class='form-group'><label for='username' class='cols-xs-4 control-label'>Teléfonos</label><div class='cols-xs-4'>	<div class='input-group'><span class='input-group-addon'><i class='fa fa-users fa' aria-hidden='true'></i></span><input type='text' class='form-control' value='" + telefono + "' name='telefono' id='telefono'  placeholder='Introduzca su teléfono' required/>	</div></div></div>	<h1 class='title'>Su dirección</h1><div class='form-group'>	<label for='username' class='cols-xs-4 control-label'>Población</label>	<div class='cols-xs-4'>	<div class='input-group'><span class='input-group-addon'><i class='fa fa-home' aria-hidden='true'></i></span><input type='text' class='form-control' value='" + poblacion + "' name='poblacion'  id='población'  placeholder='Introduzca su población' required/></div></div></div>	<div class='form-group'>	<label for='username' class='cols-xs-4 control-label'>Provincia</label>	<div class='cols-xs-4'>	<div class='input-group'><span class='input-group-addon'><i class='fa fa-home' aria-hidden='true'></i></span><input type='text' class='form-control' value='" + provincia + "' name='provincia' id='provincia'  placeholder='Introduzca su provincia' required/></div></div></div>	   <div class='form-group'>	<label for='username' class='cols-xs-4 control-label'>Dirección</label>	<div class='cols-xs-4'>		<div class='input-group'><span class='input-group-addon'><i class='fa fa-home' aria-hidden='true'></i></span>			<input type='text' class='form-control' value='" + direccion + "' name='direccion' id='direccion'  placeholder='Introduzca su dirección' required/></div></div></div><div class='form-group'><label for='username' class='cols-xs-4 control-label'>Código Postal</label><div class='cols-xs-4'>	<div class='input-group'><span class='input-group-addon'><i class='fa fa-home' aria-hidden='true'></i></span><input type='text' class='form-control' value='" + cp + "' name='cp' id='cp'  placeholder='Introduzca su código postal' required/></div>	</div>	</div>	<div class='form-group '><button type='submit' class='btn btn-primary btn-lg btn-block login-button'>Registrar</button>	</div>	<div class='login-register'>  </div></form>	</div>";/*Fin de cambiar info*/
       }else if (id == 'cambiarPass'){
    	   document.getElementById('contenido').innerHTML ="<div class='main-login main-center' id='formpass'><form id='frmcambiapass' method='post' action='LoginControlador'><input type='hidden' value='cambiarPass' name='op' id='op'><div class='form-group'><label for='password' class='cols-xs-4 control-label'>Password anterior</label><div class='cols-xs-4'><div class='input-group'><span class='input-group-addon'><i class='fa fa-lock fa-lg' aria-hidden='true'></i></span><input type='password' class='form-control' name='passwordAnterior' id='pw'  placeholder='Introduzca su Password' required/></div></div></div><div class='form-group'><label for='password' class='cols-xs-4 control-label'>Password</label><div class='cols-xs-4'><div class='input-group'><span class='input-group-addon'><i class='fa fa-lock fa-lg' aria-hidden='true'></i></span><input type='password' class='form-control' name='password' id='passw'  placeholder='Introduzca su Password' required/></div></div></div><div class='form-group'><label for='confirm' class='cols-xs-4 control-label'>Confirme Password</label><div class='cols-xs-4'><div class='input-group'><span class='input-group-addon'><i class='fa fa-lock fa-lg' aria-hidden='true'></i></span><input type='password' class='form-control' name='confirm' id='rep_pass'  placeholder='Confirme su Password' required/></div></div></div><button class='btn btn-primary btn-lg btn-block login-button' type='button' onclick='validaNuevo()'> Enviar </button>	</form></div> " 
    	   }else if (id == 'eliminar'){
              document.getElementById('contenido').innerHTML ="<form id='frmcambiapass' method='post' action='LoginControlador'><input type='hidden' value='cambiarInfo' name='op' id='op'><h3>¿ Quiere eliminar su cuenta ?</h3>   <button type='button' onclick='borrar()' class='btn btn-danger btn-lg'>Sí</button> <button type='button' class='btn btn-success btn-lg' onclick ='noBorrar()'>No</button>  <div class='alert alert-warning'>Al eliminar tu cuenta, perderás toda la información relacionada con tu actividad en nuestra página</div></form>"
    		   
    	   }
    	
      }
	
     function borrar() {
    	 $("#op").val("borrar");
			$("#frmcambiapass").submit();
					}
	
     function noBorrar () {
    	 window.location.replace("cuenta.jsp");
     }
    </script> 

      <jsp:include page="pie.jsp"/>