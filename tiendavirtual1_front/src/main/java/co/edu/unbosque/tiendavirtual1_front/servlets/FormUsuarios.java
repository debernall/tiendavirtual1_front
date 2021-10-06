package co.edu.unbosque.tiendavirtual1_front.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;
import org.springframework.context.annotation.Bean;

import co.edu.unbosque.tiendavirtual1_front.model.Usuarios;

/**
 * UsuarioServlet implementation class UsuarioServlet
 */
@WebServlet("/FormUsuarios")
public class FormUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Bean
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String consultar = request.getParameter("Consultar");
		//String crear = request.getParameter("Crear");
		//String actualizar = request.getParameter("Actualizar");
		//String borrar = request.getParameter("Borrar");
		if(consultar != null) {
			consultar(request, response);
		}/*
		if(crear != null) {
			crear(request, response);
		}
		if(actualizar != null) {
			actualizar(request,response);
		}
		if(borrar != null) {
			borrar(request,response);
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void consultar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long cedula = Long.parseLong(request.getParameter("cedula"));
		PrintWriter writer = response.getWriter();
		try {
			Usuarios usuario2 = UsuarioTestJSON.getJSON1(cedula);
			writer.println("\nEl usuario consultado es: "+usuario2.toString());
		}catch (Exception e) {
			writer.println("\nNo se ha podido consultar el usuario con cedula "+cedula);
			writer.println("\nError "+e);
		}finally {
			writer.close();
		}
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuarios usuarios = new Usuarios();
		usuarios.setUsuario(request.getParameter("usuario"));
		usuarios.setPassword(request.getParameter("password"));
		//PrintWriter writer = response.getWriter();
		//String pagina = "/inicio2.jsp";
		if(usuarios.getUsuario().equals("admininicial") && usuarios.getPassword().equals("admin123456")) {
			//writer.println("Ha ingresado!"+usuarios.getUsuario()+usuarios.getPassword());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
			//dispatcher.forward(request, response);
		}else {
			try {
				int respuesta = UsuarioTestJSON.postJSON1(usuarios);
				/*if (respuesta == 200) {
					System.out.println("\nHa ingresado exitosamente!");
				}
				else {
					System.out.println("\nUsuario y contraseña incorrectos");
				}*/
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		}
}
