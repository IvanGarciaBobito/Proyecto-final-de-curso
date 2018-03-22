package com.tienda.daos;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.tienda.entidades.TallaDisponible;
import com.tienda.entidades.Usuario;

public class DaoTallasMysql extends DaoMysql {

	public int nuevo(TallaDisponible talla) {
		try (Session session = iniciarSession()) {
			int i = (int) session.save(talla);
			tx.commit();
			return i;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}

	public List<TallaDisponible> listar() {
		try (Session session = iniciarSession()) {
			@SuppressWarnings("unchecked")
			List<TallaDisponible> listaTallas = session.createQuery("from TallaDisponible").getResultList();
			return listaTallas;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}
	
	public void Eliminar(int id) {
		try (Session session = iniciarSession()) {
			TallaDisponible talla = session.get(TallaDisponible.class, id);
			session.delete(talla);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
}
