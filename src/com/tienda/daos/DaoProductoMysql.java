package com.tienda.daos;

import java.util.Collections;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import com.tienda.entidades.Producto;

public class DaoProductoMysql extends DaoMysql {

	public long nuevo(Producto producto) {
		try (Session session = iniciarSession()) {
			long i = (long) session.save(producto);
			tx.commit();
			return i;
		} catch (HibernateException he) {
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

	public void actualizar(Producto producto) {
		try (Session session = iniciarSession()) {
			session.update(producto);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}

	public void eliminar(Producto producto) {
		try (Session session = iniciarSession()) {
			session.delete(producto);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}

	public Producto get(long id) {
		try (Session session = iniciarSession()) {

			Producto producto = session.get(Producto.class, id);

			return producto;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}

	@SuppressWarnings("unchecked")
	public List<Producto> listaPorNombreTodosAsc() {
		try (Session session = iniciarSession()) {
			String sQuery = " FROM Producto  ORDER BY nombre ASC";
			List<Producto> listaProductos = session.createQuery(sQuery).getResultList();
			return listaProductos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Producto> listaPorNombreTodosDesc() {
		try (Session session = iniciarSession()) {
			String sQuery = " FROM Producto ORDER BY nombre DESC";
			List<Producto> listaProductos = session.createQuery(sQuery).getResultList();
			return listaProductos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Producto> listaPorPrecioTodosAsc() {
		try (Session session = iniciarSession()) {
			String sQuery = "FROM Producto  ORDER BY precio ASC";
			List<Producto> listaProductos = session.createQuery(sQuery).getResultList();
			return listaProductos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Producto> listaPorPrecioTodosDesc() {
		try (Session session = iniciarSession()) {
			String sQuery = "FROM Producto  ORDER BY precio DESC";
			List<Producto> listaProductos = session.createQuery(sQuery).getResultList();
			return listaProductos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Producto> listaPorNombreHQL(String nombre) {
		try (Session session = iniciarSession()) {
			String temp = "%"+nombre+"%";
			String sQuery = " FROM Producto p WHERE p.nombre LIKE :temp ORDER BY p.nombre";
			TypedQuery<Producto> tq = session.createQuery(sQuery);
			tq.setParameter("temp", temp);
			List<Producto> listaProductos = tq.getResultList();
			return listaProductos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	

	
	@SuppressWarnings("unchecked")
	public List<Producto> listaPorPreciosAsc(double precioInicial, double precioFinal) {
		try (Session session = iniciarSession()) {
			String sQuery = "FROM Producto p WHERE p.precio BETWEEN :precioInicial AND :precioFinal ORDER BY p.precio asc";
			TypedQuery<Producto> tq = session.createQuery(sQuery);
			tq.setParameter("precioInicial", precioInicial);
			tq.setParameter("precioFinal", precioFinal);
			List<Producto> listaProductos = tq.getResultList();
			return listaProductos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	
	public List<Producto> listaPorCategorias(String id) {
		try  {
			int ide = Integer.parseInt(id);
			Session session = iniciarSession();
			String sQuery = "Select c.listaProductos FROM Categoria c WHERE c.id = :id  ";
			TypedQuery<Producto> tq = session.createQuery(sQuery);
			tq.setParameter("id", ide);
			List<Producto> listaProductos = tq.getResultList();
			session.close();
			return listaProductos;
		}catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	
}
