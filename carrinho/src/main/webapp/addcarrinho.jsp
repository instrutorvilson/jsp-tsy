<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.carrinho.entidades.Produto" %>
<%@ page import="com.carrinho.entidades.Carrinho" %>
<%@ page import="com.carrinho.dao.DaoProduto" %> 
<%@ page import="com.carrinho.dao.DaoCarrinho" %> 

<%
   String idproduto = request.getParameter("id");
   Produto prod = DaoProduto.consultar(Integer.parseInt(idproduto));
   Carrinho carrinho = new Carrinho(prod, 1.0f, prod.getPreco());
   String retorno = DaoCarrinho.salvar(carrinho);
   response.sendRedirect("carrinho.jsp");
%>
