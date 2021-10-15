<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='co.edu.unbosque.tiendavirtual1_front.model.Usuarios'  %>
<%@ page import='co.edu.unbosque.tiendavirtual1_front.model.Clientes'  %>
<%@ page import='co.edu.unbosque.tiendavirtual1_front.model.Proveedores'  %>
<%@ page import='co.edu.unbosque.tiendavirtual1_front.model.Ventas'  %>
<%@ page import='co.edu.unbosque.tiendavirtual1_front.model.Productos'  %>
<%@ page import='org.json.simple.JSONObject'  %>
<%@ page import='org.json.simple.parser.JSONParser'  %>
<%@ page import='org.json.simple.parser.ParseException'  %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilo.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/listas.css"/>
<meta charset="UTF-8"/>
<title>TIENDA VIRTUAL</title>
</head>
<body>
<% boolean login = false;%>


	<form class="forma1" id="cuadro" action="./UsuarioServlet" method="post" <%
	if(request.getAttribute("estado") == "true" && login == false){
		%>style="display:none"<%
	}
	%>>
	<div class="titulol" id="titulot"><h1>Iniciar Sesion</h1></div>
		<img class="imglog" alt="login" src="img/usuarios.gif">
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
		  
		  if(request.getAttribute("status_crear") == "true"){%><script>alert('Usuario ingresado de manera exitosa');</script><%
		  }else if(request.getAttribute("status_crear") == "false"){%><script>alert('Datos incorrectos');</script><%
		  }else if(request.getAttribute("status_crear") == "empty"){%><script>alert('Faltan datos del usuario');</script><%
		  
		  }else if(request.getAttribute("status_consultar") == "true"){%><script>alert('Consulta usuario exitosa');</script><% 
		  }else if(request.getAttribute("status_consultar") == "empty"){%><script>alert('Usuario inexistente');</script><%
		  }else if(request.getAttribute("status_consultar") == "empty_id"){%><script>alert('No ingresó un número de cédula');</script><%
		  
		  }else if(request.getAttribute("status_actualizar") == "true"){%><script>alert('Usuario actualizado de manera exitosa');</script><%
		  }else if(request.getAttribute("status_actualizar") == "false"){%><script>alert('Datos incorrectos');</script><%
		  }else if(request.getAttribute("status_actualizar") == "empty"){%><script>alert('Faltan datos del usuario');</script><%
		  
		  }else if(request.getAttribute("status_borrar") == "true"){%><script>alert('Datos del usuario borrados');</script><% 
		  }else if(request.getAttribute("status_borrar") == "false"){%><script>alert('Usuario inexistente');</script><%
		  }else if(request.getAttribute("status_borrar") == "empty"){%><script>alert('No ingresó un número de cédula');</script><%
		}
	  }
	  else if(request.getAttribute("status_form")== "clientes"){
		  
		  if(request.getAttribute("status_crear") == "true"){%><script>alert('Cliente ingresado de manera exitosa');</script><%
		  }else if(request.getAttribute("status_crear") == "false"){%><script>alert('Datos incorrectos');</script><%
		  }else if(request.getAttribute("status_crear") == "empty"){%><script>alert('Faltan datos del cliente');</script><%
		  
		  }else if(request.getAttribute("status_consultar") == "true"){%><script>alert('Consulta cliente exitosa');</script><% 
		  }else if(request.getAttribute("status_consultar") == "empty"){%><script>alert('Cliente inexistente');</script><%
		  }else if(request.getAttribute("status_consultar") == "empty_id"){%><script>alert('No ingresó un número de cédula');</script><%
		  
		  }else if(request.getAttribute("status_actualizar") == "true"){%><script>alert('Cliente actualizado de manera exitosa');</script><%
		  }else if(request.getAttribute("status_actualizar") == "false"){%><script>alert('Datos incorrectos');</script><%
		  }else if(request.getAttribute("status_actualizar") == "empty"){%><script>alert('Faltan datos del cliente');</script><%
		  
		  }else if(request.getAttribute("status_borrar") == "true"){%><script>alert('Datos del cliente borrados');</script><% 
		  }else if(request.getAttribute("status_borrar") == "false"){%><script>alert('Cliente inexistente');</script><%
		  }else if(request.getAttribute("status_borrar") == "empty"){%><script>alert('No ingresó un número de cédula');</script><%
		}
	  }
	  else if(request.getAttribute("status_form")== "proveedores"){
	  
		  if(request.getAttribute("status_crear") == "true"){%><script>alert('Proveedor ingresado de manera exitosa');</script><%
		  }else if(request.getAttribute("status_crear") == "false"){%><script>alert('Datos incorrectos');</script><%
		  }else if(request.getAttribute("status_crear") == "empty"){%><script>alert('Faltan datos del proveedor');</script><%
		  
		  }else if(request.getAttribute("status_consultar") == "true"){%><script>alert('Consulta proveedor exitosa');</script><% 
		  }else if(request.getAttribute("status_consultar") == "empty"){%><script>alert('Proveedor inexistente');</script><%
		  }else if(request.getAttribute("status_consultar") == "empty_id"){%><script>alert('No ingresó un número de NIT');</script><%
		  
		  }else if(request.getAttribute("status_actualizar") == "true"){%><script>alert('Proveedor actualizado de manera exitosa');</script><%
		  }else if(request.getAttribute("status_actualizar") == "false"){%><script>alert('Datos incorrectos');</script><%
		  }else if(request.getAttribute("status_actualizar") == "empty"){%><script>alert('Faltan datos del proveedor');</script><%
		  
		  }else if(request.getAttribute("status_borrar") == "true"){%><script>alert('Datos del proveedor borrados');</script><% 
		  }else if(request.getAttribute("status_borrar") == "false"){%><script>alert('Proveedor inexistente');</script><%
		  }else if(request.getAttribute("status_borrar") == "empty"){%><script>alert('No ingresó un número de NIT');</script><%
		}
	  }
	  else if(request.getAttribute("status_form")== "producto"){
		  
		  if(request.getAttribute("status_load") == "true"){%><script>alert('Archivo cargado exitosamente');</script><% 
		  }else if(request.getAttribute("status_load") == "false"){%><script>alert('Error: formato de archivo inválido');</script><%
		  }else if(request.getAttribute("status_load") == "empty"){%><script>alert('Error: no se seleccionó archivo para cargar');</script><%
		  }else if(request.getAttribute("status_load") == "error"){%><script>alert('Error: datos leídos inválidos');</script><%
		  }
	  }
	  else if(request.getAttribute("status_form") == "ventas" ){
		  
		  if(request.getAttribute("status_consultarcliente") == "true"){%><script>alert('Consulta cliente exitosa');</script><% 
	  	  	}else if(request.getAttribute("status_consultarcliente") == "empty"){%><script>alert('Cliente inexistente');</script><%
	   	  	}else if(request.getAttribute("status_consultarcliente") == "empty_id"){%><script>alert('No ingresó un número de cédula');</script><%
	      	}
		  
	  	  	 else if(request.getAttribute("status_consultarpro1") == "true"){%><script>alert('Consulta producto exitosa');</script><% 
	   	  	}else if(request.getAttribute("status_consultarpro1") == "empty"){%><script>alert('Producto inexistente');</script><%
	  		}else if(request.getAttribute("status_consultarpro1") == "empty_id"){%><script>alert('No ingresó un código de producto');</script><%
			}
	  }
	  else if(login == true){%><script>alert('Ingreso exitoso');</script><%}%>	
	  
	  
	  
