package com.tienda.daos;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.tienda.entidades.Pedido;
import com.tienda.entidades.Usuario;



public class DaoPedidosMysql extends DaoMysql {

	public int nuevo(Pedido pedido) {
		try (Session session = iniciarSession()) {
			int i = (int) session.save(pedido);
			tx.commit();
			return i;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	public List<Pedido> listar() {
		try (Session session = iniciarSession()) {
			@SuppressWarnings("unchecked")
			List<Pedido> listaPedidos = session.createQuery("from Pedido").getResultList();
			return listaPedidos;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	public void Eliminar(int id) {
		try (Session session = iniciarSession()) {
			Pedido pedido = session.get(Pedido.class, id);
			session.delete(pedido);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
	
	public Pedido  get(int id) {
		try (Session session = iniciarSession()) {
			 Pedido pedido = session.get(Pedido.class, id);
			 return pedido;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
	
	
}
