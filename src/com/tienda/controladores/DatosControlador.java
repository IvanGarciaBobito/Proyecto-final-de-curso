package com.tienda.controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tienda.daos.DaoCategoriaMysql;
import com.tienda.daos.DaoColoresMysql;
import com.tienda.daos.DaoPedidosMysql;
import com.tienda.daos.DaoProductosMysql;
import com.tienda.daos.DaoTallasMysql;
import com.tienda.daos.DaoUsuarioMysql;

@WebServlet("/admin/DatosControlador")
public class DatosControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DatosControlador() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String datos = request.getParameter("op");
		if (datos == null | datos.isEmpty()) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

		String[] parse = datos.split(",");
		String op = parse[0];
		String clase = parse[1];
		int id = Integer.parseInt(parse[2]);

		switch (clase) {
		case "categoria":
			if ("eliminar".equals(op)) {
				DaoCategoriaMysql daoCategoria = new DaoCategoriaMysql();
				daoCategoria.Eliminar(id);
				response.sendRedirect("categorias.jsp");
				return;
			} else if ("modificar".equals(op)) {

			}
			break;
		case "color":
			if ("eliminar".equals(op)) {
				DaoColoresMysql daoColores = new DaoColoresMysql();
				daoColores.Eliminar(id);
				response.sendRedirect("colores.jsp");

			} else if ("modificar".equals(op)) {

			}
			break;
		case "talla":
			if ("eliminar".equals(op)) {
				DaoTallasMysql daoTallas = new DaoTallasMysql();
				daoTallas.Eliminar(id);
				response.sendRedirect("tallas.jsp");

			} else if ("modificar".equals(op)) {

			}
			break;
		case "usuario":
			if ("eliminar".equals(op)) {
				DaoUsuarioMysql daoUsuario = new DaoUsuarioMysql();
				daoUsuario.Eliminar(id);
				response.sendRedirect("usuarios.jsp");

			} else if ("modificar".equals(op)) {

			}
			break;
		case "producto":
			if ("eliminar".equals(op)) {
				DaoProductosMysql daoProductos = new DaoProductosMysql();
				daoProductos.Eliminar(id);
				response.sendRedirect("productos.jsp");

			} else if ("modificar".equals(op)) {

			}
			break;
		case "pedido":
			if ("eliminar".equals(op)) {
				DaoPedidosMysql daoPedidos = new DaoPedidosMysql();
				daoPedidos.Eliminar(id);
				response.sendRedirect("pedidos.jsp");

			} else if ("modificar".equals(op)) {

			}
			break;

		default:
			break;
		}

		

	}
}
