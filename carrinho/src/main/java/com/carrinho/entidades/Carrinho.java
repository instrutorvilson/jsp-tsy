package com.carrinho.entidades;

public class Carrinho {
    private int id;
    private Produto produto;
    private Float quantidade;
    private Float preco;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Float getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Float quantidade) {
        this.quantidade = quantidade;
    }

    public Float getPreco() {
        return preco;
    }

    public void setPreco(Float preco) {
        this.preco = preco;
    }

    public Carrinho() {
    }
    public Carrinho(Produto produto, Float quantidade, Float preco) {
        this.produto = produto;
        this.quantidade = quantidade;
        this.preco = preco;
    }
}
