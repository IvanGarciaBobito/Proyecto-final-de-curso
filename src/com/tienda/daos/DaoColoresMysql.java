package com.tienda.daos;



import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.tienda.entidades.ColorDisponible;


public class DaoColoresMysql extends DaoMysql{

	/**
	 * 
	 * @param color el objeto color a insertar en la base de datos
	 * @return 0 si no se ha insertado u otro numero el id de la fila en la que se ha insertado
	 */
	public int nuevo(ColorDisponible color) {
		try (Session session = iniciarSession()) {
			int i = (int) session.save(color);
			tx.commit();
			return i;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	/**
	 * 
	 * @return lista con los colores disponibes de la tabla colores disponibles
	 */
	public List<ColorDisponible> listar() {
		try (Session session = iniciarSession()) {
			@SuppressWarnings("unchecked")
			List<ColorDisponible> listaColores = session.createQuery("from ColorDisponible").getResultList();
			return listaColores;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	/**
	 * 
	 * @param id del objeto a eliminar de la base de datos
	 */
	public void Eliminar(int id) {
		try (Session session = iniciarSession()) {
			ColorDisponible color = session.get(ColorDisponible.class, id);
			session.delete(color);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
	
	/**
	 * 
	 * @param color objeto color a modificar en la base de datos
	 * @return true si se ha modificado o false si no se ha podido modificar
	 */
	public boolean modificar(ColorDisponible color) {
		try (Session session = iniciarSession()) {
			session.update(color);
			tx.commit();
			return true;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
}
