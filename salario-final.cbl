      ******************************************************************
      * Author: TOBIAS SAUERESSIG
      * Date: 05/28/2026
      * Purpose: TESTANDO E/S
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARIO-FINAL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-NOME       PIC x(20) VALUE SPACES.
       77 WS-TEMPO      PIC 9(02).
       77 WS-PERCENT    PIC 99.
       77 WS-BASE       PIC 9(06)V99.
       77 WS-BONUS      PIC 9(06)V99.
       77 WS-FINAL      PIC 9(07)V99.
       77 WS-BASE-OUT   PIC ZZZ,ZZ9.99.
       77 WS-BONUS-OUT  PIC ZZZ,ZZ9.99.
       77 WS-FINAL-OUT  PIC ZZZ,ZZ9.99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM ENTRADA-DADOS
           PERFORM VALIDA-DADOS
           PERFORM CALCULA-BONUS
           PERFORM CALCULA-SALARIO
           PERFORM EXIBE-RESULTADO
           STOP RUN.

       ENTRADA-DADOS.
           DISPLAY 'Digite o nome: '
           ACCEPT WS-NOME
           DISPLAY 'Digite o salario base: '
           ACCEPT WS-BASE
           DISPLAY 'Digite o tempo de empresa (em anos): '
           ACCEPT WS-TEMPO
           .
       
       VALIDA-DADOS.
           PERFORM UNTIL WS-NOME NOT = SPACES
                   DISPLAY 'Nome nao pode ser vazio. Digite novamente: '
                   ACCEPT WS-NOME
               END-PERFORM
           
               PERFORM UNTIL WS-BASE NOT = 0
                   DISPLAY 'Salario nao pode ser zero. Digite novamente:
      -            ' '
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
