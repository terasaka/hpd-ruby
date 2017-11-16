# hpd-ruby

Curso de Ruby

## Calculadora - HPD

- Digite o primeiro valor para ser calculado

- Informe a opção desejada
  - ( + ) Adição
  - ( - ) Subtração
  - ( * ) Multiplicação
  - ( / ) Subtração

- Digite o segundo valor 

Caso queira efetuar uma nova operação pressione Enter ou "x" para sair

---

## Gerador de IPs - HPD

- Utilize as opcoes:

        -list dev - Para listar os IPs disponiveis
        -new dev - Para solicitar um novo IP

- Os IPs disponiveis para atribuição são:

        10.1.10.3
        10.1.10.4
        10.1.10.5
        10.1.10.9
        10.1.10.20
        10.1.10.22
        10.1.10.57
        10.1.10.59

- Ao solicitar um novo IP ele é removido do pool de IPs e adicionado ao pool de IPs em uso.
  - É logado o Login, IP e HOSTNAME do solicitante para efeito de auditoria.

---

## Gerador de IPs - HPD IP_2.0

- Nessa versão foi utilizado a classe Thor como melhoria da ferramenta
  - [Manual](http://whatisthor.com/)
  - [Link para download](https://rubygems.org/gems/thor/versions/0.20.0)

- Adicionado Gemfile ao projeto
    - Para instalar as dependências utilize
    ```bash
    bundle install
    ```
- Opções
    - Lista os IPs disponiveis
    ```bash
    ruby ./cli.rb list dev
    ```
    - Libera um IP para utilizar na Vlan DEV

    ```bash
    ruby ./cli.rb  new dev
    ```
    - Limpa os arquivos utilizados
    ```bash
    ruby ./cli.rb  limpa
    ```