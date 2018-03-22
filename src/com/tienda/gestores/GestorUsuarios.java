package com.tienda.gestores;

import java.util.ArrayList;
import com.tienda.daos.DaoUsuarioMysql;
import com.tienda.entidades.Direccion;
import com.tienda.entidades.Usuario;

public class GestorUsuarios {
	DaoUsuarioMysql dao;
	
	/**
	 * 
	 * @param datosUsuario El arrayList con los datos del usuario nuevo
	 * @param datosDireccion El arrayList con los datos de la direccion del nuevo usuario
	 * @return 0 si no se ha dado de alta, otro numero el id del registro
	 */
	public int nuevoUsuario(ArrayList<String> datosUsuario,ArrayList<String> datosDireccion) {
		dao = new DaoUsuarioMysql();

		Usuario user = new Usuario();
		Direccion dir = new Direccion();
	
		user.setTelefono(datosUsuario.get(0));
		user.setEmail(datosUsuario.get(1));
		user.setPassword(datosUsuario.get(2));
		user.setNombre(datosUsuario.get(3));
		user.setApellidos(datosUsuario.get(4));
		
		dir.setDireccion(datosDireccion.get(0));
		dir.setPoblacion(datosDireccion.get(1));
		dir.setProvincia(datosDireccion.get(2));
		dir.setCogidoPostal(datosDireccion.get(3));
		
		user.setDireccion(dir);
		return dao.nuevo(user);
	}

	
}
