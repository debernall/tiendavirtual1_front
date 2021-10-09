<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='co.edu.unbosque.tiendavirtual1_front.model.Usuarios'  %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilo.css"/>
<meta charset="UTF-8"/>
<title>TIENDA VIRTUAL</title>
</head>
<body>
<% boolean login = false;%>


	<form action="./UsuarioServlet" method="post" <%
	if(request.getAttribute("estado") == "true" && login == false){
		%>style="display:none"<%
	}
	%>>
	<div class="body2" id="body2">
	<div class="titulol" id="titulot"><h1>Iniciar Sesion</h1></div>


		<table class="regitro">
			<tr>
				 <td><label class="regitro1" for="uname"><b>Usuario</b></label></td>
   				 <td><input class="regitro1" type="text" placeholder="Ingresa el usuario" name="usuario" required></td>
			</tr>
			<tr>
				<td><label class="regitro1" for="passt"><b>Contraseña</b></label></td>
				<td><input class="regitro1" type="password" placeholder="Ingresa la contraseña" name="password" required></td>
			</tr>

		</table>
			<div class="botonl" id="botonl">
     		 <button type="submit" class="signupbtn" value="Ingresar" name="Ingresar">Ingresar</button>
    		</div>
     	</div>
	</form> 
	
	
	<%if(request.getAttribute("estado") == "true"){
		login = true;
	}else if (request.getAttribute("estado") == "false") {
		%>
			<script>alert('Usuario o contraseña errados, intente de nuevo');</script>
		<%
	} %>
	
	<%String status_crear = request.getParameter("status_crear"); 
	  String status_consultar = request.getParameter("status_consultar");
	  if(request.getAttribute("status_form")== "usuarios"){
	  
		  if(request.getAttribute("status_crear") == "true"){
			  %>
				<script>alert('Usuario ingresado de manera exitosa');</script>
			<%
	  	  
		  }else if(request.getAttribute("status_crear") == "false"){
			  %>
				<script>alert('Datos incorrectos');</script>
			<%
		  }else if(request.getAttribute("status_crear") == "empty"){
			  %>
				<script>alert('Faltan datos del usuario');</script>
			<%
		  }
		  else if(request.getAttribute("status_consultar") == "true"){
			%>
				<script>alert('Consulta usuario exitosa');</script>
			<% 
		  }
		  else if(request.getAttribute("status_consultar") == "empty"){
			  %>
				<script>alert('Usuario inexistente');</script>
			<%
		  }
		  else if(request.getAttribute("status_consultar") == "empty_id"){
			  %>
				<script>alert('No ingresó un número de cédula');</script>
			<%
		  }
		  else if(request.getAttribute("status_actualizar") == "true"){
			  %>
				<script>alert('Usuario actualizado de manera exitosa');</script>
			<%
		  }else if(request.getAttribute("status_actualizar") == "false"){
			  %>
				<script>alert('Datos incorrectos');</script>
			<%
		  }else if(request.getAttribute("status_actualizar") == "empty"){
			  %>
				<script>alert('Faltan datos del usuario');</script>
			<%
		  }
		  else if(request.getAttribute("status_borrar") == "true"){
				%>
					<script>alert('Datos del usuario borrados');</script>
				<% 
		  }else if(request.getAttribute("status_borrar") == "false"){
			  %>
				<script>alert('Usuario inexistente');</script>
			<%
		  }
		  else if(request.getAttribute("status_borrar") == "empty"){
				  %>
					<script>alert('No ingresó un número de cédula');</script>
				<%
		  }
	  }
	  else if(request.getAttribute("status_form")== "clientes"){
		  
	  
		  if(request.getAttribute("status_crear") == "true"){
			  %>
				<script>alert('Cliente ingresado de manera exitosa');</script>
			<%
		  }else if(request.getAttribute("status_crear") == "false"){
			  %>
				<script>alert('Datos incorrectos');</script>
			<%
		  }else if(request.getAttribute("status_crear") == "empty"){
			  %>
				<script>alert('Faltan datos del cliente');</script>
			<%
		  }
		  else if(request.getAttribute("status_consultar") == "true"){
			%>
				<script>alert('Consulta cliente exitosa');</script>
			<% 
		  }
		  else if(request.getAttribute("status_consultar") == "empty"){
			  %>
				<script>alert('Cliente inexistente');</script>
			<%
		  }
		  else if(request.getAttribute("status_consultar") == "empty_id"){
			  %>
				<script>alert('No ingresó un número de cédula');</script>
			<%
		  }
		  else if(request.getAttribute("status_actualizar") == "true"){
			  %>
				<script>alert('Cliente actualizado de manera exitosa');</script>
			<%
		  }else if(request.getAttribute("status_actualizar") == "false"){
			  %>
				<script>alert('Datos incorrectos');</script>
			<%
		  }else if(request.getAttribute("status_actualizar") == "empty"){
			  %>
				<script>alert('Faltan datos del cliente');</script>
			<%
		  }
		  else if(request.getAttribute("status_borrar") == "true"){
				%>
					<script>alert('Datos del cliente borrados');</script>
				<% 
		  }
		  else if(request.getAttribute("status_borrar") == "false"){
				  %>
					<script>alert('Cliente inexistente');</script>
				<%
		  }
		  else if(request.getAttribute("status_borrar") == "empty"){
				  %>
					<script>alert('No ingresó un número de cédula');</script>
				<%
		  }
	  }
	  else if(request.getAttribute("status_form")== "proveedores"){
	  
		  if(request.getAttribute("status_crear") == "true"){
		  %>
			<script>alert('Proveedor ingresado de manera exitosa');</script>
		<%
		  }else if(request.getAttribute("status_crear") == "false"){
			  %>
				<script>alert('Datos incorrectos');</script>
			<%
		  }else if(request.getAttribute("status_crear") == "empty"){
			  %>
				<script>alert('Faltan datos del proveedor');</script>
			<%
		  }
		  else if(request.getAttribute("status_consultar") == "true"){
			%>
				<script>alert('Consulta proveedor exitosa');</script>
			<% 
		  }
		  else if(request.getAttribute("status_consultar") == "empty"){
			  %>
				<script>alert('Proveedor inexistente');</script>
			<%
		  }
		  else if(request.getAttribute("status_consultar") == "empty_id"){
			  %>
				<script>alert('No ingresó un número de NIT');</script>
			<%
		  }
		  else if(request.getAttribute("status_actualizar") == "true"){
			  %>
				<script>alert('Proveedor actualizado de manera exitosa');</script>
			<%
		  }else if(request.getAttribute("status_actualizar") == "false"){
			  %>
				<script>alert('Datos incorrectos');</script>
			<%
		  }else if(request.getAttribute("status_actualizar") == "empty"){
			  %>
				<script>alert('Faltan datos del proveedor');</script>
			<%
		  }
		  else if(request.getAttribute("status_borrar") == "true"){
				%>
					<script>alert('Datos del proveedor borrados');</script>
				<% 
		  }
		  else if(request.getAttribute("status_borrar") == "false"){
				  %>
					<script>alert('Proveedor inexistente');</script>
				<%
		  }
		  else if(request.getAttribute("status_borrar") == "empty"){
				  %>
					<script>alert('No ingresó un número de NIT');</script>
				<%
		  }
	  }
	  else if(login == true){
		  %><script>alert('Ingreso exitoso');</script>
		  <%
		}
		%>	
