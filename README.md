# Salário Final em COBOL

Projeto desenvolvido em COBOL para cálculo de salário final com base no tempo de empresa.

## Objetivo

O programa recebe:

* Nome do funcionário
* Salário base
* Tempo de empresa

Com base no tempo de empresa, é calculado um bônus salarial:

| Tempo de empresa | Bônus |
| ---------------- | ----- |
| Até 1 ano        | 5%    |
| 2 a 5 anos       | 10%   |
| Acima de 5 anos  | 15%   |

Ao final, o programa exibe:

* Nome
* Salário base
* Valor do bônus
* Salário final

---

## Funcionalidades

* Entrada de dados com `ACCEPT`
* Exibição de informações com `DISPLAY`
* Cálculo de bônus com `IF`
* Modularização utilizando parágrafos e `PERFORM`
* Menu interativo
* Validação básica de dados
* Formatação de valores monetários

---

## Estrutura do Programa

```text
MAIN-PROCEDURE
├── LIMPA-DADOS
├── ENTRADA-DADOS
├── VALIDA-DADOS
├── CALCULA-BONUS
├── CALCULA-SALARIO
└── EXIBE-RESULTADO
```

---

## Como Compilar

```bash
cobc -x salario-final.cbl
```

---

## Como Executar

Linux:

```bash
./salario-final
```

Windows:

```bash
salario-final.exe
```

---

## Autor

Tobias Saueressig
