# Sistema Prolog

Projeto desenvolvido em **SWI-Prolog** para estudos de Programação Lógica e Inteligência Artificial.

## Requisitos

- SWI-Prolog  10.0.2-1  ou superior
- Git 2.x ou superior

## Instalação do SWI-Prolog

### Windows

1. Acesse o site oficial:
   https://www.swi-prolog.org/download/stable

2. Baixe a versão mais recente para Windows.

3. Execute o instalador e mantenha as opções padrão.

4. Verifique a instalação abrindo o terminal:

```bash
swipl --version
```

Exemplo de saída:

```text
SWI-Prolog version  10.0.2-1  for x64-win64
```

## Clonando o projeto

```bash
git clone https://github.com/SEU-USUARIO/NOME-DO-REPOSITORIO.git
cd NOME-DO-REPOSITORIO
```

## Executando o projeto

No terminal, dentro da pasta do projeto:

```bash
swipl
```

Carregue o arquivo principal:

```prolog
?- [main].
```

Ou diretamente:

```bash
swipl main.pl
```

## Exemplo de consulta

```prolog
?- animal(cachorro).
```

Saída:

```prolog
true.
```

## Configuração inicial do Git

Caso seja sua primeira utilização do Git:

### Configurar nome

```bash
git config --global user.name "Seu Nome"
```

### Configurar e-mail

```bash
git config --global user.email "seuemail@email.com"
```

### Verificar configurações

```bash
git config --list
```

## Fluxo básico do Git

Adicionar arquivos:

```bash
git add .
```

Criar commit:

```bash
git commit -m "Descrição das alterações"
```

Enviar para o GitHub:

```bash
git push origin main
```

Atualizar repositório local:

```bash
git pull origin main
```

## Estrutura do Projeto

```text
.
├── main.pl
├── README.md
└── .gitignore
```

## Autor



Estudante da Universidade Federal de São João del-Rei (UFSJ).
