<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <title>Digitando...</title>
    
    <link rel="stylesheet" href="resources/css/footer-with-logo.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="resources/css/libs/materialize.min.css">
    <link rel="stylesheet" href="resources/css/libs/google-fonts.css">
    <link rel="stylesheet" href="resources/css/libs/selectize.default.css">
    <link rel="stylesheet" href="resources/css/libs/tooltipster.bundle.min.css" />
    <link rel="stylesheet" href="resources/css/estilos.css">
    <script src="resources/js/main.js"></script>
</head>
<body>
    <nav style="background-color:#19ab0ff2 ">
        <ul class="nav nav-pills">
            <li role="presentation" class="active"><a href="redirect:/">Home</a></li>
            <li role="presentation"><a href="comoJogar">Como Jogar</a></li>
        </ul>
    </nav>
    <div class="container">
        <h1 class="center" style="color:#19ab0ff2">digitando...</h1>
        <p class="frase center">${frase.frase }</p>

        <div class="center">
            <img src="img/spinner.gif" alt="Spinner" id="spinner">
            <p id="erro">Ocorreu um erro, por favor tente novamente</p>
        </div>

        <ul class="informacoes center">
            <li>
                <i class="small material-icons icones">description</i>
                <span id="tamanho-frase">5</span> palavras
            </li>
            <li>
                <i class="small material-icons icones">query_builder</i>
                <span id="tempo-digitacao">15</span> segundos
                  <a onclick="aumentar()" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
				  <input type="hidden" name="valorPonto" id="valorPonto">
            </li>
            <li><h5>Faça 60 pontos</h5></li>
        </ul>

        <textarea class="campo-digitacao" rows="8" cols ="40" onpaste="return false"></textarea>

        <div class="botoes">
        <input type="hidden" value="${frase.id }" id="valorFraseVoltar">
            <a onclick="zerar()" id="botao-reiniciar" class="btn-floating btn-large waves-effect waves-light red">
                <i class="material-icons">restore</i>
            </a>
            <a id="" href="voltar?id=${frase.id }">
            <button  id="voltar" disabled   class="btn-floating btn-large waves-effect waves-light green">
                <i class="material-icons">skip_previous</i>
            </button>
            </a>
            
            <a id="rank">
            <button  id="next" disabled   class="btn-floating btn-large waves-effect waves-light blue">
                <i class="material-icons">skip_next</i>
            </button>
            </a>
			avançar
            
        </div>

        <ul class="center">
            <li><span id="contador-caracteres">0</span> caracteres</li>
            <li><span id="contador-palavras">0</span> palavras</li>
            <li><span id="pontos" >0</span> pontos</li>
        </ul>
        
        <div class="select-usuarios" class="container">
                <form>
                    <h4>Digite seu nome: </h4><input type="text" name="nome" id="usuarios" value="sem-nome">
                    <input id="frase" type="hidden" name="frase" value="${frase.id}">
                </form>
         </div>

        <section>
            <h3 class="center">Top 10</h3>
            <table class="centered bordered">
                
                    <tr>
                        <th>Nome</th>
                        <th>Pontos</th>
                    </tr>
                
                <tbody>
                	
                		<c:forEach items="${jogadores }" var="jogador">
                		<tr>
					 		<th>${jogador.nome }</th>
                     		<th>${jogador.pontos }</th>
                     	 </tr>
                     	</c:forEach>
                    
                </tbody>
            </table>
        </section>
    </div>    
        <!--   mmmmmmmmmmmmmmmmmmmmmmmmmmm -->
        <div class="content">
</div>
    <footer id="myFooter">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h5>Contato</h5>
                    <ul>
                        <li><a href="#">Email: luizferbarbosaap@gmail.com</a></li>
                        <a href="https://www.linkedin.com/in/luiz-fer-desenvolvedor/" class="instagram">Perfil no linkedin <i class="fa fa-linkedin-square"></i></a>
                    </ul>
                </div>
            
                <div class="col-sm-3 info">
                    <h5>Informações</h5>
                    <p>Esse projeto foi desenvolvido apenas para fins de estudo, sou estudante na área de desenvolvimento de software. A idéia do jogo em si foi baseado no projeto de um curso sobre jquery que fiz no
                    <a href="https://cursos.alura.com.br/">Alura.</a>  </p>
                </div>
            </div>
        </div>
        <div class="second-bar">
           <div class="container">
                <div class="social-icons">
                    <a href="https://www.linkedin.com/in/luiz-fer-desenvolvedor/" class="instagram">Luiz Fernando <i class="fa fa-linkedin-square"></i></a>
                </div>
            </div>
        </div>
    </footer>

    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/materialize.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script src="resources/js/placar.js"></script>
    <script src="resources/js/frase.js"></script>
    <script src="resources/js/selectize.js"></script>
    <script src="resources/js/tooltipster.bundle.min.js"></script>
    <script src="resources/https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="resources/https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="resources/https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>
</html>
