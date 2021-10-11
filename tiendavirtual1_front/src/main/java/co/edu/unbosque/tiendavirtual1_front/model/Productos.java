package co.edu.unbosque.tiendavirtual1_front.model;

import javax.persistence.Column;
import javax.persistence.Id;

public class Productos {
	
	private long codigo_producto;
	private String nombre_producto;
	private long nitproveedor;
	private long precio_compra;
	private long iva_compra;
	private long precio_venta;
	
	public Productos() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Productos(long codigo_producto, String nombre_producto, long nitproveedor, long precio_compra,
			long iva_compra, long precio_venta) {
		super();
		this.codigo_producto = codigo_producto;
		this.nombre_producto = nombre_producto;
		this.nitproveedor = nitproveedor;
		this.precio_compra = precio_compra;
		this.iva_compra = iva_compra;
		this.precio_venta = precio_venta;
	}

	public long getCodigo_producto() {
		return codigo_producto;
	}

	public void setCodigo_producto(long codigo_producto) {
		this.codigo_producto = codigo_producto;
	}

	public String getNombre_producto() {
		return nombre_producto;
	}

	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}

	public long getNitproveedor() {
		return nitproveedor;
	}

	public void setNitproveedor(long nitproveedor) {
		this.nitproveedor = nitproveedor;
	}

	public long getPrecio_compra() {
		return precio_compra;
	}

	public void setPrecio_compra(long precio_compra) {
		this.precio_compra = precio_compra;
	}

	public long getIva_compra() {
		return iva_compra;
	}

	public void setIva_compra(long iva_compra) {
		this.iva_compra = iva_compra;
	}

	public long getPrecio_venta() {
		return precio_venta;
	}

	public void setPrecio_venta(long precio_venta) {
		this.precio_venta = precio_venta;
	}
	
	
	

}