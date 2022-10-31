<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.carrinho.dao.DaoProduto" %>

<%
   String idproduto =  request.getParameter("id");
   DaoProduto.excluir(Integer.parseInt(idproduto));
   response.sendRedirect("consulta.jsp");
%>