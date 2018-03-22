package com.tienda.controladores;

import com.tienda.gestores.*;import java.awt.color.CMMException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tienda.daos.DaoProductoMysql;
import com.tienda.daos.DaoProductosMysql;
import com.tienda.entidades.Producto;

/**
 * Servlet implementation class ControladorProduto
 */
@WebServlet("/ControladorProduto")
public class ControladorProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorProduto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sorter = "aa";
		String categoria = "0";
		
		String op = request.getParameter("op");
		String nombre = "";
		DaoProductoMysql dp = new DaoProductoMysql();
		List<Producto> lp = new ArrayList<>();
		
		if ("precio".equals(op)) {
		
			if (request.getParameter("precioMaximo") != null || request.getParameter("precioMinimo") != "" || request.getParameter("precioMinimo") != null || request.getParameter("precioMaximo") != "") {
				int pmax =Integer.parseInt(request.getParameter("precioMaximo"));
				int pmin =Integer.parseInt(request.getParameter("precioMinimo"));
				lp = dp.listaPorPreciosAsc(pmin, pmax);
			} 
			
			
		}else {
		if ("nombre".equals(op)) {
			if (request.getParameter("bpn") != null || request.getParameter("bpn") != "") {
				nombre = request.getParameter("bpn");
			} 
		lp = dp.listaPorNombreHQL(nombre);
		
	
		}else {
		
		//Selección de lista ordenada con todos los resultados
		if (request.getParameterMap().containsKey("ordenar")) {
			 sorter = request.getParameter("ordenar");
			}
			
		System.out.println(op);
	
		 lp = dp.listar();
		 //Selección de lista por ctegorías (id)
	
		System.out.println("categoria " + categoria + " ORDER " + sorter);
		
		
		if (request.getParameterMap().containsKey("categoria") ) {
			categoria = request.getParameter("categoria");
			System.out.println("CATEGORIA :" + categoria);
			
		}
			if (categoria != "0") {
				
					lp = dp.listaPorCategorias(categoria);
				if("aa".equals(sorter))  {
					Collections.sort(lp, new comparadorProductosNombre());
			}else if("ad".equals(sorter)) {
				Collections.sort(lp, new comparadorProductosNombre().reversed());
			}else if ("pa".equals(sorter)) {
				System.out.println("pa");
				Collections.sort(lp, new comparadorProductosPrecio());
			}else if ("pd".equals(sorter)) {
				System.out.println("pd");
				Collections.sort(lp, new comparadorProductosPrecio());
				}
				
					
			}else {
				
				if("aa".equals(sorter)) {
					lp = dp.listaPorNombreTodosAsc();
			}else if("ad".equals(sorter)) {
					lp = dp.listaPorNombreTodosDesc();
			}else if ("pa".equals(sorter)) {
					lp = dp.listaPorPrecioTodosAsc();
			}else if ("pd".equals(sorter)) {
					lp = dp.listaPorPrecioTodosDesc();
				}
				
			}
		
		
		}}
		for (Producto p : lp) {
			System.out.println("> " + p.getNombre());
		}
		
		
		int totalProductos = lp.size();
		int prodPorPagina = 10;
		if (request.getParameter("ppp") != null || request.getParameter("ppp") != "") {
		prodPorPagina = Integer.parseInt(request.getParameter("ppp"));
		}
		
		int numeroDePaginas = totalProductos/prodPorPagina;
		if (totalProductos % prodPorPagina != 0) {
			numeroDePaginas++;
		}
		if(numeroDePaginas == 0) {
			numeroDePaginas = 1;
		}
		int paginaActual = 0;
		 if (request.getParameter("numPag") != null || request.getParameter("numPag") !="") {
		 paginaActual = Integer.parseInt(request.getParameter("numPag"));
			 }
		 		if (paginaActual >= numeroDePaginas) {
		 			paginaActual = 0;
		 		}
		
			
		
		int min = prodPorPagina * paginaActual;
		
		int max = min + prodPorPagina;
		if(paginaActual+1 == numeroDePaginas) {
			max = totalProductos;
		}
		if (max == 0 ) {
			max =1;
		}
		System.out.println("MIN " + min + " MAX:" + max +" pagina actual " + paginaActual);
		request.setAttribute("categoria", categoria);
		request.setAttribute("bajo", min);
		request.setAttribute("arriba", max);
		request.setAttribute("numeroDePaginas", numeroDePaginas);
		request.setAttribute("paginaActual", paginaActual);
		request.setAttribute("prodPorPagina", prodPorPagina);
		request.setAttribute("lista", lp);
		request.setAttribute("name", nombre);
		request.setAttribute("ordenar", sorter);
		request.getRequestDispatcher("listaproducto.jsp").forward(request, response);
		
	}

}
