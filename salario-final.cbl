      ******************************************************************
      * PROGRAM:     SALARIO-FINAL
      * AUTHOR:      TOBIAS SAUERESSIG
      * DATE:        05/28/2026
      * PURPOSE:     CALCULAR SALARIO FINAL COM BASE NO TEMPO DE EMPRESA
      * COMPILER:    GNUCOBOL (COBC)
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARIO-FINAL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-FUNCIONARIO.
           05 WS-NOME        PIC X(20).
           05 WS-BASE        PIC 9(06)V99.
           05 WS-TEMPO       PIC 99.
       
       01 WS-CALCULO.
           05 WS-PERCENT     PIC 99.
           05 WS-BONUS       PIC 9(06)V99.
           05 WS-FINAL       PIC 9(07)V99.
       
       01 WS-EXIBICAO.
           05 WS-BASE-OUT    PIC ZZZ,ZZ9.99.
           05 WS-BONUS-OUT   PIC ZZZ,ZZ9.99.
           05 WS-FINAL-OUT   PIC ZZZ,ZZ9.99.
       
       01 WS-CONTROLE.
           05 WS-OPCAO       PIC 9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM UNTIL WS-OPCAO = 2
               DISPLAY ' '
               DISPLAY '1 - CALCULAR SALARIO'
               DISPLAY '2 - SAIR'
               DISPLAY 'ESCOLHA UMA OPCAO:'
               ACCEPT WS-OPCAO
               IF WS-OPCAO = 1
                   PERFORM LIMPA-DADOS
                   PERFORM ENTRADA-DADOS
                   PERFORM VALIDA-DADOS
                   PERFORM CALCULA-BONUS
                   PERFORM CALCULA-SALARIO
                   PERFORM EXIBE-RESULTADO
               ELSE
                   IF WS-OPCAO NOT = 2
                       DISPLAY 'OPCAO INVALIDA'
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.

       LIMPA-DADOS.
           MOVE SPACES TO WS-NOME
           MOVE ZERO TO WS-BASE
           MOVE ZERO TO WS-TEMPO
           MOVE ZERO TO WS-CALCULO
           .

       ENTRADA-DADOS.
           DISPLAY 'DIGITE O NOME: '
           ACCEPT WS-NOME
           DISPLAY 'DIGITE O SALARIO BASE: '
           ACCEPT WS-BASE
           DISPLAY 'DIGITE O TEMPO DE EMPRESA (EM ANOS): '
           ACCEPT WS-TEMPO
           .
       
       VALIDA-DADOS.
           PERFORM UNTIL WS-NOME NOT = SPACES
               DISPLAY 'NOME NAO PODE SER VAZIO. DIGITE NOVAMENTE: '
               ACCEPT WS-NOME
           END-PERFORM
           
           PERFORM UNTIL WS-BASE NOT = 0
               DISPLAY 'SALARIO NAO PODE SER ZERO. DIGITE NOVAMENTE: '
               ACCEPT WS-BASE
           END-PERFORM
           .

       CALCULA-BONUS.
           IF WS-TEMPO > 5
               MOVE 15 TO WS-PERCENT
           ELSE 
               IF WS-TEMPO > 1
                   MOVE 10 TO WS-PERCENT
               ELSE
                   MOVE 5 TO WS-PERCENT
               END-IF
           END-IF
           COMPUTE WS-BONUS = WS-BASE * WS-PERCENT / 100
           .
        
       CALCULA-SALARIO.
           COMPUTE WS-FINAL = WS-BASE + WS-BONUS
           .

       EXIBE-RESULTADO.
           MOVE WS-BASE TO WS-BASE-OUT
           MOVE WS-BONUS TO WS-BONUS-OUT
           MOVE WS-FINAL TO WS-FINAL-OUT
           DISPLAY 'NOME:          ' WS-NOME
           DISPLAY 'SALARIO BASE:  ' WS-BASE-OUT
           DISPLAY 'BONUS:         ' WS-BONUS-OUT
           DISPLAY 'SALARIO FINAL: ' WS-FINAL-OUT
           .
       
       END PROGRAM SALARIO-FINAL.
