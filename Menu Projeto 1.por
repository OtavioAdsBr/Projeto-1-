programa
{
    funcao inicio()
    {
        inteiro opcao, l, c, linha, coluna, jogador, ganhou, jogadas
        caracter jogo[3][3]
        
        // Loop do menu principal
        faca
        {
            // Exibir as opções do menu
            escreva("\n--- MENU PRINCIPAL ---\n")
            escreva("1. Jogar\n")
            escreva("2. Ver placar\n")
            escreva("3. Configurar jogadores\n")
            escreva("4. Sair\n")
            escreva("Escolha uma opção: ")
            leia(opcao)

            // Processar a opção escolhida
            escolha(opcao)
            {
                caso 1:
                    escreva("\nIniciando o jogo...\n")
                    // Aqui você pode chamar a função para jogar
                    pare
                
                caso 2:
                    escreva("\nExibindo o placar...\n")
                    // Aqui você pode mostrar os resultados
                    pare
                
                caso 3:
                    escreva("\nConfigurando jogadores...\n")
                    // Aqui você pode configurar os nomes
                    pare
                
                caso 4:
                    escreva("\nSaindo do programa. Até logo!\n")
                    pare
                
                caso contrario:
                    escreva("\nOpção inválida! Tente novamente.\n")
            }
        } enquanto(opcao != 4)
 faca{
      jogador = 1
      ganhou = 0
      jogadas = 0
      para(l = 0; l < 3; l++){
        para(c = 0; c < 3; c++)
          jogo[l][c] = ' '
      }
  
      faca{
        // o que será mostrado no tabuleiro
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
    
        // lendo as coordenadas
        faca{
          faca{
            escreva("\nJogador ",jogador, " digite linha e coluna da posição desejada: ")
            leia(linha, coluna)
          }enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
        }enquanto(jogo[linha][coluna] != ' ')
        
        // salvar as coordenadas
        se(jogador == 1){
          jogo[linha][coluna] = '0'
          jogador++
        }
        senao{
          jogo[linha][coluna] = 'X'
          jogador = 1
        }
        jogadas++
        
        // verificar o ganhador por linhas
        para(l = 0; l < 3; l++){
          se(jogo[l][0] == '0' e jogo[l][1] == '0' e jogo[l][2] == '0')
            ganhou = 1
        }
    
        para(l = 0; l < 3; l++){
          se(jogo[l][0] == 'X' e jogo[l][1] == 'X' e jogo[l][2] == 'X')
            ganhou = 2
        }
        
        // verificar o ganhador por colunas
        para(c = 0; c < 3; c++){
          se(jogo[0][c] == '0' e jogo[1][c] == '0' e jogo[2][c] == '0')
            ganhou = 1
        }
    
        para(c = 0; c < 3; c++){
          se(jogo[0][c] == 'X' e jogo[1][c] == 'X' e jogo[2][c] == 'X')
            ganhou = 2
        }
        // verificar ganhador da diagonal principal
        se(jogo[0][0] == '0' e jogo[1][1] == '0' e jogo[2][2] == '0')
          ganhou = 1
    
        se(jogo[0][0] == 'X' e jogo[1][1] == 'X' e jogo[2][2] == 'X')
          ganhou = 2
        
        // verificar ganhador da diagonal secundária
        se(jogo[0][2] == '0' e jogo[1][1] == '0' e jogo[2][0] == '0')
          ganhou = 1  
    
        se(jogo[0][2] == 'X' e jogo[1][1] == 'X' e jogo[2][0] == 'X')
          ganhou = 2
      }enquanto(ganhou == 0 e jogadas < 9)
  
      // o que será mostrado no tabuleiro
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
  
      se(ganhou == 1)
        escreva("\n\tParabéns Jogador 1. Você ganhou!\n\n")

      se(ganhou == 2)
        escreva("\n\tParabéns Jogador 2. Você ganhou!\n\n")
  
      escreva("Digite 1 para jogar novamente: ")
      leia(opcao)
    }enquanto(opcao == 1)
  }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3390; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */