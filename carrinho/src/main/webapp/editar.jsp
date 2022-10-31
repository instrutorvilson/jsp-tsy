<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.carrinho.entidades.Produto" %>
<%@ page import="com.carrinho.dao.DaoProduto" %>

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
    <%
        String idproduto = request.getParameter("id");
        Produto p = DaoProduto.consultar(Integer.parseInt(idproduto));
    %>
    <div class="container">
        <form action="editar.jsp" method="POST">
            <label for="idproduto" class="form-label">Id</label>
            <input type="text" id="idproduto" 
                   name="id" 
                   placeholder="Informe descrição do produto"
                   class="form-control"
                   value="<%out.write(idproduto);%>"
                   readonly
                   />

             <label for="descricao" class="form-label">Descrição</label>
             <input type="text" id="descricao" 
                    name="descricao" 
                    placeholder="Informe descrição do produto"
                    class="form-control"
                    value="<%out.write(p.getDescricao());%>"
                    />

             <label for="preco">Preço</label>
             <input type="text" id="preco" 
                    name="preco" 
                    placeholder="Informe preço do produto" 
                    class="form-control"
                    value=<%out.write(""+p.getPreco());%>
                    />
            
            <label for="estoque">Estoque</label>
                    <input type="text" id="estoque" 
                           name="estoque" 
                           placeholder="Informe estoque do produto" 
                           class="form-control"
                           value=<%out.write(""+p.getEstoque());%>
                           />
             <label for="unidademedida">Selecione uma unidade de medida</label>    
             <select
                id="unidademedida"
                name="unidademedida"
                class="form-select"              
             >
                <option value="LT">Litros</option>
                <option value="KG">Kilos</option>
                <option value="PC">Peças</option>
             </select>           
             <button class="btn btn-primary mt-3">Gravar</button>
        </form>
    </div>
   
    <%
       if(request.getMethod() == "POST"){
        String descricao = request.getParameter("descricao");
        String preco = request.getParameter("preco");
        String estoque = request.getParameter("estoque");
        String unidademedida = request.getParameter("unidademedida");
       
         p.setDescricao(descricao);
            p.setPreco(Float.parseFloat(preco));
            p.setEstoque(Float.parseFloat(estoque));
            p.setUnidadeMedida(unidademedida);
            DaoProduto.alterar(p);
            response.sendRedirect("consulta.jsp");      
       }        
    %>
</body>
</html>