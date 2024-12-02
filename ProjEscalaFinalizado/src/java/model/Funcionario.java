
package model;

public class Funcionario {
    
    //VARIAVEIS    
    private int id;
    private String nome;
    private int cargaH;

    //METODOS GET
    
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public int getCargaH() {
        return cargaH;
    }

     //METODOS SET
    
    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCargaH(int cargaH) {
        this.cargaH = cargaH;
    }
    
}
