<%@page import="logica.Venta"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.MedioDePago"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Paquete"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Eliminar Venta - Silicon Travel </title>
    
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./img/favicon.png">
  
    <!-- Color picker -->
    <link href="./vendor/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/duotone.css" integrity="sha384-R3QzTxyukP03CMqKFe0ssp5wUvBPEyy9ZspCB+Y01fEjhMwcXixTyeot+S40+AjZ" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/fontawesome.css" integrity="sha384-eHoocPgXsiuZh+Yy6+7DsKAerLXyJmu2Hadh4QYyt+8v86geixVYwFqUvMU8X90l" crossorigin="anonymous"/>

    <link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    




</head>

<body>
    
    <!--*******************
        Check Login
    ********************-->  
    <%
        HttpSession miSession = request.getSession(true);

        if(miSession.getAttribute("usuario") == null)
        {
            response.sendRedirect("./login_requerido.jsp");

        }else{

    %>
    <!--*******************
       Fin Check Login
    ********************-->
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">
        
        <div class="nav-header"><jsp:include page="secciones/nav-header.jsp" />  </div>
        
        <div class="header"><jsp:include page="secciones/header.jsp"/> </div>
        
        <div class="quixnav"><jsp:include page="secciones/sidebar.jsp"/> </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>Nueva Venta</h4>
                            <p class="mb-0">Registro de nuevas ventas. </p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                       
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    
                    <div class="col-xxl-12">
                        <div class="card text-white bg-danger">
                            <div class="card-header">
                                <h5 class="card-title text-white">Atencion</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Esta queriendo eliminar un registro de la base de datos. La eliminacion de dicho registro es irreversible.</p>
                               
                            </div>
                           
                        </div>
                    </div>
                    
                </div>

                <div class="row">
                    
                    <div class="col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Datos de la Operacion</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="SvVentaB" method="POST">
                                                <%                                          
                                                    int idVenta = Integer.parseInt(request.getParameter("venta"));
                                                    
                                                    ControladoraLogica ControlL = new ControladoraLogica();
                                                    
                                                    Venta v = ControlL.ventaF(idVenta);
                                                %>

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label>Empleado</label>
                                                <input hidden="" name="idventa" value="<%= v.getNumVenta() %>"></input>
                                                
                                                <input  name="idempleado" type="text" 
                                                        value="<%= v.getEmpleado().getId()+" | "+ v.getEmpleado().getNombre().toUpperCase()+" "+v.getEmpleado().getApellido().toUpperCase()%>" 
                                                        class="form-control" 
                                                        readonly="" 
                                                        >
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div  class="form-group col-md-6">
                                                <label>Cliente</label>
                                               <input  name="idcliente" type="text" 
                                                        value="<%= v.getCliente().getId()+" | "+ v.getCliente().getNombre()+" "+v.getCliente().getApellido()%>" 
                                                        class="form-control" 
                                                        readonly="" 
                                                        >
                                                
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Medio de Pago</label>
                                               <input  name="idpago" type="text" 
                                                        value="<%=v.getMedioDePago().getNombre()%>" 
                                                        class="form-control" 
                                                        readonly="" 
                                                        >
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Tipo de Item</label></br>
                                                    <input  name="tipoProducto" type="text" 
                                                        value="<% 
                                                                            if (v.getTipoProducto().equals("P")){

                                                                                out.print("Paquete");

                                                                            }
                                                                            if (v.getTipoProducto().equals("S")){

                                                                                out.print("Servicio");

                                                                            }    
                                                         %>" 
                                                        class="form-control" 
                                                        readonly="" 
                                                        >
                                                        
                                                     </input>
                                            </div>
                                            
                                                    
                                            <div class="form-group col-md-8">
                                                <label>Producto</label>
                                                <input  name="producto" type="text" 
                                                        value="<%= v.getDetalleProductos().getCodigoProducto()+" | "+ v.getDetalleProductos().getNombre()+" | $ "+v.getDetalleProductos().getCosto()%>"
                                                        class="form-control" 
                                                        readonly="" 
                                                        >
                                            </div>
                                        </div>
                                                <button type="submit" class="btn btn-primary">Eliminar</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <jsp:include page="secciones/footer.jsp"/>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->



    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>


    

    <script src="./js/dashboard/dashboard-1.js"></script>-->
    <!-- Daterangepicker -->
    <!-- momment js is must -->
    <script src="./vendor/moment/moment.min.js"></script>
    <script src="./vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- clockpicker -->
    <script src="./vendor/clockpicker/js/bootstrap-clockpicker.min.js"></script>
    <!-- asColorPicker -->
    <script src="./vendor/jquery-asColor/jquery-asColor.min.js"></script>
    <script src="./vendor/jquery-asGradient/jquery-asGradient.min.js"></script>
    <script src="./vendor/jquery-asColorPicker/js/jquery-asColorPicker.min.js"></script>
    <!-- Material color picker -->
    <script src="./vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- pickdate -->
    <script src="./vendor/pickadate/picker.js"></script>
    <script src="./vendor/pickadate/picker.time.js"></script>
    <script src="./vendor/pickadate/picker.date.js"></script>



    <!-- Daterangepicker -->
    <script src="./js/plugins-init/bs-daterange-picker-init.js"></script>
    <!-- Clockpicker init -->
    <script src="./js/plugins-init/clock-picker-init.js"></script>
    <!-- asColorPicker init -->
    <script src="./js/plugins-init/jquery-asColorPicker.init.js"></script>
    <!-- Material color picker init -->
    <script src="./js/plugins-init/material-date-picker-init.js"></script>
    <!-- Pickdate -->
    <script src="./js/plugins-init/pickadate-init.js"></script>
    
    <script src="./js/mis_scripts.js"></script>
    <%}%>
</body>

</html>