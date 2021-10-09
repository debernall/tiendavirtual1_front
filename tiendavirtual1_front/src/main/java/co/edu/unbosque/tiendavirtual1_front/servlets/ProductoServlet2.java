package co.edu.unbosque.tiendavirtual1_front.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;

import co.edu.unbosque.tiendavirtual1_front.model.Productos;

/**
 * Servlet implementation class ProductoServlet2
 */
@WebServlet("/ProductoServlet2")
public class ProductoServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductoServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Bean
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String consultar = request.getParameter("Consultar");
		if(consultar != null) {
			consultar(request,response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void consultar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("status_form", "productos");
		long codigo = 0;
		try {
			codigo = Long.parseLong(request.getParameter("codigo"));
			Productos respuesta = new Productos() ;
			try{
				respuesta = (Productos) TestJSONproductos.getJSON1(codigo);
				long id = respuesta.getCodigo_producto();
				if (id != 0) {
					request.setAttribute("estado", "true");
					request.setAttribute("status_consultar", "true");
					request.setAttribute("codigo", id);
					request.setAttribute("nombre_producto", respuesta.getNombre_producto());
					request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
			catch (Exception e) {
				request.setAttribute("estado", "true");
				request.setAttribute("status_consultar", "empty");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}catch(Exception e) {
			codigo = 0;
			request.setAttribute("estado", "true");
			request.setAttribute("status_consultar", "empty_id");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}

}
