<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="control.GerenciarLogin" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>


<%
    Usuario ulogado = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("ulogado", ulogado);
%>

<div class="d-grid gap-2 d-sm-flex justify-content-sm-between" <%--style="background-color: white;--%> ">

    <c:if test="${ulogado != null}">
        <h4 style="color: #000;">Bem vindo(a):&nbsp;${ulogado.nome}</h4>
        <a href="gerenciarLogin?" 
           class="btn btn-outline-dark btn-xs mb-1" 
           role="button">Sair&nbsp;<i class="fas fa-sign-out-alt"></i>
        </a>
    </c:if>

</div>
<div class="nav navbar-nav navbar-nav-first">
    <ul class="navUL">
        <c:if test="${ulogado != null && ulogado.perfil != null}">
            <c:forEach var="menu" items="${ulogado.perfil.menus}">
                <c:if test="${menu.exibir==1}">
                    <li><a href="${menu.link}">${menu.nome}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
    </ul>
</div>

<link rel="stylesheet" href="../css/menu.css" type="text/css" media="all"/>
<link rel="stylesheet" href="../css/styles.css" type="text/css" media="all"/>
