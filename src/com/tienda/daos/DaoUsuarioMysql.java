package com.tienda.daos;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.tienda.entidades.ColorDisponible;
import com.tienda.entidades.Usuario;

public class DaoUsuarioMysql extends DaoMysql {

	/**
	 * 
	 * @param usuario Objeto Usuario a insertar en la base de datos como nuevo usuario
	 * @return 
	 */
	public int nuevo(Usuario usuario) {
		try (Session session = iniciarSession()) {
			int i = (int) session.save(usuario);
			tx.commit();
			return i;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}

	public List<Usuario> listar() {
		try (Session session = iniciarSession()) {
			@SuppressWarnings("unchecked")
			List<Usuario> listaUsuarios = session.createQuery("from Usuario").getResultList();
			return listaUsuarios;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}

	public boolean modificar(Usuario usuario) {
		try (Session session = iniciarSession()) {
			session.update(usuario);
			tx.commit();
			return true;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}

	public boolean eliminar(Usuario usuario) {
		try (Session session = iniciarSession()) {
			session.delete(usuario);
			tx.commit();
			return true;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
	}

	public Usuario get(int id) {
		try (Session session = iniciarSession()) {
			Usuario usuario = session.get(Usuario.class, id);
			return usuario;
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}

	public Usuario logear(String email, String pass) {
		try (Session session = iniciarSession()) {
			String query = "FROM Usuario WHERE email = :email AND password = :password";
			@SuppressWarnings("unchecked")
			TypedQuery<Usuario> tqu = session.createQuery(query);
			tqu.setParameter("email", email);
			tqu.setParameter("password", pass);
			if (tqu.getSingleResult() != null) {
				Usuario usuario = tqu.getSingleResult();
				return usuario;
			}
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}
		return null;
	}
	
	public boolean checkPass (String email , String pass) {
		
		try (Session session = iniciarSession()){
			
			String query = "FROM Usuario WHERE email = :email AND password = :password";
			@SuppressWarnings("unchecked")
			TypedQuery<Usuario> tqu = session.createQuery(query);
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
	
	public void Eliminar(int id) {
		try (Session session = iniciarSession()) {
			Usuario usuario = session.get(Usuario.class, id);
			session.delete(usuario);
			tx.commit();
		} catch (HibernateException he) {
			tx.rollback();
			throw he;
		}

	}
	
	
	
}
