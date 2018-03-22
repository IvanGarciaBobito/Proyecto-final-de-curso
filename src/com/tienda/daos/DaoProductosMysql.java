package com.tienda.daos;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import com.tienda.entidades.Producto;


public class DaoProductosMysql extends DaoMysql {

	public int nuevo(Producto producto) {
		try (Session session = iniciarSession()){
			int i = (int)session.save(producto);
			tx.commit();
			return i;
		}catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	
	public List<Producto> listar() {
		try (Session session = iniciarSession()) {
			@SuppressWarnings("unchecked")
			List<Producto> listaProductos = session.createQuery("from Producto").getResultList();
			return listaProductos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	public void Eliminar(int id) {
		try (Session session = iniciarSession()) {
			Producto producto = session.get(Producto.class, id);
			session.delete(producto);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
}
