# Projetos_Quartus_Vhdl

Coleção de projetos de **VHDL** desenvolvidos e compilados utilizando o **Intel Quartus Prime**.

O repositório reúne exemplos de lógica digital combinacional, hierarquia de componentes, somadores, multiplexadores, decodificadores, portas lógicas e operações com vetores de bits. Os projetos foram configurados para dispositivos da família **MAX 10**.

## Sobre o Projeto

O objetivo deste repositório é praticar a descrição de circuitos digitais em VHDL e compreender como os projetos são organizados, compilados e sintetizados no Quartus.

Cada pasta contém um projeto independente do Quartus, com seu arquivo de projeto, suas configurações e o código-fonte VHDL correspondente. Alguns projetos também incluem os arquivos gerados após a compilação.

## Características do Repositório

| Característica | Detalhes |
|---|---|
| Linguagem de descrição | VHDL |
| Ferramenta principal | Intel Quartus Prime |
| Família de dispositivos | MAX 10 |
| Dispositivo configurado | `10M08DAF484C8G` |
| Tipo de circuitos | Lógica combinacional e estruturas hierárquicas |
| Arquivos principais | `.vhd`, `.qpf` e `.qsf` |
| Síntese e compilação | Arquivos de saída gerados pelo Quartus |
| Licença | MIT |

## Projetos Disponíveis

| Projeto | Descrição |
|---|---|
| `porta_and` | Implementação de uma porta lógica AND com duas entradas |
| `porta_and_2` | Segunda implementação de uma porta lógica AND |
| `porta_not` | Implementação de uma porta lógica NOT |
| `teste` | Circuito combinando inversão e operação XOR |
| `multiplexador` | Multiplexador de duas entradas controlado por seleção |
| `decodificador_3_X_8` | Decodificador de 3 entradas para 8 saídas usando `case` |
| `with_select_decodificador_3_X_8` | Decodificador de 3 entradas para 8 saídas usando `with select` |
| `somador_1_bit` | Somador completo de um bit com carry de entrada e saída |
| `somador_4_bits` | Somador de quatro bits construído com somadores de um bit |
| `somador_N_bits` | Somador parametrizável por meio de um `generic` |
| `inversor_ordem_while` | Inversão da ordem dos bits de um vetor de 8 bits usando `while` |
| `inversor_vector_for` | Inversão lógica dos bits de um vetor de 8 bits usando `for` |
| `digital_x` | Circuito hierárquico construído com portas AND e NOT |

## Estrutura de um Projeto Quartus

Cada projeto possui uma estrutura semelhante à seguinte:

```text
nome_do_projeto/
├── nome_do_projeto.qpf
├── nome_do_projeto.qsf
├── nome_do_projeto.vhd
├── db/
├── incremental_db/
└── output_files/
```

| Arquivo ou diretório | Responsabilidade |
|---|---|
| `.qpf` | Arquivo principal do projeto Quartus |
| `.qsf` | Configurações, entidade principal, dispositivo e fontes VHDL |
| `.vhd` | Código-fonte do circuito descrito em VHDL |
| `db/` | Banco de dados interno gerado durante a compilação |
| `incremental_db/` | Dados utilizados pela compilação incremental |
| `output_files/` | Relatórios e arquivos gerados pela síntese e implementação |

## Conceitos de VHDL Praticados

### Entidade e Arquitetura

Cada circuito é descrito por uma `ENTITY`, que define suas entradas e saídas, e uma `ARCHITECTURE`, que especifica seu funcionamento.

```vhdl
ENTITY porta_and IS
    PORT(
        E1 : IN STD_LOGIC;
        E2 : IN STD_LOGIC;
        S  : OUT STD_LOGIC
    );
END porta_and;

ARCHITECTURE porta_and_arch OF porta_and IS
BEGIN
    S <= E1 AND E2;
END porta_and_arch;
```

### Portas Lógicas

Os projetos `porta_and`, `porta_and_2` e `porta_not` implementam operações lógicas básicas com sinais do tipo `STD_LOGIC`.

### Processos Sensíveis a Entradas

Os circuitos que utilizam estruturas sequenciais em VHDL possuem processos sensíveis aos sinais de entrada. Quando uma entrada é alterada, o processo é reavaliado e atualiza a saída correspondente.

### Estruturas de Seleção

Os decodificadores demonstram duas formas de descrever uma seleção entre várias possibilidades: a estrutura `case` e a atribuição concorrente `with select`.

### Laços de Repetição

Os projetos de inversão de vetores utilizam laços `while` e `for` para percorrer os bits de um `STD_LOGIC_VECTOR`.

### Componentes e Hierarquia

Os somadores de quatro e de N bits reutilizam o componente `somador_1_bit`. Essa organização demonstra como circuitos maiores podem ser construídos a partir de módulos menores.

### Geração Parametrizável

O projeto `somador_N_bits` utiliza um parâmetro `generic` para definir a largura dos vetores de entrada e saída:

```vhdl
ENTITY somador_N_bits IS
    GENERIC (N : INTEGER := 16);
    PORT(
        a, b     : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        cin      : IN  STD_LOGIC;
        s        : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        overflow : OUT STD_LOGIC
    );
END somador_N_bits;
```

## Principais Circuitos

### Somador de Um Bit

O `somador_1_bit` recebe dois bits e um carry de entrada. Ele produz o resultado da soma e o carry de saída.

```vhdl
s    <= a XOR b XOR cin;
cout <= (a AND b) OR (cin AND a) OR (cin AND b);
```

