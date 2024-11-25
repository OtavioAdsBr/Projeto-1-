programa
{	//variaveis globais são definidas fora de uma função e que podem ser acessadas por qualquer função na linguagem de programação.
	caracter jogo[3][3]
	inteiro l, c, linha, coluna, opcaoMenu
	cadeia nomeJogador1 = "Jogador 1", nomeJogador2 = "Jogador 2"
	

	funcao menuJogo(){
		escreva("\nMENU INICIAL\n")
		escreva(" 1. Jogar uma partida\n 2. Escolher nomes dos jogadores\n 3. Placar Atual\n")
		escreva(" 4. Estatísticas gerais\n 5. Sair do Programa\n\n")
		leia(opcaoMenu)
	}

	funcao inicializarJogo(){
		para(l = 0; l < 3; l++){
			para(c = 0; c < 3; c++)
				jogo[l][c] = ' '
		}
  	}
  	
  	// funcao imprimir jogo 
  	funcao imprimirJogo(){
		escreva("\n\n 0   1    2\n\n")
		para(l = 0; l < 3; l++){
			para(c = 0; c < 3; c++){
				escreva(" ", jogo[l][c])
				se(c < 2)
					escreva(" | ")
				se(c == 2)
					escreva("  ", l)
			}
				se(l < 2)
					escreva("\n------------")
				escreva("\n")			
  		}
  	}
  	
  	//funcao ler coordenadas
  	funcao lerCoordenadas(inteiro jogador){
  		faca{
			faca{
				se(jogador == 1)
					escreva("\n",nomeJogador1, ", digite linha e coluna da posição desejada: ")
				senao
					escreva("\n", nomeJogador2, ",digite linha e coluna da posição desejada: ")
				leia(linha, coluna)
			}enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
		}enquanto(jogo[linha][coluna] != ' ')
  	}

  	//funcao para atualizar jogador 
	funcao inteiro atualizarJogador(inteiro jogador){
		se(jogador == 1)
			jogador = 2 
		senao 
			jogador = 1 
		retorne jogador 	
	}
  	
  	//funcao salvar jogadas
  	funcao inteiro salvarJogada(inteiro jogador){
  		se(jogador == 1)
			jogo[linha][coluna] = '0'
		senao
			jogo[linha][coluna] = 'X'
		retorne 1 
  	}
  	
  	//funcao que verifica se o jogador ganhou por linha
  	funcao inteiro ganhouPorLinha(caracter k){
  		para(l = 0; l < 3; l++){
			se(jogo[l][0] == k e jogo[l][1] == k e jogo[l][2] == k)
				retorne 1 // jogador ganhou
		}
		retorne 0 // jogador não ganhou
  	}
  	
  	//funcao que utiliza a funcao anterior para os dois jogadores 
	funcao inteiro ganhouPorLinhas(){
		se(ganhouPorLinha('0') == 1)
			retorne 1 // jogador 1 ganhou
			
		se(ganhouPorLinha('X') == 1)
			retorne 2 // jogador 2 ganhou
		retorne 0 // ninguem ganhou
	}
  
	// funcao que verifica se o jogador ganhou por coluna
	funcao inteiro ganhouPorColuna(caracter s){
		para(c = 0; c < 3; c++){
			se(jogo[0][c] == s e jogo[1][c] == s e jogo[2][c] == s)
				retorne 1 // jogador ganhou 
		}
		retorne 0 // ninguem ganhou
	}
	
	//funcao que faz uso da funcao anterior para verificar vitoria em todas as colunas
	funcao inteiro ganhouPorColunas(){
		se(ganhouPorColuna('0') == 1)
			retorne 1 // jogador 1 venceu 
		se(ganhouPorColuna('X') == 1)
			retorne 2 // jogador 2 venceu 
		retorne 0 // ninguem venceu ainda
	}
	
	// funcao que verifica se o jogador ganhou na diagonal principal
	funcao inteiro ganhouDiagPrincipal(caracter s){
		se(jogo[0][0] == s e jogo[1][1] == s e jogo[2][2] == s)
			retorne 1
		retorne 0 
	}
	
	// funcao que retorna quem foi o ganhador
	funcao inteiro ganhadorDiagPrincipal(){
		se(ganhouDiagPrincipal('0') == 1)
			retorne 1 //jogador 1 venceu
		se(ganhouDiagPrincipal('X') == 1)
			retorne 2 //jogador 2 venceu
    		retorne 0 // ninguem venceu ainda
	}
	
	// funcao que verifica se o jogador ganhou na diagonal secundaria
	funcao inteiro ganhouDiagSecundaria(caracter s){
		se(jogo[0][2] == s e jogo[1][1] == s e jogo[2][0] == s)
			retorne 1
		retorne 0 
	}

	// funcao que retorna quem foi o ganhador
	funcao inteiro ganhadorDiagSecundaria(){
		se(ganhouDiagSecundaria('0') == 1)
			retorne 1 //jogador 1 venceu
		se(ganhouDiagPrincipal('X') == 1)
			retorne 2 //jogador 2 venceu
    		retorne 0 // ninguem venceu ainda
	}

	//funcao para o loop do jogo 
	funcao inteiro jogoPrincipal(inteiro jogador, inteiro jogadas, inteiro ganhou){
		faca{
				 	
			imprimirJogo()// o que será mostrado no tabuleiro	
			lerCoordenadas(jogador)// lendo as coordenadas

			// salvar as coordenadas
			jogadas += salvarJogada(jogador)
			jogador = atualizarJogador(jogador)

			ganhou += ganhouPorLinhas()// verificar o ganhador por linhas		
			ganhou += ganhouPorColunas()// verificar o ganhador por colunas	        				
			ganhou += ganhadorDiagPrincipal()// verificar ganhador da diagonal principal    	        				
			ganhou += ganhadorDiagSecundaria()// verificar ganhador da diagonal secundária
		}enquanto(ganhou == 0 e jogadas < 9)
		retorne ganhou
	}
	
	
	funcao inicio(){
		
    		inteiro jogador, ganhou, jogadas, ganhosJogador1 = 0, ganhosJogador2 = 0
    		cadeia nome

		faca{
			menuJogo()
			
			se(opcaoMenu == 1){
				faca{
					jogador = 1
					ganhou = 0 
					jogadas = 0
					
	      			inicializarJogo()

		  			ganhou = jogoPrincipal(jogador, jogadas, ganhou)
	  
	      			// o que será mostrado no tabuleiro
	      			imprimirJogo()
	  
	      			se(ganhou == 1)
	        				escreva("\n\tParabéns Jogador 1. Você ganhou!\n\n")
	
	      			se(ganhou == 2)
	        				escreva("\n\tParabéns Jogador 2. Você ganhou!\n\n")
	  
	    				}enquanto(ganhou == 0 e jogadas < 9)
	    		menuJogo() //voltar ao menu após o fim do jogo
			} 
			
			//nomes jogadores
			se(opcaoMenu == 2){ 
				para(jogador = 1; jogador <=2; jogador++){
					se(jogador==1){										
						escreva("Digite o nome para o Jogador 1: \n")
						leia(nomeJogador1)
					}senao{
						escreva("Digite o nome para o Jogador 2: \n")
						leia(nomeJogador2)
					}
				}
			menuJogo()
			}
			
			
			se(opcaoMenu == 3){
			   escreva("\n Placar Atual\n")
			   escreva("Jogador 1 = ", ganhosJogador1, "\n")
			   escreva("Jogador 2 = ", ganhosJogador2, "\n")
			menuJogo()
			}
			

			se(opcaoMenu == 4){
				escreva("\n\n Estatísticas Gerais\n\n")
				
				escreva("Jogador que mais venceu: ")
				escreva("Sua taxa de vitorias: ")

				
				escreva("Quantidade de vitorias no jogo")

				escreva("Porcentagem de jogos finalizados em 'velha': ")

			 	
			}
			
		}enquanto(opcaoMenu == 1 e opcaoMenu <5)
	}
				
}
	

	
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5548; 
 * @DOBRAMENTO-CODIGO = [5, 12, 20, 37, 47, 56, 65, 74, 84, 93, 102, 109, 118, 125, 134];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6502; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */