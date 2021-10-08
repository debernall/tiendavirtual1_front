package co.edu.unbosque.tiendavirtual1_front.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;

import co.edu.unbosque.tiendavirtual1_front.model.Proveedores;


/**
 * Servlet implementation class FornProveedores
 */
@WebServlet("/FornProveedores")
public class FornProveedores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FornProveedores() {
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
		Long NIT = Long.parseLong(request.getParameter("NIT"));
		PrintWriter writer = response.getWriter();
		try {
			Proveedores proveedor2 = TestJSONproveedores.getJSON1(NIT);
			writer.println("\nEl proveedor consultado es: "+proveedor2.toString());
		}catch (Exception e) {
			writer.println("\nNo se ha podido consultar el proveedor con NIT "+NIT);
			writer.println("\nError "+e);
		}finally {
			writer.close();
		}
	}
}
