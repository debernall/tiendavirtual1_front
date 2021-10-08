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

import co.edu.unbosque.tiendavirtual1_front.model.Clientes;


public class TestJSONclientes {
	
	private static URL url;
	private static String sitio = "http://localhost:5000/";
	
	public static ArrayList<Clientes> getJSON() throws IOException, ParseException{
		url = new URL(sitio+"clientes/listar");
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
		ArrayList<Clientes> lista = new ArrayList<Clientes>();
		lista = parsingClientes(json);
		http.disconnect();
		return lista;
	}
	
	public static ArrayList<Clientes> parsingClientes(String json) throws ParseException{
		JSONParser jsonParser = new JSONParser();
		ArrayList<Clientes> lista = new ArrayList<Clientes>();
		JSONArray clientes = (JSONArray) jsonParser.parse(json);
		Iterator i = clientes.iterator();
		while(i.hasNext()) {
			JSONObject innerObj = (JSONObject) i.next();
			Clientes cliente= new Clientes();
			cliente.setCedula_cliente((long) innerObj.get("cedula_cliente"));
			cliente.setEmail_cliente(innerObj.get("email_cliente").toString());
			cliente.setNombre_cliente(innerObj.get("nombre_cliente").toString());
			cliente.setDireccion_cliente(innerObj.get("direccion_cliente").toString());
			cliente.setTelefono_cliente((long)innerObj.get("telefono_cliente"));
			lista.add(cliente);
		}
		
		return lista;
		
	}
	
	public static int postJSON(Clientes cliente) throws IOException{
		url = new URL(sitio+"clientes/guardar");
		
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
				+"\"cedula_cliente\":"+ cliente.getCedula_cliente()
				+", \"email_cliente\":\""+ cliente.getEmail_cliente()
				+"\", \"nombre_cliente\":\""+ cliente.getNombre_cliente()
				+"\", \"direccion_cliente\":\""+ cliente.getDireccion_cliente()
				+"\", \"telefono_cliente\":\""+ cliente.getTelefono_cliente()
				+"\"}";
		System.out.println(data);
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		int respuesta = http.getResponseCode();
		http.disconnect();
		return respuesta;
		
	}
	
	public static Clientes getJSON1(long cedula) throws IOException, ParseException {
		url = new URL(sitio+"clientes/consultar");
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
		Clientes cliprueba = new Clientes();
		cliprueba.setCedula_cliente(cedula);
		String data = "{"
				+"\"cedula_cliente\":"+ cliprueba.getCedula_cliente()
				+", \"email_cliente\":\""+ cliprueba.getEmail_cliente()
				+"\", \"nombre_cliente\":\""+ cliprueba.getNombre_cliente()
				+"\", \"direccion_cliente\":\""+ cliprueba.getDireccion_cliente()
				+"\", \"telefono_cliente\":\""+ cliprueba.getTelefono_cliente()
				+"\"}";
		System.out.println(data);
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		Clientes cliente = new Clientes();
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
			cliente.setCedula_cliente((long) respuesta2.get("cedula_cliente"));
			cliente.setEmail_cliente((String) respuesta2.get("email_cliente"));
			cliente.setNombre_cliente((String) respuesta2.get("nombre_cliente"));
			cliente.setDireccion_cliente((String) respuesta2.get("direccion_cliente"));
			cliente.setTelefono_cliente((long) respuesta2.get("telefono_cliente"));
			
		}
		http.disconnect();
		System.out.println(cliente.toString());
		return cliente;
	}
	
	public static int getJSON2(long cedula) throws IOException, ParseException {
		url = new URL(sitio+"clientes/eliminar");
		HttpURLConnection http;
		http = (HttpURLConnection)url.openConnection();	
		try {
			http.setRequestMethod("DELETE");
		} catch(ProtocolException e) {
			e.printStackTrace();
		}
		http.setDoOutput(true);
		http.setRequestProperty("Accept", "application/json");
		http.setRequestProperty("Content-Type", "application/json");
		Clientes cliprueba = new Clientes();
		cliprueba.setCedula_cliente(cedula);
		String data = "{"
				+"\"cedula_cliente\":"+ cliprueba.getCedula_cliente()
				+", \"email_cliente\":\""+ cliprueba.getEmail_cliente()
				+"\", \"nombre_cliente\":\""+ cliprueba.getNombre_cliente()
				+"\", \"direccion_cliente\":\""+ cliprueba.getDireccion_cliente()
				+"\", \"telefono_cliente\":\""+ cliprueba.getTelefono_cliente()
				+"\"}";
		System.out.println(data);
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		int respuesta = http.getResponseCode();
		System.out.println(respuesta);
		http.disconnect();
		return respuesta;
	}
}
