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
        <title>Listagem de Menus</title>
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
        <link rel="stylesheet" href="datatables/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" href="googlefonts/stylesheet.css" type="text/css" media="all"/>
        <script src="js/bootstrap.js"></script>
        
        
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
        <div id="container">
            <div id="header">
                <jsp:include page="template/banner.jsp"/>

            </div><!-- fim da div header -->
            <div id="menu">

                <jsp:include page="template/menu.jsp"/>

            </div><!-- fim da div menu -->
            <div id="content">
                <div class="bg-background">
                <div class="h-100 justify-content-center align-items-center">
                    <div clas="col-12">
                        <div>
                           <h2 class="mb-3">Listagem de Usuários</h2> 
                        </div>
                       <div class="col-sm-2 col-12" style="padding-bottom: 10px">
                        <a class="btn btn-primary btn-lg" href="cadastrarUsuario.jsp" 
                           role="button">NOVO CADASTRO&nbsp;<i class="fas fa-user-plus"></i></a>
                        </div>
                      
                        <div class="table-responsive">
                            <table class="table table-hover table-striped 
                                   table-bordered" id="listarUsuario">
                                <thead class="bg-primary">
                                    <tr class="text-white">
                                        <th>Código</th>
                                        <th>Nome do Usuário</th>
                                        <th>Login</link>
                                        <th>Status</th>
                                        <th>Perfil</th>
                                        <th>Ação</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <jsp:useBean class="model.UsuarioDAO" id="uDAO" />
                                    <c:forEach var="u" items="${uDAO.lista}">
                                        <tr>
                                            <td>${u.idUsuario}</td>
                                            <td>${u.nome}</td>
                                            <td>${u.login}</td>
                                            <td>
                                                <c:if test="${u.status == 1}">
                                                    Ativo
                                                </c:if>
                                                <c:if test="${u.status == 2}">
                                                    Inativo
                                                </c:if>
                                            </td>
                                            <td>${u.perfil.nome}</td>
                                                
                                            <td class='text-center'>
                                                <a href="gerenciarUsuario?acao=alterar&idUsuario=${u.idUsuario}"
                                                   class="btn btn-primary btn-xs" role="button">
                                                    Alterar&nbsp;<i class="fas fa-edit"></i>
                                                </a>
                                                   <script type="text/javascript">
                                                       function confirmAtivar(id,nome){
                                                           if(confirm('Deseja realmente ativar o usuário ' +nome+ ' ?')){
                                                               location.href="gerenciarUsuario?acao=ativar&idUsuario=" +id;
                                                           }
                                                           
                                                       }
                                                    </script>
                                                    <script type="text/javascript">
                                                       function confirmDesativar(id,nome){
                                                           if(confirm('Deseja realmente desativar o usuário ' +nome+ ' ?')){
                                                               location.href="gerenciarUsuario?acao=desativar&idUsuario=" +id;
                                                           }
                                                           
                                                       }
                                                    </script>
                                                
                                                <c:if test="${u.status == 1}">
                                                  <button class='btn btn-danger btn-xs'
                                                    onclick="confirmDesativar('${u.idUsuario}', '${u.nome}')">
                                                    Desativar&nbsp;<i class="fas fa-user-lock"></i>
                                                  </button>
                                                </c:if>
                                                <c:if test="${u.status == 2}">
                                                    <button class='btn btn-success btn-xs'
                                                    onclick="confirmAtivar('${u.idUsuario}', '${u.nome}')">
                                                    Ativar&nbsp;<i class="fas fa-user-shield"></i>
                                                    </button>
                                                </c:if>
                                                
                                                
                                            </td>      
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <script src="js/jquery-3.6.0.js"></script>
                            <script src="datatables/jquery.dataTables.js"></script>
                            <script src="datatables/dataTables.bootstrap4.js"></script>
                            <script>
                                $(document).ready(function () {
                                    $("#listarUsuario").dataTable({
                                        "bJQueryUI": true,
                                        "lengthMenu": [[5, 10, 20, 25, -1], [5, 10, 20, 25, "All"]],
                                        "oLanguage": {
                                            "sProcessing": "Processando..",
                                            "sLengthMenu": "Mostrar _MENU_ registros",
                                            "sZeroRecords": "Não foram encontrados resultados",
                                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                                            "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                                            "sInfoFiltered": "",
                                            "sInfoPostFix": "",
                                            "sSearch": "Pesquisar",
                                            "sUrl": "",
                                            "oPaginate": {
                                                "sFirst": "Primeiro",
                                                "sPrevious": "Anterior",
                                                "sNext": "Próximo",
                                                "sLast": "Último"
                                            }
                                        }
                                    });
                                });


                            </script>
                       </div>
                    </div>
                </div>


            </div>                       
            </div><!--fim da div content -->


        </div>