<div class="cuadro-ventas" id="navbarResponsive" <%
	if(login == true){
		%>style="display:block"<%		
	}else{
		%>style="display:none"<%
	}
%>>
          <ul class="navbar-nav1 ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" onClick="mostrar('interaccion-1');">Usuarios</a> 
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger " onClick="mostrar('interaccion-2');">Clientes</a>
            </li> 
           <li class="nav-item">
              <a class="nav-link js-scroll-trigger " onClick="mostrar('interaccion-3');">Proveedores</a>
            </li> 
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger " onClick="mostrar('interaccion-4');">Productos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger " onClick="mostrar('interaccion-5');">Ventas</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger " onClick="mostrar('interaccion-6');">Reportes</a>
            </li>
           </ul>
  </div>

    <section  id="interaccion-1" class="oculto info-1"> 
    <h3>Usuarios</h3>
	    <form method="post" action="./UsuarioServlet">
			<table class="Usuarios">
				<tr>
					<td><label>Cédula:</label></td>
					<td><input type="number" name="cedula" 
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("cedula")%> 
							<%
						}
					%>
					></td>
					<td><label>Usuario:</label></td>
					<td><input type="text" name="usuario" <%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("usuario")%> 
							<%
						}
					%>
					></td>
				</tr>	
				<tr>
					<td><label>Nombre Completo:</label></td><br>
					<td><input type="text" name="nombre" <%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("nombre")%> 
							<%
						}
					%>
					></td>
					<td><label>Contraseña:</label></td>
					<td><input type="password" name="password" <%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("password")%> 
							<%
						}
					%>
					></td><br>
				</tr>	
				<tr>
					<td><label>Correo Electónico:</label></td>
					<td><input type="text" name="email" <%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("email")%> 
							<%
						}
					%>
					></td>
				</tr>
			</table>
			<br>
		
		<script type="text/javascript">
		function mostrar(name){
			closeAll();
			let el = document.getElementById(name);
			el.style.height = 'auto';
			irA(name);
		}
		function closeAll(){
			let info = document.getElementsByClassName('oculto');
			for(i = 0; i < info.length; i++){
				info[i].style.height = '0';
			} 
		}
		function irA(name){
			let el = document.getElementById(name);
			window.smoothScroll(el, 1000);
		}
		</script>
			<div class="botones">
					<button name="Consultar" type="submit">Consulta</button>
					<button type="submit" name="Crear" >Crear</button>
					<button name="Actualizar" type="submit">Actualizar</button>
					<button name="Borrar" type="submit">Borrar</button>
			</div>
		</form>
    </section>


    <%
		if(request.getAttribute("status_form") == "usuarios"){
			%> <script> window.onload = mostrar('interaccion-1') </script>
			<%
		}
	%>
    <section  id="interaccion-2" class="oculto info-2"> 
     <h3>Clientes</h3>
     	<form method="post" action="./ClienteServlet">
			<table class="Clientes">
				<tr>
					<td><label>Cédula:</label></td>
					<td><input type="text" name="cedula"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("cedula")%> 
							<%
						}
					%>
					></td>
					<td><label>Teléfono:</label></td>
					<td><input type="text" name="telefono"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("telefono")%> 
							<%
						}
					%>
					></td>
				</tr>	
				<tr>
					<td><label>Nombre Completo:</label></td><br>
					<td><input type="text" name="nombre_completo"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("nombre")%> 
							<%
						}
					%>
					></td>
					<td><label>Correo Electrónico:</label></td>
					<td><input type="text" name="email"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("email")%> 
							<%
						}
					%>
					></td><br>
				</tr>	
				<tr>
					<td><label>Dirección:</label></td>
					<td><input type="text" name="direccion"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("direccion")%> 
							<%
						}
					%>
					></td>
				</tr>
			</table>
			<br>
		<script type="text/javascript">
		function mostrar(name){
			closeAll();
			let el = document.getElementById(name);
			el.style.height = 'auto';
			irA(name);
		}
		function closeAll(){
			let info = document.getElementsByClassName('oculto');
			for(i = 0; i < info.length; i++){
				info[i].style.height = '0';
			} 
		}
		function irA(name){
			let el = document.getElementById(name);
			window.smoothScroll(el, 1000);
		}
		</script> 
			<div class="botones">
					<button name="Consultar" type="submit">Consulta</button>
					<button name="Crear" type="submit">Crear</button>
					<button name="Actualizar" type="submit">Actualizar</button>
					<button name="Borrar" type="submit">Borrar</button>
			</div>
			</form>
    </section>
   	<%
		if(request.getAttribute("status_form") == "clientes"){
			%> <script> window.onload = mostrar('interaccion-2') </script>
			<%
		}
	%>
    <section  id="interaccion-3" class="oculto info-3"> 
     <h3>Proveedores</h3>
     <form method="post" action="./ProveedorServlet">
    
			<table class="proveedores">
				<tr>
					<td><label>NIT:</label></td>
					<td><input type="text" name="nit"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("NIT")%> 
							<%
						}
					%>
					></td>
					<td><label>Teléfono:</label></td>
					<td><input type="text" name="telefono"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("telefono")%> 
							<%
						}
					%>
					></td>
				</tr>	
				<tr>
					<td><label>Nombre Proveedor:</label></td><br>
					<td><input type="text" name="nombre_proveedor"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("nombre")%> 
							<%
						}
					%>
					></td>
					<td><label>Ciudad:</label></td>
					<td><input type="text" name="ciudad"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("ciudad")%> 
							<%
						}
					%>
					></td><br>
				</tr>	
				<tr>
					<td><label>Dirección:</label></td>
					<td><input type="text" name="direccion"
					<%
						if(request.getAttribute("status_consultar") == "true"){
							%> 
							value=<%= request.getAttribute("direccion")%> 
							<%
						}
					%>
					></td>
				</tr>
			</table>
			<br>
		<script type="text/javascript">
		function mostrar(name){
			closeAll();
			let el = document.getElementById(name);
			el.style.height = 'auto';
			irA(name);
		}
		function closeAll(){
			let info = document.getElementsByClassName('oculto');
			for(i = 0; i < info.length; i++){
				info[i].style.height = '0';
			} 
		}
		function irA(name){
			let el = document.getElementById(name);
			window.smoothScroll(el, 1000);
		}
		</script>
			<div class="botones">
					<button name="Consultar" type="submit">Consulta</button>
					<button name="Crear" type="submit">Crear</button>
					<button name="Actualizar" type="submit">Actualizar</button>
					<button name="Borrar" type="submit">Borrar</button>
			</div>
	</form>
    </section>
    <%
		if(request.getAttribute("status_form") == "proveedores"){
			%> <script> window.onload = mostrar('interaccion-3') </script>
			<%
		}
	%>
    <section  id="interaccion-4" class="oculto info-4"> 
     <h3>Productos</h3>
			<table class="productos">
				<tr>
					<td><label>Nombre del archivo:</label></td>
					<td><input type="file" name="archioProduct"></td>
					<td><label></label></td>
					<td><input type="submit" value="Enviar datos"></td>
				</tr>	
			</table>
			<br>
		<script type="text/javascript">
		function mostrar(name){
			closeAll();
			let el = document.getElementById(name);
			el.style.height = 'auto';
			irA(name);
		}
		function closeAll(){
			let info = document.getElementsByClassName('oculto');
			for(i = 0; i < info.length; i++){
				info[i].style.height = '0';
			} 
		}
		function irA(name){
			let el = document.getElementById(name);
			window.smoothScroll(el, 1000);
		}
		</script>
    </section>
    <section  id="interaccion-5" class="oculto info-5"> 
     <h3>Ventas</h3>
     <form>
			<table class="ventas">
				<tr>
					<td><label>Cédula:</label></td>
					<td><input type="text" name="nit"></td>
					<td><button class="consultaVentas" name="Consultar" type="button">Consulta</button></td>
					<td><label>Clientes:</label></td>
					<td><input type="text" name="telefono"></td>
					<td><label>Consecutivo:</label></td>
					<td><input type="text" name="telefono"></td>
				</tr>
			</table>
			<table class="ventas2">		
				<tr>
					<th>Cod.Producto</th>
					<th></th>
					<th>Nombre Producto</th>
					<th>Cant.</th>
					<th>Vlr. Total</th>
				</tr>	
				<tr>
					<td><input type="text" name="codigo1"></td>
					<td><button class="consultaVentas" name="Consultar" type="button">Consulta</button></td>
					<td><input type="text" name="nom-product"></td>
					<td><input type="text" name="cantidad"></td>
					<td><input type="text" name="valor-total"></td>
				</tr>
				<tr>
					<td><input type="text" name="codigo2"></td>
					<td><button class="consultaVentas" name="Consultar" type="button">Consulta</button></td>
					<td><input type="text" name="nom-product2"></td>
					<td><input type="text" name="cantidad2"></td>
					<td><input type="text" name="valor-total2"></td>
				</tr>
				<tr>
					<td><input type="text" name="codigo3"></td>
					<td><button class="consultaVentas" name="Consultar" type="button">Consulta</button></td>
					<td><input type="text" name="nom-product3"></td>
					<td><input type="text" name="cantidad3"></td>
					<td><input type="text" name="valor-total3"></td>
				</tr>
			</table>
			<table class="totalventas">
				<tr>
					<td></td>
					<th class="ttv">Total Venta</th>
					<td><input type="text" name="total-venta"></td>
				</tr>
				<tr>
					<td></td>
					<th class="ttv">Total IVA</th>
					<td><input type="text" name="total-iva"></td>
				</tr>
				<tr>
					<td><button class="consultaVentas" name="Consultar" type="button">Consulta</button></td>
					<th>Total con IVA</th>
					<td><input type="text" name="total-con+iva"></td>
				</tr>
			</table>
			<br>
		<script type="text/javascript">
		function mostrar(name){
			closeAll();
			let el = document.getElementById(name);
			el.style.height = 'auto';
			irA(name);
		}
		function closeAll(){
			let info = document.getElementsByClassName('oculto');
			for(i = 0; i < info.length; i++){
				info[i].style.height = '0';
			} 
		}
		function irA(name){
			let el = document.getElementById(name);
			window.smoothScroll(el, 1000);
		}
		</script>
	</form> 
    </section>
     <section  id="interaccion-6" class="oculto info-6"> 
     <h3>Reportes</h3>
	<!-- contenido Reportes -->
    </section>
</body>
</html>
