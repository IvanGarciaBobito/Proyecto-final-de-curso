<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<%@ include file="cabecera.jsp" %>
		<div class="container">
			<div class="row main">
	            <script>
function consultamail ()
				{
	            	var mail =	$("#email").val();
					$.ajax
					('LoginControlador' ,
					{
							
							data: {'email' : mail} ,
							type:'post',
							cache:false,
							success: function (resultado) {
	               
	            	      	//alert (resultado); KO si hay otro mail igual en bd, OK si no
	        	            if (resultado == "ko")
							{
	        	               			    
	        	            			     $("#email").css('color','red');
	        	            			     $('#mailcont').html("<div style='color : red' class='col-sm-3'> Email en uso, elija otro </div>");
	        	            			     $("#botonNuevoUsuario").attr("disabled", "disabled")

	        	            			  
	        	            	}else{
	        	            					$("#email").css('color','green');
	        	            					$("#botonNuevoUsuario").removeAttr('disabled');
	        	            					$('#mailcont').html("");
	        		            			    
	        		            			 
	        	            	};           
							    }
							,error:function(){alert('error');
						
						}
					});      
				}
	     
	            </script>
	            
				<div class="main-login main-center" id="formreg">
				<div  id="mailcont"></div>
					<form id="frmNuevoUsuario" class="form-horizontal" method="post" action="LoginControlador">
					<input type="hidden" value="nuevo" name="op" id="op">
					<h1 class="title">Datos Personales</h1>
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label"> Su email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control" name="email" id="email" onchange="consultamail()"  placeholder="Introduzca su email" required/>
								
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Su nombre</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="nombre" id="nombre"  placeholder="Introduzca su nombre" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Apellidos</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="apellidos" id="apellidos"  placeholder="Introduzca sus apellidos" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Teléfono</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="telefono" id="telefono"  placeholder="Introduzca su teléfono" required/>
								</div>
							</div>
						</div>
			
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="passw"  placeholder="Introduzca su Password" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirme Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="rep_pass"  placeholder="Confirme su Password" required/>
								</div>
							</div>
						</div>
						<h1 class="title">Su dirección</h1>
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Población</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="poblacion" id="población"  placeholder="Introduzca su población" required/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Provincia</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="provincia" id="provincia"  placeholder="Introduzca su provincia" required/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Dirección</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="direccion" id="direccion"  placeholder="Introduzca su dirección" required/>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Código Postal</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="cp" id="cp"  placeholder="Introduzca su código postal" required/>
								</div>
							</div>
						</div>
				

						<div class="form-group ">
							<button value="Registrarse" type="button" onclick="validaNuevo()" id="botonNuevoUsuario" class="btn btn-primary btn-lg btn-block login-button" >Registrar</button>
						</div>
						<div class="login-register">
				         </div>
					</form>
				</div>
				
				
			</div>
		</div>

	<script>
	//Validación del mail según regex
	function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
}
				//Validación del formulario 
				function validaNuevo(){
					var flag = false;
					
					$(':input', '#formreg').each(function() {
							
						if (flag){
							return;
						}
							if (this.value == "" ){
								alert("Por favor rellene el campo " + this.name + " " + this.value + " " + this.id);
								flag = true;
								return;
							}
						//alert(this.name + ': ' + this.value);
							});
					if (flag){
						return;
					}
					var pass = $("#passw").val();
					var rep_pass = $("#rep_pass").val();
					var email = $("#email").val();
					if (pass !==rep_pass){
						alert("No coinciden las contraseñas");
						return;
						}
					else if (pass.length < 4){
						alert("El password debe tener más de 4 caracteres");
						return
					}
					
						if( !isValidEmailAddress( email ) ) { 
							alert ("Email incorrecto");
							return;
						}
					
					else{
						$("#op").val("nuevo");
					$("#frmNuevoUsuario").submit();
							}
					}
                  </script>
<%@ include file="pie.jsp" %>