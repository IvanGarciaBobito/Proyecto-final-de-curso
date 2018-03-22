package com.tienda.controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tienda.daos.DaoUsuario;
import com.tienda.entidades.Direccion;
import com.tienda.entidades.Usuario;
import com.tienda.gestores.GestorUsuarios;


@WebServlet("/LoginControlador")
public class LoginControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestorUsuarios gu;

    public LoginControlador() {
        super();

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Consulta ajax para saber si existe el email en la página de registro


        if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))){
            String correo = request.getParameter("email");
            DaoUsuario du = new DaoUsuario();
          String mail =   du.ajaxMail(correo);
          response.setContentType("text/plain"); 
          response.setCharacterEncoding("UTF-8");
            if (mail == null) {
            	response.getWriter().write("ok");
            }else {
            	response.getWriter().write("ko");
            }
        }
		
	
		
		
		//Si nuevo usuario.. 
        else {
		if (request.getParameter("op") == null) {
			System.out.println("OP NULA");
		}
		String op = request.getParameter("op");
		if ("nuevo".equals(op)) {

			Enumeration<String> en = request.getParameterNames();
			
			while (en.hasMoreElements()) {
				String rev = en.nextElement();
				if ( rev == null || "".equals(rev) ){
					System.out.println("Campo en blanco");
					return;
				}
			}
			//usuario
			ArrayList<String> datosUsuario = new ArrayList<>();
			datosUsuario.add(request.getParameter("telefono"));
			datosUsuario.add(request.getParameter("email"));
			datosUsuario.add(request.getParameter("password"));
			datosUsuario.add(request.getParameter("nombre"));
			datosUsuario.add(request.getParameter("apellidos"));
		//direcciÃ³n
			ArrayList<String> datosDireccion = new ArrayList<>();
			datosDireccion.add(request.getParameter("direccion"));
			datosDireccion.add(request.getParameter("poblacion"));
			datosDireccion.add(request.getParameter("provincia"));
			datosDireccion.add(request.getParameter("codPostal"));
		
			gu = new GestorUsuarios();
	
		if (gu.nuevoUsuario(datosUsuario, datosDireccion)> 0) {
			
			if (request instanceof HttpServletRequest) {
				//Redirigir a la pÃ¡gina del request
				  //String uri = request.getRequestURI();
				  String url = request.getHeader("referer");
				  String query = ((HttpServletRequest)request).getQueryString();
				  System.out.println("nuevo usuario " + url + query);
				  request.setAttribute("informacion", "Creado usuario " + datosUsuario.get(3));
				  request.getRequestDispatcher("index.jsp").forward(request, response);
				}
		}
		}
		
		else if ("login".equals(op)){
			
			String email = request.getParameter("emaillog");
			String password = request.getParameter("passwordlog");
			DaoUsuario du = new DaoUsuario();
			Usuario u = du.logear(email, password);
			
			if (u != null) {
				request.getSession().invalidate();
				request.getSession().setAttribute("usuario", u);
				request.getSession().setAttribute("tipo", u.getTipoUsuario());
				System.out.println("Sesión iniciada usuario : " + u.getNombre() );
				request.setAttribute("informacion", "Bienvenido " + u.getNombre());

				 request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				
				System.out.println("Sesión no iniciada"  );
				request.setAttribute("informacion", "No ha podido logearse, no se encuentran coincidencias");
				request.getRequestDispatcher("index.jsp").forward(request, response);

			}
		}
		/**
		 * Para cambiar la información del usuario: no el password
		 */
		else if ("cambiarInfo".equals(op)) {
			Usuario user = new Usuario();
			
			if (request.getSession().getAttribute("usuario") != null) {
				 user = (Usuario) request.getSession().getAttribute("usuario");
			}else {
				System.out.println("No está logeado!!!");
				response.sendRedirect("index.jsp");
			}
			
			Enumeration<String> en = request.getParameterNames();
			
			while (en.hasMoreElements()) {
				String rev = request.getParameter(en.nextElement());
				if ( rev == null || "".equals(rev) ){
					System.out.println("Campo en blanco");
					response.sendRedirect("index.jsp");
				}
			}
			String telefono = request.getParameter("telefono");
			String email = request.getParameter("email");
			String nombre = request.getParameter("nombre");
			String apellidos = request.getParameter("apellidos");
			//direcciÃ³n
			String direccion = request.getParameter("direccion");
			String poblacion = request.getParameter("poblacion");
			String provincia = request.getParameter("provincia");
			String codPostal = request.getParameter("codPostal");
			
			user.setTelefono(telefono);
			user.setApellidos(apellidos);
			user.setEmail(email);
			user.setNombre(nombre);
			user.setTelefono(telefono);

		
			Direccion dir = new Direccion();
			
			dir.setCogidoPostal(codPostal);
			dir.setProvincia(provincia);
			dir.setDireccion(direccion);
			dir.setPoblacion(poblacion);
		
			user.setDireccion(dir);
			
			DaoUsuario du = new DaoUsuario();
			boolean flag = du.modificar(user);
			if (flag){
				request.getSession().setAttribute("usuario", user);
				if (request instanceof HttpServletRequest) {
					//Redirigir a la pÃ¡gina del request
					  //String uri = request.getRequestURI();
					  String url = request.getHeader("referer");
					  String query = ((HttpServletRequest)request).getQueryString();
					  System.out.println("Usuario modificado " + url + query);
					  request.setAttribute("informacion", "Usuario modificado correctamente: " + user.getNombre());
					  request.getRequestDispatcher("index.jsp").forward(request, response);
					}
			}
			
		}
		else if ("borrar".equals(op)) {
			Usuario u = (Usuario) request.getSession().getAttribute("usuario");
			DaoUsuario du = new DaoUsuario();
			if (du.borrarUsuario(u)) {
				System.out.println("Usuario eliminado correctamente");
				request.getSession().invalidate();
				request.setAttribute("informacion", "Usuario eliminado correctamente");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				System.out.println("Error al borrar usuario");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		
		else if ("cambiarPass".equals(op)) {
			System.out.println("Entrando en cambiarpass");
			String pass = request.getParameter("passwordAnterior");
			Usuario u = (Usuario) request.getSession().getAttribute("usuario");
			String email = u.getEmail();
			DaoUsuario du = new DaoUsuario();
			boolean flag0 = du.checkPass(email, pass);
			if (flag0) {
				String nuevoPass = request.getParameter("password");
				u.setPassword(nuevoPass);
				boolean flag = du.modificar(u);
				if (flag){
					request.getSession().setAttribute("usuario", u);
					if (request instanceof HttpServletRequest) {
						//Redirigir a la pÃ¡gina del request
						  //String uri = request.getRequestURI();
						 // String url = request.getHeader("referer");
						  //String query = ((HttpServletRequest)request).getQueryString();
						  System.out.println("Contraseña modificada " );
						  request.getRequestDispatcher("index.jsp").forward(request, response);
						}
				}
				
			}else {
				request.setAttribute("error", "Contraseña no válida");
				request.getRequestDispatcher("cuenta.jsp").forward(request, response);
			}

		}
		
		else if ("cerrarSesion".equals(op)) {
			request.getSession().invalidate();
			request.setAttribute("informacion", "Hasta pronto");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

	}
}
