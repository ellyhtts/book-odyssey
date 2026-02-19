# Projeto: Loja Odisseia das Páginas - Sistema de Venda de Livros Usados

## 1. Introdução
Este projeto surge da necessidade de modernizar a operação da loja "Estante Antiga", administrada por Anna Mayná. O objetivo é desenvolver a base de um sistema utilizando **Linguagem SQL** para automatizar a venda de livros seminovos, substituindo o fluxo manual de vendas via redes sociais por uma estrutura de dados organizada e eficiente.

Este trabalho é parte integrante da disciplina de Linguagem SQL no curso de Sistemas de Informação da **UNEX - Campus Feira de Santana**.

**Equipe de Desenvolvimento:**
* Amanda Ellen Lopes Lima
* Diná Borges Azevedo
* Maria Fabiana Silva Martins
* Lismara Santos Moreira
* Bianca Ribeiro de Almeida Barroca

**Docente:** Jéfte Goes

--------------------------------------------------------------------------------

## 2. Como Funciona a Odisseia das Páginas
A ideia central é uma loja online onde o fluxo de venda passa a ser gerenciado por uma estrutura lógica de banco de dados.

### O Algoritmo de Conservação
O grande diferencial do projeto é a lógica de precificação automática. O sistema avalia o estado do livro (Novo, Seminovo ou Com Marcas de Tempo) e aplica as regras de depreciação para ajustar o preço final de venda.

### Experiência do Cliente e Venda
* **Perfil do Usuário:** O comprador cria um perfil com nome, e-mail, telefone e endereço para agilizar a logística.
* **Carrinho e Pedidos:** O sistema permite que um único pedido contenha vários livros, calculando a quantidade total e registrando a data da solicitação.
* **Pagamento:** Integração de formas como Pix, Cartão e Boleto, gerando um código de identificação exclusivo para cada transação.
* **Atualização Automática:** Ao finalizar uma venda, o sistema altera o status do pedido para "Enviado" e retira os livros do catálogo automaticamente.

--------------------------------------------------------------------------------

## 3. Estrutura do Banco de Dados
O banco de dados foi planejado de forma modular para garantir a organização e a integridade das informações. Abaixo estão as principais tabelas e as funções que elas desempenham no sistema:

### Módulo de Livros e Acervo
* **Livros:** É a tabela central. Armazena o código exclusivo de cada exemplar, título, autor e ano de lançamento. É aqui que o estoque é controlado.
* **Categorias:** Serve para organizar o acervo. Cada livro é vinculado a uma categoria (Romance, HQs, Ficção, etc.), facilitando a busca pelo cliente.
* **Editoras:** Guarda informações sobre a publicação original e ajuda a rastrear a quantidade de obras de cada editora no catálogo.
* **Status de Conservação:** Tabela fundamental para o algoritmo de preços; define se o livro é "Novo", "Seminovo" ou tem "Marcas de Tempo", ditando o valor final.

### Módulo de Clientes e Transações
* **Clientes/Compradores:** Registra quem está comprando. Armazena CPF, endereço completo, e-mail e telefone para possibilitar a entrega e o contacto.
* **Pedidos:** Registra cada venda realizada. Contém o número do pedido, a data, o valor total e o status (se está pendente, pago ou já enviado).
* **Pagamentos:** Armazena os detalhes financeiros. Registra qual foi a forma de pagamento (Pix, Cartão, Boleto) e confirma o recebimento dos valores.

### Módulo Administrativo e de Logística
* **Usuários Admin:** Cadastro para os funcionários (como a administradora Anna Mayná) que gerem o sistema e o catálogo.
* **Envios (Logística):** Gerencia a saída dos livros. Guarda o código de rastreio, a data de envio e o custo do frete.
* **Fornecedores:** Tabela para os parceiros que fornecem livros para a loja, permitindo o rastreio da origem do acervo.
* **Cupom de Fornecedor:** Implementa um sistema de fidelidade. Calcula pontos ganhos por fornecedores que doam livros, permitindo resgates futuros.

--------------------------------------------------------------------------------

## 4. Referências Bibliográficas
* Maria Fabiana Silva Martins. Material de Aula - Material de aula (PDF) da disciplina Banco de Dados. Centro Universitário de Excelência. [S.l.: s.n., s.d.]. 2025.
* Documentação de Apoio: [Acesse o Documento Original](https://drive.google.com/file/d/185lK_Xca22SBuBAM7qMHYSQIOBOwVUyY/view?usp=sharing).