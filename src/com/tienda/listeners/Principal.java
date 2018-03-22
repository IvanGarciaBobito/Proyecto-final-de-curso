package com.tienda.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.tienda.daos.DaoCategoriaMysql;
import com.tienda.daos.DaoColoresMysql;
import com.tienda.daos.DaoPedidosMysql;
import com.tienda.daos.DaoPedidosProductos;
import com.tienda.daos.DaoProductosMysql;
import com.tienda.daos.DaoTallasMysql;
import com.tienda.daos.DaoUsuarioMysql;
import com.tienda.entidades.Categoria;
import com.tienda.entidades.ColorDisponible;
import com.tienda.entidades.Direccion;
import com.tienda.entidades.Pedido;
import com.tienda.entidades.PedidoProducto;
import com.tienda.entidades.Producto;
import com.tienda.entidades.TallaDisponible;
import com.tienda.entidades.Usuario;
import com.tienda.utilidades.Hibernate5Utils;


@WebListener
public class Principal implements HttpSessionListener, ServletRequestListener, ServletContextListener {


    public Principal() {

    }


    public void sessionCreated(HttpSessionEvent arg0)  { 
    	
    }


    public void requestDestroyed(ServletRequestEvent arg0)  { 

    }


    public void requestInitialized(ServletRequestEvent arg0)  { 
        
    }


    public void sessionDestroyed(HttpSessionEvent arg0)  { 

    }


    public void contextDestroyed(ServletContextEvent arg0)  { 
    	Hibernate5Utils.shutdown();
    }


