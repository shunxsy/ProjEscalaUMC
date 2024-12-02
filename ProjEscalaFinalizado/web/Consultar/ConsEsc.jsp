<%-- 
    Document   : ConsEsc
    Created on : 27 de nov. de 2024, 19:09:08
    Author     : Bruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Escala"%>
<%@page import="classeDAO.*"%>
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
        <title>Consulta Escala</title>
    </head>
    <body>
         <div class="container-fluid p-2">
            <ul class="nav">
            <li class="nav-item ">
              <a class="nav-link disabled text-dark" href="../index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../cadastro/cadastroEsc.html">Criar Escala</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../cadastro/cadastroFun.html">Cadastro Funcionário</a>
            </li>   
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="conLista.html">Relatório - ESCALA</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="consGeralFuncionario.html">Relatório - FUNCIONÁRIO</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="consultaFuncionario.html">Consulta - FUNCIONÁRIO</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../alterar/alterarFunc.html">Alterar Funcionário</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../alterar/alterarEscala.html">Alterar Escala</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirFun.html">Excluir Funcionário</a>
            </li>
             <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirEscala.html">Excluir Escala</a>
            </li>
        </div>
        <h1>Consulta Escala - Registro</h1>
        <%           
        //Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atrib de valor
            Escala esc = new Escala();
            esc.setIdEscala(id);
        
            //Select
            EscalaDAO escDAO = new EscalaDAO();
            if(escDAO.consIdEscala(esc) != null){
            
                out.println("<br> <b>Lista de Escalas</b> <br>");
                out.println("<br> ID Escala: " + esc.getIdEscala());
                out.println("<br> ID Funcionário: " + esc.getIdFunc());
                out.println("<br> Dia : " + esc.getDia());
                out.println("<br> Nome Funcionário: " + esc.getNomeFunc());
                out.println("<br> Carga Horária : " + esc.getCargaH());
                out.println("<br> Semana: " + esc.getSemana());
                out.println("<br> Nome Escala: " + esc.getNomeEsc());
            }else{
               out.println("Registro não encontrado!!!");
            }           

        %>
    </body>
</html>
