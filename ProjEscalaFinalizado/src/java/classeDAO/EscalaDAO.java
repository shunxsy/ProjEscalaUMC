

package classeDAO;

import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Escala;
import util.ConexaoBD;



public class EscalaDAO {
        //MÉTODO CADASTRAR
 public boolean cadEsc(Escala cadEsc) throws ClassNotFoundException {
    Connection conexao = null;
    PreparedStatement stmt = null;
    try {
        conexao = ConexaoBD.conectar();
        String sql = "INSERT INTO escala (id_escala, id_func, dia, nome_funcionario, carga_horaria, semana, nome_escala) VALUES (?, ?, ?, ?, ?, ?,?)";
        
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, cadEsc.getIdEscala());
        stmt.setInt(2, cadEsc.getIdFunc());
        stmt.setInt(3, cadEsc.getDia()); 
        stmt.setString(4, cadEsc.getNomeFunc()); 
        stmt.setInt(5, cadEsc.getCargaH()); 
        stmt.setString(6, cadEsc.getSemana()); 
        stmt.setString(7, cadEsc.getNomeEsc()); 
        
        
        stmt.executeUpdate(); // Executar o insert
        return true;
    } catch (SQLException ex) {
        System.out.println("Erro: " + ex);
        return false;
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conexao != null) conexao.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao fechar recursos: " + ex);
        }
    }
}

        //MÉTODO EXCLUIR
public boolean delEsc(Escala p_esc) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConexaoBD.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "DELETE from escala WHERE id = " + p_esc.getIdEscala();
            stmt.executeUpdate(sql); 
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }

        //MÉTODO CONSULTAR POR ID
public Escala consIdEscala(Escala p_esc) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConexaoBD.conectar();
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM escala where id_escala = '" + p_esc.getIdEscala()+ "'";
            
            ResultSet rs = stmt.executeQuery(sql); 
            
            int n_reg = 0;
            while (rs.next()) {                 
                
                p_esc.setIdFunc(rs.getInt("id_func"));                
                p_esc.setDia(rs.getInt("dia"));                
                p_esc.setNomeFunc(rs.getString("nome_funcionario"));                
                p_esc.setCargaH(rs.getInt("carga_horaria"));
                p_esc.setSemana(rs.getString("semana"));
                p_esc.setNomeEsc(rs.getString("nome_escala"));
                
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_esc;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }
        
        //MÉTODO ALTERAR DADOS
    public boolean altEscala(Escala p_esc) throws ClassNotFoundException{
        Connection conexao = null;
        PreparedStatement pstmt = null;
        try{
            conexao = ConexaoBD.conectar();             
            
            String sql = "UPDATE escala SET id_func= ?,dia=?,nome_funcionario =?, carga_horaria = ?, semana = ?, nome_escala = ? WHERE id_escala = ?";                                            
            pstmt = conexao.prepareStatement(sql);
            
            //Valores parametros
            
        pstmt.setInt(1, p_esc.getIdFunc()); // id_func
        pstmt.setInt(2, p_esc.getDia()); // dia
        pstmt.setString(3, p_esc.getNomeFunc()); // nome_funcionario
        pstmt.setInt(4, p_esc.getCargaH()); // cargaH
        pstmt.setString(5, p_esc.getSemana()); // semana
        pstmt.setString(6, p_esc.getNomeEsc()); // nome_func     

        pstmt.setInt(7, p_esc.getIdEscala());          // id_escala
            
            pstmt.executeUpdate();
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        } finally {
            try{
                if (pstmt != null)      pstmt.close();
                if (conexao != null)    conexao.close();
            } catch (SQLException ex){
                ex.printStackTrace();
            }
        }
        return true;
    } 
    
        //MÉTODO CONSULTAR LISTA        
 public List consEscLista() throws ClassNotFoundException{        
        List lista = new ArrayList(); // Minha Lista querida!
        Connection conexao = null;
        try{
            conexao = ConexaoBD.conectar();     
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM escala";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {
                Escala p_esc = new Escala();
                p_esc.setIdEscala(rs.getInt("id_escala")); 
                p_esc.setIdFunc(rs.getInt("id_func"));                
                p_esc.setDia(rs.getInt("dia"));                
                p_esc.setNomeFunc(rs.getString("nome_funcionario"));                
                p_esc.setCargaH(rs.getInt("carga_horaria"));
                p_esc.setSemana(rs.getString("semana"));
                p_esc.setNomeEsc(rs.getString("nome_escala")); 
                lista.add(p_esc);
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    } 
}
