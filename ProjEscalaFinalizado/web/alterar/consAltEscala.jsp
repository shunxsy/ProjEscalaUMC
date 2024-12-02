
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Escala"%>
<%@page import="classeDAO.EscalaDAO"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>

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
        <%-- MENU ABAS --%>
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
              <a class="nav-link disabled text-dark" href="alterarFunc.html">Alterar Funcionário</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirFun.html">Excluir Funcionário</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirEscala.html">Excluir Escala</a>
            </li>
            </div>        
        
        <h1>Escala - Registro</h1>
        <%           
        //Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atrib de valor
            Escala esc = new Escala();
            esc.setIdEscala(id);
        
            //Select
            EscalaDAO escDAO = new EscalaDAO();
            if(escDAO.consIdEscala(esc) != null){
            %>
                <%-- Alteração de dados --%>
                <b>Dados a serem alterados:</b> <br>
                <form method="post" action="updateEscala.jsp">
                ID Escala:          <input type="text" name="id_escala" value="<%= esc.getIdEscala()%>" readonly="true"> <p>                    
                ID Funcionario:     <input type="text" name="id_func" value="<%= esc.getIdFunc()%>"> <p>
                Dia:                <input type="text" name="dia" value="<%= esc.getDia()%>"> <p>
                Nome Funcionário:   <input type="text" name="nome_funcionario" value="<%= esc.getNomeFunc()%>"> <p>
                Carga Horária:      <input type="text" name="carga_horaria" value ="<%= esc.getCargaH()%>" > <p>   
                Semana:             <input type="text" name="semana" value ="<%= esc.getSemana()%>" > <p>   
                Nome Escala:        <input type="text" name="nome_escala" value ="<%= esc.getNomeEsc()%>" > <p>
                
                <input type="submit" value="Salvar!"> 
                </form>
                               
            <%    
            }else{
               out.println("Registro não encontrado para o ID: " +esc.getIdEscala());
            }

        %>
    </body>
</html>
