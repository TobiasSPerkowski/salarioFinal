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
       77 WS-NOME     PIC x(20).
       77 WS-BASE     PIC 9(06)V99.
       77 WS-TEMPO    PIC 9(02).
       77 WS-PERCENT  PIC 99.
       77 WS-BONUS    PIC 9(06)V99.
       77 WS-FINAL    PIC 9(07)V99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM ENTRADA-DADOS
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
           DISPLAY 'NOME: ' WS-NOME
           DISPLAY 'SALARIO BASE: ' WS-BASE
           DISPLAY 'BONUS: ' WS-BONUS
           DISPLAY 'SALARIO FINAL: ' WS-FINAL
           .
       
       END PROGRAM SALARIO-FINAL.
