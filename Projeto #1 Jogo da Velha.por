programa
{		
	// Variáveis globais
	// A matriz "jogo" representa o tabuleiro de 3x3, onde cada célula é um caractere (O, X ou espaço).
	caracter jogo[3][3] 
	// Variáveis para controlar as posições das linhas e colunas.
	inteiro l, c, linha, coluna 
	// Variável para armazenar a opção do menu escolhido pelo jogador.
	inteiro opcaoMenu
	// Nomes dos jogadores. Jogador 1 inicia como "Jogador 1" e Jogador 2 como "Jogador 2".
	cadeia nomeJogador1 = "Jogador 1", nomeJogador2 = "Jogador 2", maiorVencedor = ""
	// Contadores de vitórias e jogos. "vitoriasMaiorVencedor" mantém o número de vitórias do maior vencedor.
	inteiro vitoriasMaiorVencedor = 0, totalJogos = 0, jogosVelha = 0
	// Contadores de vitórias individuais para cada jogador.
	inteiro ganhosJogador1 = 0, ganhosJogador2 = 0

	// Função para exibir o menu inicial
	funcao menuJogo(){
		escreva("\nMENU INICIAL\n")
		escreva(" 1. Jogar uma partida\n 2. Escolher nomes dos jogadores\n 3. Placar Atual\n")
		escreva(" 4. Estatísticas gerais\n 5. Sair do Programa\n\n")
		leia(opcaoMenu)
	}

	// Função para inicializar o tabuleiro
	funcao inicializarJogo(){
		para(l = 0; l < 3; l++){
			para(c = 0; c < 3; c++)
				jogo[l][c] = ' '
		}
	}

	// Função para imprimir o layout do jogo
funcao imprimirLayout(inteiro jogadorAtual){
    escreva("\n==========================================")
    escreva("\n            JOGO DA VELHA")
    escreva("\n==========================================\n")
    escreva("Jogadores: ")
    escreva("\n  Jogador 1: ", nomeJogador1, "   (O)")
    escreva("\n  Jogador 2: ", nomeJogador2, "   (X)")
    escreva("\n==========================================")
    escreva("\n                 TABULEIRO")
    escreva("\n     0     1     2\n")
    
    // Laços para imprimir as linhas e colunas do tabuleiro.
    para(l = 0; l < 3; l++){
        escreva("  ", l, "  ")
        para(c = 0; c < 3; c++){
            escreva(" ", jogo[l][c]) // Aqui imprimimos o valor armazenado na matriz
            se(c < 2)
                escreva("  |") // Separador de colunas
        }
        escreva("\n")
        se(l < 2)
            escreva("   --------------------\n") // Separador de linhas
    }

    escreva("\n==========================================")
    escreva("\nJogador Atual: ")
    se(jogadorAtual == 1)
        escreva(nomeJogador1, " (O)")
    senao
        escreva(nomeJogador2, " (X)")
    escreva("\n==========================================")
}

	


	// Função para ler as coordenadas do jogador
	funcao lerCoordenadas(inteiro jogador){
		faca{
			faca{
				se(jogador == 1)
					escreva("\n",nomeJogador1, ", digite linha e coluna da posição desejada: ")
				senao
					escreva("\n", nomeJogador2, ", digite linha e coluna da posição desejada: ")
				leia(linha, coluna)
			} enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
		} enquanto(jogo[linha][coluna] != ' ')
	}

	// Função para alternar o jogador
	funcao inteiro atualizarJogador(inteiro jogador){
		se(jogador == 1)
			jogador = 2 
		senao 
			jogador = 1 
		retorne jogador 	
	}

	// Função para salvar a jogada
	funcao inteiro salvarJogada(inteiro jogador){
		se(jogador == 1)
			jogo[linha][coluna] = 'O'
		senao
			jogo[linha][coluna] = 'X'
		retorne 1 
	}

	// Funções de verificação de vitória
	funcao inteiro ganhouPorLinha(caracter k){
		para(l = 0; l < 3; l++){
			se(jogo[l][0] == k e jogo[l][1] == k e jogo[l][2] == k)
				retorne 1 
		}
		retorne 0 
	}

	funcao inteiro ganhouPorLinhas(){
		se(ganhouPorLinha('O') == 1)
			retorne 1 
		se(ganhouPorLinha('X') == 1)
			retorne 2 
		retorne 0 
	}

	funcao inteiro ganhouPorColuna(caracter s){
		para(c = 0; c < 3; c++){
			se(jogo[0][c] == s e jogo[1][c] == s e jogo[2][c] == s)
				retorne 1 
		}
		retorne 0 
	}

	funcao inteiro ganhouPorColunas(){
		se(ganhouPorColuna('O') == 1)
			retorne 1 
		se(ganhouPorColuna('X') == 1)
			retorne 2 
		retorne 0 
	}

	funcao inteiro ganhouDiagPrincipal(caracter s){
		se(jogo[0][0] == s e jogo[1][1] == s e jogo[2][2] == s)
			retorne 1
		retorne 0 
	}

	funcao inteiro ganhadorDiagPrincipal(){
		se(ganhouDiagPrincipal('O') == 1)
			retorne 1 
		se(ganhouDiagPrincipal('X') == 1)
			retorne 2 
		retorne 0 
	}

	funcao inteiro ganhouDiagSecundaria(caracter s){
		se(jogo[0][2] == s e jogo[1][1] == s e jogo[2][0] == s)
			retorne 1
		retorne 0 
	}

	funcao inteiro ganhadorDiagSecundaria(){
		se(ganhouDiagSecundaria('O') == 1)
			retorne 1 
		se(ganhouDiagSecundaria('X') == 1)
			retorne 2 
		retorne 0 
	}

	// Função para exibir as estatísticas gerais
	funcao estatisticasGerais(){
		escreva("\nEstatísticas Gerais\n")
		escreva("Total de jogos: ", totalJogos, "\n")
		escreva("Jogos Empatados: ", jogosVelha, "\n")
		escreva("Vitórias do ", nomeJogador1, ": ", ganhosJogador1, "\n")
		escreva("Vitórias do ", nomeJogador2, ": ", ganhosJogador2, "\n")
		escreva("Maior Vencedor: ", maiorVencedor, " com ", vitoriasMaiorVencedor, " vitórias\n")
	}

	// Loop principal do jogo
	funcao inteiro jogoPrincipal(inteiro jogador, inteiro jogadas, inteiro ganhou){
		faca{
			imprimirLayout(jogador) 
			lerCoordenadas(jogador)
			jogadas += salvarJogada(jogador)
			jogador = atualizarJogador(jogador)

			ganhou += ganhouPorLinhas()
			ganhou += ganhouPorColunas()
			ganhou += ganhadorDiagPrincipal()
			ganhou += ganhadorDiagSecundaria()
		} enquanto(ganhou == 0 e jogadas < 9)

		// Atualizar estatísticas globais
		se(ganhou == 1) {
			ganhosJogador1++
			se(ganhosJogador1 > vitoriasMaiorVencedor) {
				maiorVencedor = nomeJogador1
				vitoriasMaiorVencedor = ganhosJogador1
			}
		} senao se(ganhou == 2) {
			ganhosJogador2++
			se(ganhosJogador2 > vitoriasMaiorVencedor) {
				maiorVencedor = nomeJogador2
				vitoriasMaiorVencedor = ganhosJogador2
			}
		} senao {
			jogosVelha++
		}
		totalJogos++

		retorne ganhou
	}
	// Função que controla o fluxo do jogo.
	funcao inicio(){
		inteiro jogador, ganhou, jogadas

		faca{
			menuJogo()
			
			se(opcaoMenu == 1){
				jogador = 1
				ganhou = 0 
				jogadas = 0
				
				inicializarJogo()
				ganhou = jogoPrincipal(jogador, jogadas, ganhou)
				imprimirLayout(jogador)
				// Exibe o vencedor ao final da partida.
				se(ganhou == 1)
					escreva("\nParabéns, ", nomeJogador1, "! Você venceu!\n")
				se(ganhou == 2)
					escreva("\nParabéns, ", nomeJogador2, "! Você venceu!\n")
			} 
			// Opção para alterar os nomes dos jogadores.
			se(opcaoMenu == 2){ 
				para(jogador = 1; jogador <=2; jogador++){
					se(jogador == 1){										
						escreva("Digite o nome para o Jogador 1: \n")
						leia(nomeJogador1)
					} senao {
						escreva("Digite o nome para o Jogador 2: \n")
						leia(nomeJogador2)
					}
				}
			}
			// Opção para mostrar o placar atual.
			se(opcaoMenu == 3){
				escreva("\n Placar Atual\n")
				escreva("Jogador 1 = ", ganhosJogador1, "\n")
				escreva("Jogador 2 = ", ganhosJogador2, "\n")
			}
			se(opcaoMenu == 4){
				estatisticasGerais() // Chamando a função para exibir as estatísticas gerais
			}
		} enquanto(opcaoMenu != 5) // O loop continua até a opção de sair (5).
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2453; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */