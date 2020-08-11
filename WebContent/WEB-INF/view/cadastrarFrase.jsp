<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <title>Digitando...</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
            <li role="presentation" class="active"><a href="home">Home</a></li>
            <li role="presentation"><a href="index.html">Como Jogar</a></li>
            <li role="presentation"><a href="localhost:8080/Digitando/cadastrarFrase">Cadastrar Frase</a></li>
        </ul>
    </nav>
    <div class="container">
    	<p>${msg }</p>
        <form action="/Digitando/cadastrarFrase">
        <h4>digite uma nova frase para ser inclusa no jogo: </h4>
         <input type="text" name="frase">
         <input type="submit">
        </form>
    </div>

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
