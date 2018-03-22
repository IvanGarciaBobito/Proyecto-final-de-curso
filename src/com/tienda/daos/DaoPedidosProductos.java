package com.tienda.daos;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.tienda.entidades.Pedido;
import com.tienda.entidades.PedidoProducto;

public class DaoPedidosProductos extends DaoMysql{
	
	
	public int nuevo(PedidoProducto	 pp) {
		try (Session session = iniciarSession()) {
			int i = (int) session.save(pp);
			tx.commit();
			return i;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	public List<PedidoProducto> listar() {
		try (Session session = iniciarSession()) {
			@SuppressWarnings("unchecked")
			List<PedidoProducto> listaPP = session.createQuery("from PedidoProducto").getResultList();
			return listaPP;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	public void Eliminar(int id) {
		try (Session session = iniciarSession()) {
			PedidoProducto pp = session.get(PedidoProducto.class, id);
			session.delete(pp);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
	

}
