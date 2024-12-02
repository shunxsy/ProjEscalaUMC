
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classeDAO.EscalaDAO"%>
<%@page import="model.Escala"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro Escala</title>
           <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style> 
            .container{
            background-color: rgb(128,128,128);
        }  
            .container-fluid{
             background-color: rgb(128,128,128);
        }      
        </style>

    </head>
    <body>
        
        <%-- MENU ABAS --%>
         <div class="container-fluid p-2">
            <ul class="nav">
            <li class="nav-item ">
              <a class="nav-link disabled text-dark" href="../index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="cadastro/cadastroFun.html">Cadastro Funcionário</a>
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
              <a class="nav-link disabled text-dark" href="../alterar/alterarEscala.html">Alterar Escala</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../alterar/alterarFunc.html">Alterar Funcionário</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirFun.html">Excluir Funcionário</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirEscala.html">Excluir Escala</a>
            </li>              
         </div>
    </head>
    <body>
        <%
        
            try{
        // Variaveis Escala
        int idEscala = Integer.parseInt(request.getParameter("idEsc"));
        int idFunc = Integer.parseInt(request.getParameter("idFun"));
        int dia = Integer.parseInt(request.getParameter("dia"));
        String nomeFunc = request.getParameter("nomeF");
        int cargaH = Integer.parseInt(request.getParameter("cargaH"));
        String semana = request.getParameter("semana");
        String nomeEsc = request.getParameter("nomeE");
            

        // Instância e atrib de valor
        Escala cadE = new Escala();
        cadE.setNomeEsc(nomeEsc);
        cadE.setIdEscala(idEscala);
        cadE.setDia(dia);
        cadE.setSemana(semana);
        cadE.setNomeFunc(nomeFunc);
        cadE.setIdFunc(idFunc);
        cadE.setCargaH(cargaH);
            
        
        
        
        //Insert
        EscalaDAO escDAO = new EscalaDAO();
        if(escDAO.cadEsc(cadE)){
            out.println("Cadastro realizado com sucesso!");
        }else{
           out.println("<b>Não foi possível realizar o cadastro!<br><b>");
           out.println("<b>Tente novamente!<b>");
           
        }
        
}   catch (Exception e) {
                out.println(e.getMessage());
            }
        %>
    </body>
</html>