package com.tienda.daos;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.tienda.entidades.Categoria;
import com.tienda.entidades.ColorDisponible;
import com.tienda.entidades.Producto;
import com.tienda.entidades.Usuario;


public class DaoCategoriaMysql extends DaoMysql { //hereda el metodo iniciarSesion() de la clase abstracta DaoMysql
	
	/**
	 * 
	 * @return lista con las categorias de la tabla categorias
	 */
	public List<Categoria> listar() {
		try (Session session = iniciarSession()) {
			@SuppressWarnings("unchecked")
			List<Categoria> listaCategorias = session.createQuery("from Categoria").getResultList();
			return listaCategorias;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	/**
	 * 
	 * @param categoria el objeto Categoria a insertar en la base de datos
	 * @return 0 si no se ha insertado u otro numero el id de la fila en la que se ha insertado 
	 */
	public int nuevo(Categoria categoria) {
		try (Session session = iniciarSession()){
			int i = (int)session.save(categoria);
			tx.commit();
			return i;
		}catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	/**
	 * 
	 * @param id  del objeto a eliminar de la base de datos
	 */
	public void Eliminar(int id) {
		try (Session session = iniciarSession()) {
			Categoria categoria = session.get(Categoria.class, id); //traemos el objeto por la id .
			session.delete(categoria);//eliminamos el objeto traido en la linea anterior
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
	
	public void actualizar(Categoria categoria) {
		try (Session session = iniciarSession()){
			session.update(categoria);
			tx.commit();
		}catch (HibernateException he) {
			tx.rollback();
			throw he;
		}		
		
	}
	
	public void actualizar(int id) {
		try (Session session = iniciarSession()){
			Categoria categoria = session.get(Categoria.class, id);
			session.update(categoria);
			tx.commit();
		}catch (HibernateException he) {
			tx.rollback();
			throw he;
		}		
		
	}
	
	public List<Producto> listaPorCategoria(String parametro){
		try (Session session = iniciarSession()) {
			String sQuery= "SELECT p.nombre, c.nombre, c.genero FROM Producto p, Categoria c WHERE c.nombre=:categoria";
			TypedQuery<Producto> tq = session.createQuery(sQuery);
			tq.setParameter("categoria", parametro);
			List<Producto> listaCategorias = tq.getResultList();
			return listaCategorias;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	public List<Producto> listarProdHombre(){
		try (Session session = iniciarSession()) {
			String sQuery= "SELECT c.listaProductos FROM Categoria c WHERE c.genero = 'Hombre' ";
			TypedQuery<Producto> tq = session.createQuery(sQuery);
			//tq.setParameter("categoria", parametro);
			List<Producto> listaCategorias = tq.getResultList();
			return listaCategorias;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	
	public List<Producto> listarProdMujer(){
		try (Session session = iniciarSession()) {
			String sQuery= "SELECT c.listaProductos FROM Categoria c WHERE c.genero = 'Mujer' ";
			TypedQuery<Producto> tq = session.createQuery(sQuery);
			//tq.setParameter("categoria", parametro);
			List<Producto> listaCategorias = tq.getResultList();
			return listaCategorias;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
}
