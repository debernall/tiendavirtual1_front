package co.edu.unbosque.tiendavirtual1_front.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import co.edu.unbosque.tiendavirtual1_front.model.Usuarios;


public class TestJSONusuarios {
	
	private static URL url;
	private static String sitio = "http://localhost:5000/";
	
	public static ArrayList<Usuarios> getJSON() throws IOException, ParseException{
		url = new URL(sitio+"usuarios/listar");
		HttpURLConnection http = (HttpURLConnection) url.openConnection();
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
		ArrayList<Usuarios> lista = new ArrayList<Usuarios>();
		lista = parsingUsuarios(json);
		http.disconnect();
		return lista;
	}
	
	public static ArrayList<Usuarios> parsingUsuarios(String json) throws ParseException{
		JSONParser jsonParser = new JSONParser();
		ArrayList<Usuarios> lista = new ArrayList<Usuarios>();
		JSONArray usuarios = (JSONArray) jsonParser.parse(json);
		Iterator i = usuarios.iterator();
		while(i.hasNext()) {
			JSONObject innerObj = (JSONObject) i.next();
			Usuarios usuario= new Usuarios();
			usuario.setCedula_usuario((long) innerObj.get("cedula_usuario"));
			usuario.setNombre_usuario(innerObj.get("nombre_usuario").toString());
			usuario.setEmail_usuario(innerObj.get("email_usuario").toString());
			usuario.setUsuario(innerObj.get("usuario").toString());
			usuario.setPassword(innerObj.get("password").toString());
			lista.add(usuario);
		}
		
		return lista;
		
	}
	
	public static int postJSON(Usuarios usuario) throws IOException{
		url = new URL(sitio+"usuarios/guardar");
		
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
				+"\"cedula_usuario\":"+ usuario.getCedula_usuario()
				+", \"nombre_usuario\":\""+ usuario.getNombre_usuario()
				+"\", \"email_usuario\":\""+ usuario.getEmail_usuario()
				+"\", \"usuario\":\""+ usuario.getUsuario()
				+"\", \"password\":\""+ usuario.getPassword()
				+"\"}";
		System.out.println(data);
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		int respuesta = http.getResponseCode();
		http.disconnect();
		return respuesta;
		
	}
	/*
	public static int postJSON1(Usuarios usuario) throws IOException{
		url = new URL(sitio+"usuarios/login?");
		
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
				+"\"cedula_usuario\":"+ usuario.getCedula_usuario()
				+", \"nombre_usuario\":\""+ usuario.getNombre_usuario()
				+"\" , \"email_usuario\":\""+ usuario.getEmail_usuario()
				+"\" , \"usuario\":\""+ usuario.getUsuario()
				+"\" , \"password\":\""+ usuario.getPassword()
				+"\"}";
		System.out.println(data);
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		int respuesta = http.getResponseCode();
		http.disconnect();
		return respuesta;
		
	}
*/
	public static int postJSON1(Usuarios usuarios) throws IOException {
		url = new URL(sitio+"usuarios/login");
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
				+"\"cedula_usuario\":"+ usuarios.getCedula_usuario()
				+", \"nombre_usuario\":\""+ usuarios.getNombre_usuario()
				+"\" , \"email_usuario\":\""+ usuarios.getEmail_usuario()
				+"\" , \"usuario\":\""+ usuarios.getUsuario()
				+"\" , \"password\":\""+ usuarios.getPassword()
				+"\"}";
		System.out.println(data);
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);
		int respuesta = http.getResponseCode();
		http.disconnect();
		return respuesta;
	}


}
