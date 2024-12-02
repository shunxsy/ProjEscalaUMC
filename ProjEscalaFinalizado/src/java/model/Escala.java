
package model;

public class Escala {
    
    //VARIAVEIS
    private int idEscala;
    private int idFunc;
    private int dia;
    private String nomeFunc;
    private int cargaH;
    private String semana;
    private String nomeEsc;

    //METODOS GET

    public int getIdEscala() {
        return idEscala;
    }
    public int getIdFunc() {
        return idFunc;
    }

    public int getDia() {
        return dia;
    }

    public String getNomeFunc() {
        return nomeFunc;
    }

    public int getCargaH() {
        return cargaH;
    }

    public String getSemana() {
        return semana;
    }

    public String getNomeEsc() {
        return nomeEsc;
    }

  

    //METODOS SET
    public void setIdEscala(int idEscala) {
        this.idEscala = idEscala;
    }
    public void setIdFunc(int idFunc) {
        this.idFunc = idFunc;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public void setNomeFunc(String nomeFunc) {
        this.nomeFunc = nomeFunc;
    }

    public void setCargaH(int cargaH) {
        this.cargaH = cargaH;
    }

    public void setSemana(String semana) {
        this.semana = semana;
    }

    public void setNomeEsc(String nomeEsc) {
        this.nomeEsc = nomeEsc;
    }

    public String getNome() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
