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
 * Ingresar implementation class Ingresar
 */
@WebServlet("/Ingresar")
public class Ingresar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ingresar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Bean
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String ingresar = request.getParameter("Ingresar");
		if(ingresar != null) {
			login(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuarios usuarios = new Usuarios();
		usuarios.setUsuario(request.getParameter("usuario"));
		usuarios.setPassword(request.getParameter("password"));
		ArrayList<String> arrayuser = new ArrayList<String>();
		PrintWriter writer = response.getWriter();
		//String pagina = "/inicio2.jsp";
		if(usuarios.getUsuario().equals("admininicial") && usuarios.getPassword().equals("admin123456")) {
			writer.println("Ha ingresado!"+usuarios.getUsuario()+usuarios.getPassword());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
			//dispatcher.forward(request, response);
		}else {
			try {
				int respuesta = TestJSONusuarios.postJSON1(usuarios);
				if (respuesta == 200) {
					writer.println("\nHa ingresado exitosamente!");
				}
				else {
					writer.println("\nUsuario y contraseña incorrectos");
				}
				writer.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		}
}
