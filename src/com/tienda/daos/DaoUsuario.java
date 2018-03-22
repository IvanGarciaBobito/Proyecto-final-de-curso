package com.tienda.daos;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;


import org.hibernate.*;
import org.hibernate.Session;
import com.tienda.entidades.Usuario;

public class DaoUsuario extends DaoMysql {
	
	public String ajaxMail (String param) {
		try {
		Session s = iniciarSession();
		String query = "From Usuario WHERE email = :param";
		TypedQuery<Usuario> tqu = s.createQuery(query);
		tqu.setParameter("param", param);
		Usuario u = tqu.getSingleResult();
		s.close();
		return u.getEmail();
		}catch (NoResultException nre) {
			System.out.println("no result ex " + param);
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Catch en ajaxmail");
			return null;
		}
	}

	public int nuevoUsuario(Usuario u) {
		Session s = iniciarSession();
		int flag = (int) s.save(u);
		tx.commit();
		s.close();
		return flag;
	}
	
	public Usuario logear (String email , String pass) {
		try {
		Session s = iniciarSession();
		String query = "FROM Usuario WHERE email = :email AND password = :password";
		TypedQuery<Usuario> tqu = s.createQuery(query);
		tqu.setParameter("email", email); tqu.setParameter("password", pass);
		if (tqu.getSingleResult() != null) {
		Usuario u = tqu.getSingleResult();
		System.out.println("Logeado como " + u.getNombre());
		s.close();
		return u ;
		}else {
		return null;
		}}catch (NoResultException nre) {
		System.out.println("No se encuentran usuarios para el login");
		return null;
		}
	}
	
	public boolean modificar (Usuario u) {
		try {
			Session s = iniciarSession();
			s.update(u);
			tx.commit();
			s.close();
			return true;
		}catch(Exception e) {
			System.out.println("Error al modificar Usuario");
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean borrarUsuario (Usuario u) {
		try {
		Session s = iniciarSession();
		s.delete(u);
		tx.commit();
		s.close();
		return true;
		}catch (HibernateException he) {
			System.out.println("Error al borrar");
			he.printStackTrace();
			return false;
		}
	}
	
	public boolean checkPass (String email , String pass) {
			
		try {
			Session s = iniciarSession();
			String query = "FROM Usuario WHERE email = :email AND password = :password";
			TypedQuery<Usuario> tqu = s.createQuery(query);
			tqu.setParameter("email", email); tqu.setParameter("password", pass);
			if (tqu.getSingleResult() != null) {
				return true;
			}else {
				return false;
			}
		
		}catch (HibernateException he) {
			System.out.println("Error al comprobar password");
			return false;
		}	catch(NoResultException nre) {
			System.out.println("Error al comprobar password");
			return false;
		}
	}
}
