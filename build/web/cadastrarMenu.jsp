<%-- 
    Document   : index
    Created on : 17 de ago. de 2021, 16:26:47
    Author     : laors
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Menu</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, 
              maximum-scale=1, user-scalable=no" />
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
        <!--<meta http-equiv="expires" content="0"> -->
        <link rel="stylesheet" href="bootstrap/bootstrap.css" type="text/css" media="all"/>
        <link rel="stylesheet" href="css/menu.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/all.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/fontawesome.css" type="text/css" media="all"/>
        <link rel="stylesheet" href="datatables/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="googlefonts/stylesheet.css" type="text/css" media="all"/>
        <script src="js/jquery-3.6.0.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/sweetalert2.all.min.js"type="text/javascript"></script>
    </head>
    <body>
         <%
        //HTTP 1.1
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        //HTTP 1.0
        response.setHeader("Pragma", "no-cache");
        //Proxie
        //response.setHeader("Expires", "0");
        if(session.getAttribute("ulogado") == null)
        response.sendRedirect("formLogin.jsp");
        %>
        <div id="container" class = "container-fluid">
            <div id="header">
                <jsp:include page="template/banner.jsp"/>

            </div><!-- fim da div header -->
            <div id="menu">

                <jsp:include page="template/menu.jsp"/>

            </div><!-- fim da div menu -->
            <div id="content" >
                  <div class="bg-background">
                    <form action="gerenciarMenu" method="POST">
                        <h2>Cadastro de Menus</h2>
                    
                        <input type="hidden" class="form-control" name="idMenu"
                               id="idMenu" value="${menu.idMenu}"/>

                        <div class="row">
                            <div class="form-group col col-sm-4 offset-sm-4">
                                <label for="nome" class="btn btn-primary">NOME DO MENU</label>
                                <input type="text" class="form-control" 
                                       name="nome" id="nome" value="${menu.nome}" 
                                       required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col col-sm-4 offset-sm-4">
                                <label for="link" class="btn btn-primary">LINK</label>
                                <input type="text" class="form-control" 
                                       name="link" id="link" value="${menu.link}" 
                                       required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col col-sm-4 offset-sm-4">
                                <label for="icone" class="btn btn-primary">ÍCONE</label>
                                <input type="text" class="form-control" 
                                       name="icone" id="icone" value="${menu.icone}">
                            </div>
                        </div> 
                        <div class="row">
                            <div class="form-group col col-sm-4 offset-sm-4">
                                <label for="exibir" class="btn btn-primary">EXIBIR</label>
                                <select class="form-select form-select-lg m-lg-3 " name="exibir" id="exibir" required>
                                    <option selected>Escolha uma opção</option>
                                    <option value="1" 
                                            <c:if test="${menu.exibir == 1}"> 
                                                selected=""
                                            </c:if>>Sim
                                    </option>
                                    <option value="2"
                                            <c:if test="${menu.exibir == 2}">
                                                selected=""
                                            </c:if>>Não
                                    </option>
                                </select>
                            </div>
                        </div>


                                  
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                                <button class="btn btn-primary btn-xs mr-4">GRAVAR&nbsp;
                                    <i class="fas fa-save"></i>
                                </button>
                                <a href="listarMenu.jsp" 
                                   class="btn btn-secondary btn-xs" 
                                   role="button" >LISTAR MENUS&nbsp;
                                    <i class="fas fa-arrow-circle-left"></i>
                                </a>
                            </div>
                       
                    </form>
                </div>

            </div>
        </div>

    </body>
</html>
