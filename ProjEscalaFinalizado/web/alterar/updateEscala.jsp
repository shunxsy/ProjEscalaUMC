
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Escala"%>
<%@page import="classeDAO.EscalaDAO"%>

<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style> 
            .container{
            background-color: rgb(128,128,128);
        }  
            .container-fluid{
             background-color: rgb(128,128,128);
        }
      
        </style>
        <title>Alterar Escala</title>
    </head>
    <body>
         <div class="container-fluid p-2">
            <ul class="nav">
            <li class="nav-item ">
                
                <%-- MENU ABAS --%>
              <a class="nav-link disabled text-dark" href="../index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../cadastro/cadastroEsc.html">Criar Escala</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../cadastro/cadastroFun.html">Cadastro Funcionário</a>
            </li>   
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/conLista.html">Relatório - ESCALA</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/consGeralFuncionario.html">Relatório - FUNCIONÁRIO</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/consultaEscala.html">Consulta-ESCALA</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/consultaFuncionario.html">Consulta-FUNCIONÁRIO</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="alterarEscala.html">Alterar Escala</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="alterarFunc.html">Alterar Funcionário</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirFun.html">Excluir Funcionário</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirEscala.html">Excluir Escala</a>
            </li>
            </div>

        <h1>Alterar Escala</h1>
        <%
            
        //Entrada/Receber
        
        int idEscala = Integer.parseInt(request.getParameter("id_escala"));
        int idFunc = Integer.parseInt(request.getParameter("id_func"));        
        int dia = Integer.parseInt(request.getParameter("dia"));
        String nomeFunc = request.getParameter("nome_funcionario");
        int cargaH = Integer.parseInt(request.getParameter("carga_horaria"));           
        String semana = request.getParameter("semana");            
        String nomeEsc = request.getParameter("nome_escala");
        
        // Instância e atrib de valor
        Escala esc = new Escala();
        esc.setIdEscala(idEscala);
        esc.setIdFunc(idFunc);
        esc.setDia(dia);
        esc.setNomeFunc(nomeFunc);
        esc.setCargaH(cargaH);
        esc.setSemana(semana);
        esc.setNomeEsc(nomeEsc);
        
        //Insert         
        EscalaDAO escDAO = new EscalaDAO();
        if(escDAO.altEscala(esc)){
            out.println("Registro ALTERADO com sucesso!");
        }else{
           out.println("Erro! Registro não ALTERADO!!!");
           
               out.println("<br> ID Escala: " + esc.getIdEscala());
               out.println("<br> ID Funcionário: " + esc.getIdFunc());
               out.println("<br> Dia : " + esc.getDia());
               out.println("<br> Nome Funcionário: " + esc.getNomeFunc());
               out.println("<br> Carga Horária : " + esc.getCargaH());
               out.println("<br> Semana: " + esc.getSemana());
               out.println("<br> Nome Escala: " + esc.getNomeEsc());
        }
            
                    
        %>
    </body>
</html>
