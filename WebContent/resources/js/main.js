var tempoInicial = $("#tempo-digitacao").text();
var campo = $(".campo-digitacao");
var boolean = true;
var zera = false;

voltar();

$(function() {
    atualizaTamanhoFrase();
    inicializaContadores();
    inicializaCronometro();
    inicializaMarcadores();
    $("#botao-reiniciar").click(reiniciaJogo);
    atualizaPlacar();

    $("#usuarios").selectize({
        create: true,
        sortField: 'text'
    });

    $(".tooltip").tooltipster({
        trigger: "custom"
    });
});

function atualizaTempoInicial(tempo) {
    tempoInicial = tempo;
    $("#tempo-digitacao").text(tempo);
}

function atualizaTamanhoFrase() {
    var frase = $(".frase").text();
    var numPalavras  = frase.split(" ").length;
    var tamanhoFrase = $("#tamanho-frase");

    tamanhoFrase.text(numPalavras);
}

function inicializaContadores() {
    campo.on("input", function() {
        var conteudo = campo.val();

        var qtdPalavras = conteudo.split(/\S+/).length - 1;
        $("#contador-palavras").text(qtdPalavras);

        var qtdCaracteres = conteudo.length;
        $("#contador-caracteres").text(qtdCaracteres);
    });
}

function inicializaMarcadores() {
    campo.on("input", function() {
        var frase = $(".frase").text();
        var digitado = campo.val();
        var comparavel = frase.substr(0, digitado.length);

        if (digitado == comparavel) {
            campo.addClass("borda-verde");
            campo.removeClass("borda-vermelha");
            boolean = true;
        } else {
            campo.addClass("borda-vermelha");
            campo.removeClass("borda-verde");
            boolean = false;
        }
    });
}

function inicializaCronometro() {
    campo.one("focus", function() {
        var tempoRestante = $("#tempo-digitacao").text();
    	var cronometroID = setInterval(function() {
    		tempoRestante--;
    		$("#tempo-digitacao").text(tempoRestante);
    		if (tempoRestante < 1) {
                clearInterval(cronometroID);
                finalizaJogo();
    		}
    	}, 1000);
    });
}

function finalizaJogo() {
    campo.attr("disabled", true);
    var botao = document.getElementById("next");
    var rank = document.getElementById("rank");
    var frase = document.getElementById("frase").value;
    var nome = document.getElementById("usuarios").value;
    pontos();
    var ponto = document.getElementById("pontos").innerHTML;
    rank.setAttribute("href", "trocaFrase?id="+frase+"&nome="+nome+"&pontos="+ponto);
    campo.toggleClass("campo-desativado");
    if(Number(ponto) >= 60){
	    if(boolean){
	    	botao.removeAttribute("disabled");
	    	zera = true;
	    }
    }
    inserePlacar();
}

function reiniciaJogo() {
    campo.attr("disabled", false);
    campo.val("");
    $("#contador-palavras").text(0);
    $("#contador-caracteres").text(0);
    $("#tempo-digitacao").text(tempoInicial);
    inicializaCronometro();
    campo.toggleClass("campo-desativado");
    campo.removeClass("borda-vermelha");
    campo.removeClass("borda-verde");
}

function aumentar(){
    var valorPonto = document.getElementById("valorPonto");
    var tempo = document.getElementById("tempo-digitacao");
    var tempoAtual = Number(tempo.innerHTML);
    console.log(tempoAtual + 10);
    if(tempoAtual >= 15 && tempoAtual < 60 && tempoAtual != 30){
        tempo.innerHTML = 30;
        valorPonto.value =  1;
        console.log(valorPonto.value);
    }else if(tempoAtual == 30){
        tempo.innerHTML = 60;
        valorPonto.value =  2;
        console.log(valorPonto.value);
    }else{
        tempo.innerHTML = 15;
        valorPonto.value =  0;
        console.log(valorPonto.value);
    }
    
}

function pontos(){
    var valorPonto = document.getElementById("valorPonto");
    var pontos = document.getElementById("pontos");
    var palavras = document.getElementById("contador-palavras");
    var caracteres = document.getElementById("contador-caracteres");
    var valor = Number(valorPonto.value);
    console.log(valor);

    var pontosTotal = 0;

    if(valor == 1){
        pontosTotal = Number(palavras.innerHTML) + Number(caracteres.innerHTML) - (Number(palavras.innerHTML * valor));
    }else if(valor == 2){
        pontosTotal = Number(palavras.innerHTML) + Number(caracteres.innerHTML) - (Number(palavras.innerHTML * 4));
    }else{
        pontosTotal = Number(palavras.innerHTML) + Number(caracteres.innerHTML) + (Number(palavras.innerHTML * 2));
    }

    if (pontosTotal < 0) {
        pontos.innerHTML = 0;
    }else{
      pontos.innerHTML = pontosTotal;  
    }

    
}


function zerar(){
	var botao = document.getElementById("next");
	if(zera){
		botao.setAttribute("disabled", "true");
	}
	
	var pontos = document.getElementById("pontos");
	pontos.innerHTML = 0;
}

function voltar(){
	var valor = document.getElementById("valorFraseVoltar");
	var voltar = document.getElementById("voltar");
	console.log(valor);
	if(valor.value > 1){
		voltar.removeAttribute("disabled");
	}
}