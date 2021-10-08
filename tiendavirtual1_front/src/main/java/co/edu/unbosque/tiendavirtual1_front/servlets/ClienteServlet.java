package co.edu.unbosque.tiendavirtual1_front.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;

import co.edu.unbosque.tiendavirtual1_front.model.Clientes;


@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Bean
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String crear = request.getParameter("Crear");
		String consultar = request.getParameter("Consultar");
		String actualizar = request.getParameter("Actualizar");
		String borrar = request.getParameter("Borrar");
		if(crear != null) {
			crear(request,response);
		}
		if(consultar != null) {
			consultar(request,response);
		}
		if(actualizar != null) {
			actualizar(request,response);
		}
		if(borrar != null) {
			borrar(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("status_form", "clientes");
		if (request.getParameter("cedula") == "" || 
			request.getParameter("nombre") == "" ||
			request.getParameter("email") == "" ||
			request.getParameter("direccion") == "" ||
			request.getParameter("telefono") == "") {
			request.setAttribute("status_crear", "empty");
			request.setAttribute("estado", "true");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			Clientes clientes = new Clientes();
			clientes.setCedula_cliente(Long.parseLong(request.getParameter("cedula")));
			clientes.setNombre_cliente(request.getParameter("nombre"));
			clientes.setEmail_cliente(request.getParameter("email"));
			clientes.setDireccion_cliente(request.getParameter("direccion"));
			clientes.setTelefono_cliente(Long.parseLong(request.getParameter("telefono")));
			try {
				int respuesta = TestJSONclientes.postJSON(clientes);
				if (respuesta==200) {
						request.setAttribute("estado", "true");
						request.setAttribute("status_crear", "true");
						request.getRequestDispatcher("index.jsp").forward(request, response);
				}else {
						request.setAttribute("estado", "true");
						request.setAttribute("status_crear", "false");
						request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void consultar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("status_form", "clientes");
		long cedula = 0;
		try {
			cedula =  Long.parseLong(request.getParameter("cedula"));
			Clientes respuesta = new Clientes();
			try {
				respuesta = (Clientes) TestJSONclientes.getJSON1(cedula);
				long id = respuesta.getCedula_cliente();
				if (id != 0) {
					request.setAttribute("estado", "true");
					request.setAttribute("status_consultar", "true");
					request.setAttribute("cedula", id);
					request.setAttribute("nombre", respuesta.getNombre_cliente());
					request.setAttribute("email", respuesta.getEmail_cliente());
					request.setAttribute("usuario", respuesta.getDireccion_cliente());
					request.setAttribute("password", respuesta.getTelefono_cliente());
					request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
			catch (Exception e) {
				request.setAttribute("estado", "true");
				request.setAttribute("status_consultar", "empty");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}catch(Exception e) {
			cedula = 0;
			request.setAttribute("estado", "true");
			request.setAttribute("status_consultar", "empty_id");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}	
	}
	
	public void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("status_form", "clientes");
		if (request.getParameter("cedula") == "" || 
				request.getParameter("nombre") == "" ||
				request.getParameter("email") == "" ||
				request.getParameter("direccion") == "" ||
				request.getParameter("telefono") == "") {
				request.setAttribute("status_actualizar", "empty");
				request.setAttribute("estado", "true");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				Clientes clientes = new Clientes();
				clientes.setCedula_cliente(Long.parseLong(request.getParameter("cedula")));
				clientes.setNombre_cliente(request.getParameter("nombre"));
				clientes.setEmail_cliente(request.getParameter("email"));
				clientes.setDireccion_cliente(request.getParameter("direccion"));
				clientes.setTelefono_cliente(Long.parseLong(request.getParameter("telefono")));
				try {
					int respuesta = TestJSONclientes.postJSON(clientes);
					if (respuesta==200) {
							request.setAttribute("estado", "true");
							request.setAttribute("status_actualizar", "true");
							request.getRequestDispatcher("index.jsp").forward(request, response);
					}else {
							request.setAttribute("estado", "true");
							request.setAttribute("status_actualizar", "false");
							request.getRequestDispatcher("index.jsp").forward(request, response);
					}
					
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
	}
	
	public void borrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("status_form", "clientes");
		long cedula = 0;
		try {
			cedula =  Long.parseLong(request.getParameter("cedula"));
			int respuesta = UsuarioTestJSON.getJSON2(cedula);
			if (respuesta == 200) {
				request.setAttribute("estado", "true");
				request.setAttribute("status_borrar", "true");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else {
				request.setAttribute("estado", "true");
				request.setAttribute("status_borrar", "false");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}catch(Exception e) {
			cedula = 0;
			request.setAttribute("estado", "true");
			request.setAttribute("status_consultar", "empty");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	
}
