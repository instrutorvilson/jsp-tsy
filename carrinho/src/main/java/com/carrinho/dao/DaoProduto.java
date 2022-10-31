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
                    p.setId(rs.getInt("id"));
                    p.setDescricao(rs.getString("descricao"));
                    p.setPreco(rs.getFloat("preco"));
                    p.setEstoque(rs.getFloat("estoque"));
                    p.setUnidadeMedida(rs.getString("unidademedida"));
                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static Produto consultar(int idProduto){
        Connection con = Conexao.conectar();
        Produto p = new Produto();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from produto where id = ?");
                stm.setInt(1,idProduto);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    p.setId(rs.getInt("id"));
                    p.setDescricao(rs.getString("descricao"));
                    p.setPreco(rs.getFloat("preco"));
                    p.setEstoque(rs.getFloat("estoque"));
                    p.setUnidadeMedida(rs.getString("unidademedida"));
                }
            } catch (SQLException e) {
                return p;
            }
        }
        return p;
    }

    public static String alterar(Produto p){
       Connection con = Conexao.conectar();
       if(con != null){
          String sql = "update produto set "+
                       "descricao = ?, preco = ?, "+
                       "estoque = ?, unidademedida = ? " +
                       " where id = ?";
           try {
               PreparedStatement stm = con.prepareStatement(sql);
               stm.setString(1, p.getDescricao());
               stm.setFloat(2, p.getPreco());
               stm.setFloat(3, p.getEstoque());
               stm.setString(4, p.getUnidadeMedida());
               stm.setInt(5, p.getId());
               stm.execute();
                return "Registro alterado com sucesso.";
           } catch (SQLException e) {
               return "Não foi possivel alterar registro";
           }
       }
       return "erro de conexão";
    }
}
