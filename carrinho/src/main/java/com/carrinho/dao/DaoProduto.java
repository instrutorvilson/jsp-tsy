package com.carrinho.dao;

import com.carrinho.entidades.Produto;
import com.carrinho.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProduto {
    public static List<Produto> produtos = new ArrayList<Produto>();

    public static String salvar(Produto prod){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "insert into produto(descricao,preco)" +
                    "values(?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,prod.getDescricao());
                stm.setFloat(2,prod.getPreco());

                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso";
        }
        return "erro de conexão";
    }

    public  static List<Produto> consultar(){
        List<Produto> lista = new ArrayList<Produto>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from produto");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Produto p = new Produto();
                    p.setDescricao(rs.getString("descricao"));
                    p.setPreco(rs.getFloat("preco"));
                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }
}