### Somador de Quatro Bits

O `somador_4_bits` conecta quatro somadores de um bit em sequência. O carry de saída de uma posição é utilizado como carry de entrada da posição seguinte.

### Somador de N Bits

O `somador_N_bits` generaliza a mesma ideia por meio de um `generic`, permitindo alterar a largura do somador sem reescrever toda a arquitetura.

### Multiplexador

O multiplexador seleciona uma das entradas com base no sinal `SEL`:

```vhdl
IF SEL = '0' THEN
    S <= E1;
ELSE
    S <= E2;
END IF;
```

### Decodificador de 3 para 8

Os projetos `decodificador_3_X_8` e `with_select_decodificador_3_X_8` recebem um vetor de três bits e ativam uma entre oito saídas possíveis.

| Entrada | Saída ativada |
|---|---|
| `000` | `00000001` |
| `001` | `00000010` |
| `010` | `00000100` |
| `011` | `00001000` |
| `100` | `00010000` |
| `101` | `00100000` |
| `110` | `01000000` |
| `111` | `10000000` |

### Operações com Vetores

Os dois projetos de inversão possuem objetivos diferentes:

| Projeto | Operação |
|---|---|
| `inversor_ordem_while` | Inverte a ordem das posições dos bits. Por exemplo, o primeiro bit passa para a última posição. |
| `inversor_vector_for` | Aplica a operação lógica `NOT` individualmente a cada bit do vetor. |

## Projeto Hierárquico `digital_x`

O projeto `digital_x` utiliza componentes definidos em outros projetos para formar um circuito maior:

```text
A ──┐
    AND ── NOT ──┐
B ──┘            AND ── S
C ───────────────┘
```

Sua implementação instancia duas portas `porta_and` e uma porta `porta_not`, demonstrando a reutilização de componentes VHDL:

```vhdl
and1 : porta_and PORT MAP (a, b, t1);
not1 : porta_not PORT MAP (t1, t2);
and2 : porta_and PORT MAP (t2, c, s);
```

## Configuração do Quartus

Os arquivos `.qsf` dos projetos definem, entre outras informações:

```text
Família: MAX 10
Dispositivo: 10M08DAF484C8G
Entidade principal: nome do projeto
Fonte: arquivo VHDL correspondente
```

O arquivo `.qsf` também pode conter atribuições de pinos e outras opções específicas de compilação, dependendo do projeto e da placa utilizada.

## Como Abrir um Projeto

1. Instale uma versão compatível do [Intel Quartus Prime](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/overview.html);
2. Extraia o repositório;
3. Abra o Quartus Prime;
4. Selecione **File > Open Project**;
5. Escolha o arquivo `.qpf` do projeto desejado;
6. Confira a entidade principal e o dispositivo selecionado;
7. Abra o arquivo `.vhd` para revisar o código;
8. Execute a compilação pelo menu **Processing > Start Compilation**.

## Compilação pela Linha de Comando

Com o executável `quartus_sh` disponível no ambiente, a compilação pode ser iniciada a partir da pasta do projeto:

```bash
quartus_sh --flow compile nome_do_projeto
```

Por exemplo:

```bash
cd porta_and
quartus_sh --flow compile porta_and
```

Os relatórios e arquivos gerados serão armazenados no diretório `output_files/`.

## Arquivos Gerados

O repositório contém artefatos gerados pelo Quartus, como:

| Extensão ou arquivo | Descrição |
|---|---|
| `.sof` | Arquivo utilizado para programação temporária do dispositivo FPGA |
| `.pof` | Arquivo de programação destinado a memória não volátil, quando aplicável |
| `.rpt` | Relatórios de síntese, análise, fitting e roteamento |
| `.pin` | Relatório de atribuição de pinos |
| `db/` | Banco de dados de compilação |
| `incremental_db/` | Dados de compilação incremental |

Esses arquivos são produzidos automaticamente durante a compilação. O código-fonte editável de cada circuito está no arquivo `.vhd` correspondente.

## Fluxo de Desenvolvimento

1. Escolha um dos diretórios de projeto;
2. Abra o arquivo `.qpf` no Quartus;
3. Verifique o arquivo `.qsf` e a entidade principal;
4. Edite o código VHDL;
5. Compile o projeto;
6. Analise os relatórios gerados;
7. Corrija eventuais erros de síntese ou configuração;
8. Programe a FPGA com o arquivo de saída, caso exista uma placa compatível;
9. Teste o comportamento das entradas e saídas do circuito.

## Observações

Os projetos utilizam `STD_LOGIC` e `STD_LOGIC_VECTOR` da biblioteca `IEEE.STD_LOGIC_1164`. Para testar os circuitos em uma placa FPGA, é necessário confirmar as atribuições de pinos de acordo com o hardware utilizado.

Os diretórios `db`, `incremental_db` e `output_files` contêm resultados gerados pelo Quartus. Caso uma compilação limpa seja necessária, esses diretórios podem ser regenerados pelo próprio Quartus, preservando os arquivos `.vhd`, `.qpf` e `.qsf`.

## Contribuição

Sugestões, correções e novos circuitos são bem-vindos. Para contribuir, adicione o projeto em um diretório próprio, inclua o arquivo `.vhd`, o projeto do Quartus e documente sua finalidade no README.

## Licença

Este projeto está disponível sob a licença **MIT**. Consulte o arquivo [`LICENSE`](LICENSE) para conhecer os termos completos de uso, cópia, modificação e distribuição.
