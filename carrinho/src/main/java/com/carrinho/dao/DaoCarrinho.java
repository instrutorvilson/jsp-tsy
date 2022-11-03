package com.carrinho.dao;

import com.carrinho.entidades.Carrinho;
import com.carrinho.entidades.Produto;
import com.carrinho.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCarrinho {
    public static String salvar(Carrinho carrinho){
        Connection con = Conexao.conectar();
        if(con != null){
           if(carrinho.getProduto().getEstoque() < carrinho.getQuantidade()) {
               return "Quantidade em estoque insuficiente";
           }
           String sql = "insert into carrinho(idproduto,quantidade, preco)values(?,?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1,carrinho.getProduto().getId());
                stm.setFloat(2,carrinho.getQuantidade());
                stm.setFloat(3, carrinho.getPreco());

                stm.execute();
                return "Item adicionado com sucesso";

            } catch (SQLException e) {
                return "Não foi possível inserir item no carrinho: " + e.getMessage();
            }
        }
        return "Erro de conexão";
    }

    public  static List<Carrinho> consultar(){
        Connection con = Conexao.conectar();
        List<Carrinho> lista = new ArrayList<Carrinho>();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from carrinho where status = 'A'");
                ResultSet rs = stm.executeQuery();
                while(rs.next()){
                    Carrinho c = new Carrinho();
                    c.setId(rs.getInt("id"));
                    c.setProduto(DaoProduto.consultar(rs.getInt("idproduto")));
                    c.setPreco(rs.getFloat("idproduto"));
                    c.setQuantidade(rs.getFloat("quantidade"));
                    lista.add(c);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }
}
