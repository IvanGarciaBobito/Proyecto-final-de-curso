package com.tienda.daos;



import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tienda.utilidades.Hibernate5Utils;


public abstract class DaoMysql {
protected Transaction tx;
	
	public Session iniciarSession() {
		Session session = Hibernate5Utils.getSessionFactory().openSession();

		tx = session.beginTransaction();
		return session;
	}
	
	
}
