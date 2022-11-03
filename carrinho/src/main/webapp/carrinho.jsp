<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.carrinho.entidades.Produto" %>
<%@ page import="com.carrinho.entidades.Carrinho" %>
<%@ page import="com.carrinho.dao.DaoProduto" %> 
<%@ page import="com.carrinho.dao.DaoCarrinho" %> 
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <table class="table">
            <thead class="bg-success">
                <tr>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                </tr>
            </thead>
            <tbody>
                <%
                   List<Carrinho> lista = DaoCarrinho.consultar();
                   for(Carrinho c: lista){
                      out.write("<tr>"); 
                      out.write("<td>"+c.getProduto().getDescricao()+"</td>");  
                      out.write("<td>"+c.getQuantidade()+"</td>");
                      out.write("<td>"+c.getPreco()+"</td>");                
                      out.write("</tr>"); 
                   }
                    
                %>
            </tbody>
        </table>
    </div>
</body>
</html>