package co.edu.unbosque.tiendavirtual1_front.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import co.edu.unbosque.tiendavirtual1_front.model.Productos;


public class TestJSONproductos {
	
	private static URL url;
	private static String sitio = "http://localhost:5000/";
	
	public static ArrayList<Productos> getJSON() throws IOException, ParseException{
		url = new URL(sitio+"productos/listar");
		HttpURLConnection http = (HttpURLConnection)url.openConnection();
		http.setRequestMethod("GET");
		http.setRequestProperty("Accept", "application/json");
		System.out.println("antes del get input stream");
		InputStream respuesta = http.getInputStream();
		System.out.println("despues del get input stream");
		byte[] inp = respuesta.readAllBytes();
		String json = "";
		for (int i = 0; i<inp.length ; i++) {
			json += (char)inp[i];
		}
		ArrayList<Productos> lista = new ArrayList<Productos>();
		lista = parsingProductos(json);
		http.disconnect();
		return lista;
	}
	
	public static ArrayList<Productos> parsingProductos(String json) throws ParseException{
		JSONParser jsonParser = new JSONParser();
		ArrayList<Productos> lista = new ArrayList<Productos>();
		JSONArray productos = (JSONArray) jsonParser.parse(json);
		Iterator i = productos.iterator();
		while(i.hasNext()) {
			JSONObject innerObj = (JSONObject) i.next();
			Productos producto= new Productos();
			producto.setCodigo_producto((long) innerObj.get("codigo_producto"));
			producto.setNombre_producto(innerObj.get("nombre_producto").toString());
			producto.setNitproveedor((long)innerObj.get("NITproveedor"));
			producto.setPrecio_compra((long)innerObj.get("precio_compra"));
			producto.setIva_compra((long)innerObj.get("iva_compra"));
			producto.setPrecio_venta((long)innerObj.get("precio_venta"));
			lista.add(producto);
		}
		
		return lista;
		
	}
	
	public static int postJSON(Productos producto) throws IOException{
		url = new URL(sitio+"productos/guardar");
		
		HttpURLConnection http;
		http = (HttpURLConnection)url.openConnection();
		try {
			http.setRequestMethod("POST");
		} catch(ProtocolException e) {
			e.printStackTrace();
		}
		http.setDoOutput(true);
		http.setRequestProperty("Accept", "application/json");
		http.setRequestProperty("Content-Type", "application/json");
		String data = "{"
				+"\"codigo_producto\": "+ producto.getCodigo_producto()
				+", \"nombre_producto\": \""+ producto.getNombre_producto()
				+"\", \"nitproveedor\": "+ producto.getNitproveedor()
				+", \"precio_compra\": "+ producto.getPrecio_compra()
				+", \"iva_compra\": "+ producto.getIva_compra()
				+", \"precio_venta\": "+ producto.getPrecio_venta()
				+"}";
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		int respuesta = http.getResponseCode();
		http.disconnect();
		return respuesta;
		
	}
	
	public static Productos getJSON1(long codigo) throws IOException, ParseException {
		url = new URL(sitio+"productos/consultar");
		HttpURLConnection http;
		http = (HttpURLConnection)url.openConnection();
		try {
			http.setRequestMethod("POST");
		} catch(ProtocolException e) {
			e.printStackTrace();
		}
		http.setDoOutput(true);
		http.setRequestProperty("Accept", "application/json");
		http.setRequestProperty("Content-Type", "application/json");
		Productos proprueba = new Productos();
		proprueba.setCodigo_producto(codigo);
		String data = "{"
				+"\"codigo_producto\":"+ proprueba.getCodigo_producto()
				+"\" , \"nombre_producto\":\""+ proprueba.getNombre_producto()
				+"\"}";
		System.out.println(data);
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		Productos producto = new Productos();
		try(BufferedReader br = new BufferedReader(new InputStreamReader(http.getInputStream(), "utf-8"))) {
			StringBuilder response = new StringBuilder();
			String responseLine = null;
			while ((responseLine = br.readLine()) != null) {
				response.append(responseLine.trim());
			}
			String respuestatxt = response.toString();
			System.out.println(respuestatxt);
			JSONParser jsonParser = new JSONParser();
			JSONObject respuesta2 = (JSONObject) jsonParser.parse(respuestatxt);
			producto.setCodigo_producto((long) respuesta2.get("codigo_producto"));
			producto.setNombre_producto((String) respuesta2.get("nombre_producto"));
		}
		http.disconnect();
		System.out.println(producto.toString());
		return producto;
	}
	
	
	
}
