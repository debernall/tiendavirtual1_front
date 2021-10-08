package co.edu.unbosque.tiendavirtual1_front.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;

import co.edu.unbosque.tiendavirtual1_front.model.Clientes;


/**
 * Servlet implementation class FormCliente
 */
@WebServlet("/FormCliente")
public class FormClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormClientes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Bean
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String consultar = request.getParameter("Consultar");
    	if(consultar != null) {
			consultar(request, response);
		}
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
			Clientes cliente2 = TestJSONclientes.getJSON1(cedula);
			writer.println("\nEl cliente consultado es: "+cliente2.toString());
		}catch (Exception e) {
			writer.println("\nNo se ha podido consultar el cliente con cedula "+cedula);
			writer.println("\nError "+e);
		}finally {
			writer.close();
		}
	}
}
