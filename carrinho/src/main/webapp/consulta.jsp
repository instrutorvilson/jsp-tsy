<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.carrinho.entidades.Produto" %>
<%@ page import="com.carrinho.dao.DaoProduto" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Descrição</th>
                <th>Preço</th>
            </tr>
        </thead>
        <tbody>
            <%
               List<Produto> lista = DaoProduto.consultar();
               for(Produto prod : lista){
                  out.write("<tr>");
                  out.write("<td>"+prod.getDescricao()+"</td>"); 
                  out.write("<td>"+prod.getPreco()+"</td>");  
                  out.write("</tr>");
               }
            %>
        </tbody>
    </table>
</body>
</html>