    public void contextInitialized(ServletContextEvent arg0)  { 
    	//iniciamos e insertamos objetos en la Bd para probar
    	DaoProductosMysql dao = new DaoProductosMysql();
    	DaoCategoriaMysql daocat = new DaoCategoriaMysql();
    	DaoUsuarioMysql daousu = new DaoUsuarioMysql();
    	DaoColoresMysql daocol = new DaoColoresMysql();
    	DaoPedidosMysql daoped = new DaoPedidosMysql();
    	DaoTallasMysql daotall = new DaoTallasMysql();
    
			//Categorias iniciales
			Categoria categoria = new Categoria();
			Categoria categoria2 = new Categoria();
			Categoria categoria3 = new Categoria();
			Categoria categoria4 = new Categoria();
			
			ColorDisponible color = new ColorDisponible();
	    	ColorDisponible color2 = new ColorDisponible();
	    	ColorDisponible color3 = new ColorDisponible();
	    	ColorDisponible color4 = new ColorDisponible();
	    	ColorDisponible color5 = new ColorDisponible();
	    	
	    	
	    	
	    	TallaDisponible talla = new TallaDisponible();
	    	TallaDisponible talla2 = new TallaDisponible();
	    	TallaDisponible talla3 = new TallaDisponible();
	    	TallaDisponible talla4 = new TallaDisponible();
	    	TallaDisponible talla5 = new TallaDisponible();
	    	
	    	
				categoria.setNombre("Zapatillas");
		    	categoria.setGenero("Hombre"  );
		    	daocat.nuevo(categoria);
		    	
		    	categoria2.setNombre("Zapatillas");
		    	categoria2.setGenero("Mujer"  );
		    	daocat.nuevo(categoria2);
		    	
		    	categoria3.setNombre("Zapatos");
		    	categoria3.setGenero("Hombre"  );
		    	daocat.nuevo(categoria3);
		    	
		    	categoria4.setNombre("Zapatos");
		    	categoria4.setGenero("Mujer"  );
		    	daocat.nuevo(categoria4);
			// Fin de las categorias iniciales
		    	
		    //Prodcutos iniciales
		    	Producto producto = new Producto();
				Producto producto2 = new Producto();
				Producto producto3 = new Producto();
				Producto producto4 = new Producto();
				Producto producto5 = new Producto();
				Producto producto6 = new Producto();
				Producto producto7 = new Producto();
				Producto producto8 = new Producto();
				Producto producto9 = new Producto();
				Producto producto10 = new Producto();
				Producto producto11 = new Producto();
				Producto producto12 = new Producto();
				Producto producto13 = new Producto();
				Producto producto14 = new Producto();
				Producto producto15 = new Producto();
				Producto producto16 = new Producto();
				Producto producto17 = new Producto();
				Producto producto18 = new Producto();
				Producto producto19 = new Producto();
				Producto producto20 = new Producto();
				Producto producto21 = new Producto();
				
		    	producto.setNombre("Adidas Gazelle");
		    	producto.setPrecio(89.97 );
		    	producto.setDescripcion("Material exterior: Sintético\r\n" + 
		    			"Revestimiento: Sintético\r\n" + 
		    			"Material de la suela: Sintético\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Tipo de tacón: Plano\r\n" + 
		    			"Composición: Suede, tela");
		    	producto.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/adidas/Adidas Gazelle.jpg");
		    	
		    	producto2.setNombre("Adidas Superstar");
		    	producto2.setPrecio(90.51);
		    	producto2.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto2.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/adidas/Adidas Superstar.jpg");
		    	
		    	producto3.setNombre("Mustang Chapo");
		    	producto3.setPrecio(75.35);
		    	producto3.setDescripcion("Material exterior: Lona\r\n" + 
		    			"Material de la suela: Goma\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Tipo de tacón: 2 CM\r\n" + 
		    			"Composición: NYLON");
		    	producto3.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/Mustang/Mustang Chapo.jpg");
		    	
		    	producto4.setNombre("Mustang Jogger");
		    	producto4.setPrecio(68.25);
		    	producto4.setDescripcion("Material exterior: Tela\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Goma/Sintético\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Tipo de tacón: Plano\r\n" + 
		    			"Composición: NYLON\r\n" + 
		    			"Anchura del zapato: Normal");
		    	producto4.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/Mustang/Mustang Jogger.jpg");
		    	
		    	producto5.setNombre("New Balance 373");
		    	producto5.setPrecio(102.53);
		    	producto5.setDescripcion("Material exterior: Cuero\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Goma\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Tipo de tacón: Plano");
		    	producto5.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/New Balance/NewBalance 373.jpg");
		    	
		    	producto6.setNombre("New Balance M565");
		    	producto6.setPrecio(100.89);
		    	producto6.setDescripcion("Material exterior: Cuero\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Goma\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: null");
		    	producto6.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/New Balance/NewBalance M565.jpg");
		    	
		    	producto7.setNombre("Reebok Classic");
		    	producto7.setPrecio(110.89);
		    	producto7.setDescripcion("Material exterior: Cuero\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Goma\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: null");
		    	producto7.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/Reebok/Reebok Classic.jpg");
		    	
		    	producto8.setNombre("Reebok Urban");
		    	producto8.setPrecio(101.89);
		    	producto8.setDescripcion("Material exterior: Cuero\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Goma\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: null");
		    	producto8.setImagenUrl("assets/pages/img/products/zapatillas/Hombre/Reebok/Reebok Urban.jpg");
		    	
		    	//mujer
		    	producto9.setNombre("Adidas Gazelle M");
		    	producto9.setPrecio(89.97);
		    	producto9.setDescripcion("Material exterior: Sintético\r\n" + 
		    			"Revestimiento: Sintético\r\n" + 
		    			"Material de la suela: Sintético\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Tipo de tacón: Plano\r\n" + 
		    			"Composición: Suede, tela");
		    	producto9.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/Adidas/Adidas Gazelle.jpg");
		    	
		    	producto10.setNombre("Adidas Superstar M");
		    	producto10.setPrecio(90.51);
		    	producto10.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto10.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/Adidas/Adidas Superstar.jpg");
		    	
		    	producto11.setNombre("Mustang Mani");
		    	producto11.setPrecio(95.51);
		    	producto11.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto11.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/Mustang/Mustang Mani.jpg");
		    	
		    	producto12.setNombre("Mustang Rolli");
		    	producto12.setPrecio(102.51);
		    	producto12.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto12.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/Mustang/Mustang Rolli.jpg");
		    	
		    	producto13.setNombre("NewBalance GW500NSB");
		    	producto13.setPrecio(79.51);
		    	producto13.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto13.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/New Balance/NewBalance GW500NSB.jpg");
		    	
		    	producto14.setNombre("NewBalance GW5454");
		    	producto14.setPrecio(80.51);
		    	producto14.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto14.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/New Balance/NewBalance GW5454.jpg");
		    	
		    	producto15.setNombre("Reebok HV");
		    	producto15.setPrecio(86.51);
		    	producto15.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto15.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/Reebok/Reebok HV.jpg");
		    	
		    	producto16.setNombre("Reebok runner");
		    	producto16.setPrecio(56.51);
		    	producto16.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto16.setImagenUrl("assets/pages/img/products/zapatillas/Mujer/Reebok/Reebok runner.jpg");
		    	
		    	//zapatos hombre
		    	
		    	producto17.setNombre("EL Ganso blue");
		    	producto17.setPrecio(123.58);
		    	producto17.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto17.setImagenUrl("assets/pages/img/products/zapatos/Hombre/El ganso/ELGanso blue.jpg");
		    	
		    	producto18.setNombre("EL Ganso HTR");
		    	producto18.setPrecio(127.74);
		    	producto18.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto18.setImagenUrl("assets/pages/img/products/zapatos/Hombre/El ganso/ELGanso HTR.jpg");
		    	
		    	//mujer
		    	producto19.setNombre("Krisp GRE");
		    	producto19.setPrecio(47.74);
		    	producto19.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto19.setImagenUrl("assets/pages/img/products/zapatos/Mujer/Krisp/Krisp gre.jpg");
		    	
		    	producto20.setNombre("Krisp party");
		    	producto20.setPrecio(38.89);
		    	producto20.setDescripcion("Material exterior: Other Leather\r\n" + 
		    			"Revestimiento: Tela\r\n" + 
		    			"Material de la suela: Gum Rubber\r\n" + 
		    			"Cierre: Cordones\r\n" + 
		    			"Composición: Leather");
		    	producto20.setImagenUrl("assets/pages/img/products/zapatos/Mujer/Krisp/Krisp party.jpg");
		    	
		    	
		    	
		    
		    	
		    	categoria.add(producto);
		    	categoria.add(producto2);
		    	categoria.add(producto3);
		    	categoria.add(producto4);
		    	categoria.add(producto5);
		    	categoria.add(producto6);
		    	categoria.add(producto7);
		    	categoria.add(producto8);
		    	
		    	categoria2.add(producto9);
		    	categoria2.add(producto10);
		    	categoria2.add(producto11);
		    	categoria2.add(producto12);
		    	categoria2.add(producto13);
		    	categoria2.add(producto14);
		    	categoria2.add(producto15);
		    	categoria2.add(producto16);
		    	
		    	categoria3.add(producto17);
		    	categoria3.add(producto18);
		    	
		    	categoria4.add(producto19);
		    	categoria4.add(producto20);
		    	
		    	color.setNombre("azul");
		    	color2.setNombre("rosa");
		    	color3.setNombre("rojo");
		    	color4.setNombre("verde");
		    	color5.setNombre("negro");
		    	
		    	daocol.nuevo(color);
		    	daocol.nuevo(color2);
		    	daocol.nuevo(color3);
		    	daocol.nuevo(color4);
		    	daocol.nuevo(color5);
		    	producto.setColorElegido("azul");
		    	producto2.setColorElegido("rojo");
		    	producto3.setColorElegido("rojo");
		    	producto4.setColorElegido("verde");
		    	producto5.setColorElegido("azul");
		    	producto6.setColorElegido("rosa");
		    	producto7.setColorElegido("azul");
		    	producto8.setColorElegido("verde");
		    	producto9.setColorElegido("rosa");
		    	producto10.setColorElegido("rosa");
		    	producto11.setColorElegido("azul");
		    	producto12.setColorElegido("negro");
		    	producto13.setColorElegido("negro");
		    	producto14.setColorElegido("rosa");
		    	
		    	talla.setNombre("38");
		    	talla2.setNombre("39");
		    	talla3.setNombre("40");
		    	talla4.setNombre("41");
		    	talla5.setNombre("42");
		    	daotall.nuevo(talla);
		    	daotall.nuevo(talla2);
		    	daotall.nuevo(talla3);
		    	daotall.nuevo(talla4);
		    	daotall.nuevo(talla5);
		    	producto.setTallaElegida("42");
		    	producto2.setTallaElegida("38");
		    	producto3.setTallaElegida("38");
		    	producto4.setTallaElegida("42");
		    	producto5.setTallaElegida("40");
		    	producto6.setTallaElegida("41");
		    	producto7.setTallaElegida("40");
		    	producto8.setTallaElegida("38");
		    	producto9.setTallaElegida("42");
		    	producto10.setTallaElegida("40");
		    	producto11.setTallaElegida("41");
		    	producto12.setTallaElegida("42");
		    	producto13.setTallaElegida("42");
		    	producto14.setTallaElegida("38");
		    	
		    	
		    	dao.nuevo(producto);
		    	dao.nuevo(producto2);
		    	dao.nuevo(producto3);
		    	dao.nuevo(producto4);
		    	dao.nuevo(producto5);
		    	dao.nuevo(producto6);
		    	dao.nuevo(producto7);
		    	dao.nuevo(producto8);
		    	dao.nuevo(producto9);
		    	dao.nuevo(producto10);
		    	dao.nuevo(producto11);
		    	dao.nuevo(producto12);
		    	dao.nuevo(producto13);
		    	dao.nuevo(producto14);
		    	dao.nuevo(producto15);
		    	dao.nuevo(producto16);
		    	dao.nuevo(producto17);
		    	dao.nuevo(producto18);
		    	dao.nuevo(producto19);
		    	dao.nuevo(producto20);
		    	
		    	
		    	
		    	
		    	producto.addColor(color);
		    	producto.addColor(color2);
		    	producto.addColor(color3);
		    	producto.addColor(color4);
		    	producto.addColor(color5);
		    	producto2.addColor(color);
		    	producto2.addColor(color2);
		    	producto2.addColor(color3);
		    	producto2.addColor(color4);
		    	producto2.addColor(color5);
		    	producto3.addColor(color);
		    	producto3.addColor(color2);
		    	producto3.addColor(color3);
		    	producto3.addColor(color4);
		    	producto3.addColor(color5);
		    	producto4.addColor(color);
		    	producto4.addColor(color2);
		    	producto4.addColor(color3);
		    	producto4.addColor(color4);
		    	producto4.addColor(color5);
		    	producto5.addColor(color);
		    	producto5.addColor(color2);
		    	producto5.addColor(color3);
		    	producto5.addColor(color4);
		    	producto5.addColor(color5);
		    	producto6.addColor(color);
		    	producto6.addColor(color2);
		    	producto6.addColor(color3);
		    	producto6.addColor(color4);
		    	producto6.addColor(color5);
		    	producto7.addColor(color);
		    	producto7.addColor(color2);
		    	producto7.addColor(color3);
		    	producto7.addColor(color4);
		    	producto7.addColor(color5);
		    	producto8.addColor(color);
		    	producto8.addColor(color2);
		    	producto8.addColor(color3);
		    	producto8.addColor(color4);
		    	producto8.addColor(color5);
		    	producto9.addColor(color);
		    	producto9.addColor(color2);
		    	producto9.addColor(color3);
		    	producto9.addColor(color4);
		    	producto9.addColor(color5);
		    	producto10.addColor(color);
		    	producto10.addColor(color2);
		    	producto10.addColor(color3);
		    	producto10.addColor(color4);
		    	producto10.addColor(color5);
		    	producto11.addColor(color);
		    	producto11.addColor(color2);
		    	producto11.addColor(color3);
		    	producto11.addColor(color4);
		    	producto11.addColor(color5);
		    	producto12.addColor(color);
		    	producto12.addColor(color2);
		    	producto12.addColor(color3);
		    	producto12.addColor(color4);
		    	producto12.addColor(color5);
		    	producto13.addColor(color);
		    	producto13.addColor(color2);
		    	producto13.addColor(color3);
		    	producto13.addColor(color4);
		    	producto13.addColor(color5);
		    	producto14.addColor(color);
		    	producto14.addColor(color2);
		    	producto14.addColor(color3);
		    	producto14.addColor(color4);
		    	producto14.addColor(color5);
		    	producto15.addColor(color);
		    	producto15.addColor(color2);
		    	producto15.addColor(color3);
		    	producto15.addColor(color4);
		    	producto15.addColor(color5);
		    	producto16.addColor(color);
		    	producto16.addColor(color2);
		    	producto16.addColor(color3);
		    	producto16.addColor(color4);
		    	producto16.addColor(color5);
		    	producto17.addColor(color);
		    	producto17.addColor(color2);
		    	producto17.addColor(color3);
		    	producto17.addColor(color4);
		    	producto17.addColor(color5);
		    	producto18.addColor(color);
		    	producto18.addColor(color2);
		    	producto18.addColor(color3);
		    	producto18.addColor(color4);
		    	producto18.addColor(color5);
		    	producto19.addColor(color);
		    	producto19.addColor(color2);
		    	producto19.addColor(color3);
		    	producto19.addColor(color4);
		    	producto19.addColor(color5);
		    	producto20.addColor(color);
		    	producto20.addColor(color2);
		    	producto20.addColor(color3);
		    	producto20.addColor(color4);
		    	producto20.addColor(color5);
		    	
		    Usuario u = new Usuario();
		    	u.setNombre("Administrador");
		    	u.setApellidos("Administrrador");
		    	u.setEmail("admin@tutienda.es");
		    	u.setPassword("admin");
		    	u.setTelefono("919999999");
		    	u.setTipoUsuario("Admin");
		    	
		    	Direccion d = new Direccion();
		    	d.setCogidoPostal("28053");
		    	d.setDireccion("c/ administracion 23");
		    	d.setPoblacion("Madrid");
		    	d.setProvincia("Madrid");
		   
		    	u.setDireccion(d);
		    	daousu.nuevo(u);
		    	Pedido p = new Pedido();
		    	p.setUsuario(u);
		    	daoped.nuevo(p);
		    	
		    	PedidoProducto pp = new PedidoProducto();
		    	pp.setProducto(producto);
		    	pp.setCantidad(1);
		    	pp.subtotal();
		    	
		    	PedidoProducto pp2 = new PedidoProducto();
		    	pp2.setProducto(producto14);
		    	pp2.setCantidad(1);
		    	pp2.subtotal();
		    	
		    	p.addPedidoProducto(pp);
		    	p.addPedidoProducto(pp2);
		    	DaoPedidosProductos dpp = new DaoPedidosProductos();
				dpp.nuevo(pp);
				dpp.nuevo(pp2);
	
    	//tallas iniciales
				
    	
    }    	
	
}
