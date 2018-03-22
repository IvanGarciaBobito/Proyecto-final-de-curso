package com.tienda.entidades;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name= "usuarios")
public class Usuario {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int idUsuario;
	
	private String nombre;
	private String apellidos;
	private String email;
	private String password;
	private String telefono;
	@Column(name= "fecha_registro",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date fecha;
	

	@OneToOne(cascade= CascadeType.ALL)
	private Direccion direccion;

	@OneToMany(cascade= CascadeType.ALL, fetch= FetchType.EAGER, mappedBy= "usuario")
	private List<Pedido> listaPedidos;
	
	private String tipoUsuario;
	
	public Usuario() {
		tipoUsuario = "Usuario";
	}

	
	public String getTipoUsuario() {
		return tipoUsuario;
	}


	public void setTipoUsuario(String string) {
		this.tipoUsuario = string;
	}


	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public void addPedido (Pedido pedido) {
		this.listaPedidos.add(pedido);
		pedido.setUsuario(this);
	}
	
	public List<Pedido> getListaPedidos() {
		return listaPedidos;
	}

	public void setListaPedidos(List<Pedido> listaPedidos) {
		this.listaPedidos = listaPedidos;
	}

	public Usuario(String nombre, String apellidos, String email, String password,
			String telefono, Direccion direccion) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.password = password;
		this.telefono= telefono;
		this.direccion = direccion;
	}

	public int getId() {
		return idUsuario;
	}

	public void setId(int id) {
		this.idUsuario = id;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
		this.direccion.setUsuario(this);
	}
	


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}
}
