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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
    <table class="table">
        <thead>
            <tr>
                <th>Id</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Estoque</th>
                <th>Unidades</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
               List<Produto> lista = DaoProduto.consultar();
               for(Produto prod : lista){
                  out.write("<tr>");
                  out.write("<td>"+prod.getId()+"</td>");
                  out.write("<td>"+prod.getDescricao()+"</td>"); 
                  out.write("<td>"+prod.getPreco()+"</td>");
                  out.write("<td>"+prod.getEstoque()+"</td>");
                  out.write("<td>"+prod.getUnidadeMedida()+"</td>");
                  out.write("<td><a class='me-2' href='editar.jsp?id="+prod.getId()+"'>Editar</a><a href='excluir.jsp?id="+prod.getId()+"'>Excluir</a></td>");
                  out.write("</tr>");
               }
            %>
        </tbody>
    </table>
</body>
</html>