<div class="cuadro-ventas" id="navbarResponsive" <%
	if(login == true){
		%>style="display:block"<%		
	}else{
		%>style="display:none"<%
	}
%>>
<div class="body2" id="body2">
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
					<td><input type="text" name="NIT"
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
     	<form method="post" action="./ProductoServlet" enctype="multipart/form-data">
			<table class="productos">
				<tr>
					<td><label>Nombre del archivo:</label></td>
					<td><input type="file" name="archivoProductos"></td>
					<td><label></label></td>
					<td><input type="submit" value="Enviar datos" name="Enviardatos"></td>
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
       	<%
		if(request.getAttribute("status_form") == "producto"){
			%> <script> window.onload = mostrar('interaccion-4') </script>
			<%
		}
	%>
    <section  id="interaccion-5" class="oculto info-5"> 
     <h3>Ventas</h3>
     <form method="post" action="./VentasServlet">
			<table class="ventas">
				<tr>
					<%	Clientes cliente = new Clientes();
						String b = new String();
						if(request.getAttribute("cliente")!=null){
							Object a = request.getAttribute("cliente");
							b = (String) a;
							JSONParser jsonParser = new JSONParser();
							JSONObject json = (JSONObject) jsonParser.parse(b);
							cliente.setCedula_cliente((long) json.get("cedula_cliente"));
							cliente.setNombre_cliente((String) json.get("nombre_cliente"));
						}
						
						Productos producto1 = new Productos();
						String producto1txt = new String();
						if (request.getAttribute("producto1")!= null){
							Object producto1Obj = request.getAttribute("producto1");
							producto1txt = (String) producto1Obj;
							JSONParser jsonParser = new JSONParser();
							JSONObject json = (JSONObject) jsonParser.parse(producto1txt);
							producto1.setCodigo_producto((long) json.get("codigo_producto"));
							producto1.setNombre_producto((String) json.get("nombre_producto"));
							producto1.setPrecio_venta((long) json.get("precio_venta"));
						}
						
						Productos producto2 = new Productos();
						String producto2txt = new String();
						if (request.getAttribute("producto2")!= null){
							Object producto2Obj = request.getAttribute("producto2");
							producto2txt = (String) producto2Obj;
							JSONParser jsonParser = new JSONParser();
							JSONObject json = (JSONObject) jsonParser.parse(producto2txt);
							producto2.setCodigo_producto((long) json.get("codigo_producto"));
							producto2.setNombre_producto((String) json.get("nombre_producto"));
							producto2.setPrecio_venta((long) json.get("precio_venta"));
						}
						
						Productos producto3 = new Productos();
						String producto3txt = new String();
						if (request.getAttribute("producto3")!= null){
							Object producto3Obj = request.getAttribute("producto3");
							producto3txt = (String) producto3Obj;
							JSONParser jsonParser = new JSONParser();
							JSONObject json3 = (JSONObject) jsonParser.parse(producto3txt);
							producto3.setCodigo_producto((long) json3.get("codigo_producto"));
							producto3.setNombre_producto((String) json3.get("nombre_producto"));
							producto3.setPrecio_venta((long) json3.get("precio_venta"));
						}
						
					%>
					<td><textarea style="display:none;" name="cliente" rows="10" cols="40"><%if(cliente.getCedula_cliente()>0){%><%= b %><%} %></textarea></td>
					<td><textarea style="display:none;" name="producto1" rows="10" cols="40"><%if(producto1.getCodigo_producto()>0){%><%= producto1txt %><%} %></textarea></td>
					<td><textarea style="display:none;" name="producto2" rows="10" cols="40"><%if(producto2.getCodigo_producto()>0){%><%= producto2txt %><%} %></textarea></td>
					<td><textarea style="display:none;" name="producto3" rows="10" cols="40"><%if(producto3.getCodigo_producto()>0){%><%= producto3txt %><%} %></textarea></td>
				</tr>
				<tr>
					<td><label>Cédula:</label></td>
					<td><input type="text" name="cedula" <%if(cliente.getCedula_cliente()>0){%>value="<%= cliente.getCedula_cliente()%>"<%} %>></td>
					<td><button class="consultaVentas" name="consultaCliente" type="submit">Consulta</button></td>
					<td><label>Cliente:</label></td>
					<td><input type="text" name="nombre_cliente" <%if(cliente.getCedula_cliente()>0){%>value="<%= cliente.getNombre_cliente() %>"<%} %>></td>
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
					<td><input type="text" name="codigo1" <%if(producto1.getCodigo_producto()>0){%>value="<%= producto1.getCodigo_producto() %>"<%} %>></td>
					<td><button class="consultaVentas" name="consultaProducto1" type="submit">Consulta</button></td>
					<td><input type="text" name="nom-product" <%if(producto1.getCodigo_producto()>0){%>value="<%= producto1.getNombre_producto() %>"<%} %>></td>
					<td><input type="text" name="cantidad1" <%if(request.getAttribute("cantidad1")!=null){%>value="<%= request.getAttribute("cantidad1") %>"<%} %>></td>
					<td><input type="text" name="valor-total" <%if(request.getAttribute("cantidad1")!=null){%>value="<%= request.getAttribute("valor1") %>"<%} %>></td>
				</tr>
				<tr>
					<td><input type="text" name="codigo2" <%if(producto2.getCodigo_producto()>0){%>value="<%= producto2.getCodigo_producto() %>"<%} %>></td>
					<td><button class="consultaVentas" name="consultaProducto2" type="submit">Consulta</button></td>
					<td><input type="text" name="nom-product2" <%if(producto2.getCodigo_producto()>0){%>value="<%= producto2.getNombre_producto() %>"<%} %>></td>
					<td><input type="text" name="cantidad2" <%if(request.getAttribute("cantidad2")!=null){%>value="<%= request.getAttribute("cantidad2") %>"<%} %>></td>
					<td><input type="text" name="valor-total2" <%if(request.getAttribute("cantidad2")!=null){%>value="<%= request.getAttribute("valor2") %>"<%} %>></td>
				</tr>
				<tr>
					<td><input type="text" name="codigo3" <%if(producto3.getCodigo_producto()>0){%>value="<%= producto3.getCodigo_producto() %>"<%} %>></td>
					<td><button class="consultaVentas" name="consultaProducto3" type="submit">Consulta</button></td>
					<td><input type="text" name="nom-product3" <%if(producto3.getCodigo_producto()>0){%>value="<%= producto3.getNombre_producto() %>"<%} %>></td>
					<td><input type="text" name="cantidad3" <%if(request.getAttribute("cantidad3")!=null){%>value="<%= request.getAttribute("cantidad3") %>"<%} %>></td>
					<td><input type="text" name="valor-total3" <%if(request.getAttribute("cantidad3")!=null){%>value="<%= request.getAttribute("valor3") %>"<%} %>></td>
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
					<td></td>
					<th>Total con IVA</th>
					<td><input type="text" name="total-con+iva"></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="consultaVentas" name="Calcular" type="submit">Calcular</button></td>
					<td><button class="consultaVentas" name="Confirmar" type="submit">Confirmar</button></td>
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
           	<%
		if(request.getAttribute("status_form") == "ventas"){
			%> <script> window.onload = mostrar('interaccion-5') </script>
			<%
		}
	%>
     <section  id="interaccion-6" class="oculto info-6"> 
     <h3>Reportes</h3>
   
  		<ul class="navbar-nav2 ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" onClick="mostrar('interaccion-7');">Listado Usuarios</a> 
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger " onClick="mostrar('interaccion-8');">Listado Clientes</a>
            </li> 
           <li class="nav-item">
              <a class="nav-link js-scroll-trigger " onClick="mostrar('interaccion-9');">Listado ventas por cliente</a>
            </li> 
           </ul>


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
    
    <section  id="interaccion-7" class="oculto info-7">
		<h2>Listado Usuarios</h2>
		<form action="">
			<table class="listas">
				<thead>
						<tr>
							<th>Cedula</th>
							<th>Nombre</th>
							<th>Correo Electronico</th>
							<th>Usuario</th>
							<th>Password</th>
						</tr>
				</thead>
				<tbody class="listas" id="listas">
				</tbody>
			</table>
			
			
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
		
		<section  id="interaccion-8" class="oculto info-8">
		<h2>Listado Clientes</h2>
		<form action="">
			<table class="listas">
				<thead>
						<tr>
							<th>Cedula</th>
							<th>Nombre</th>
							<th>Correo Electronico</th>
							<th>Direccion</th>
							<th>Telefono</th>
						</tr>
				</thead>
				<tbody class="listas" id="listas">
				</tbody>
			</table>
			
			
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
		
		<section  id="interaccion-9" class="oculto info-9">
		<h2>Listado Clientes</h2>
		<form action="">
			<table class="listas">
				<thead>
						<tr>
							<th>Cedula</th>
							<th>Nombre</th>
							<th>Valor total ventas</th>
						</tr>
				</thead>
				<tbody class="listas" id="listas">
				</tbody>
			</table>
			
			
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
		
</body>
</html>
