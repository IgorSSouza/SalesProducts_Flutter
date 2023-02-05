# Desenvolvido por Igor Souza

Sales Products - Flutter Web

## Instalação do projeto

- Após baixar o projeto, basta abrir o "main.dart" e colocar para rodar com o debugging
- O seu Visual Studio Code precisa estar com o pacote do Flutter instalado.
- Os dados para a autenticação são: 

Email: testeFlutter@gmail.com
senha: 123456

O login e a parte de finalizar a compra pode demorar pois a API foi hospedada em um servidor de testes e gratuito.

## Como foi o processo de desenvolvimento

- Comecei a pensar de uma forma ampla como poderia fazer um carrinho de compras em Flutter, comecei a consultar a API do primeiro Fornecedor, fiz o levantamento dos dados fornecidos e comecei a montar o carrinho, todos os dados fornecidos eu escolhi exibir nos detalhes, assim que você clica em cima de um produto e nessa página de detalhes tem a opção da adição do produto ao carrinho. A API do segundo fornecedor era um pouco diferente, tinha alguns dados a mais e uma questão do desconto, fiz uma lógica onde ao adicionar ao carrinho descontasse o valor caso o campo "HasDiscount" fosse verdadeiro, fiz um carousel com a galeria de fotos. Cada fornecedor tem um carrinho diferente pois na minha analise era inviável fazer um carrinho para tudo, pois as duas apis tem ids de produtos iguais e isso em um mundo real não seria interessante, porém o carrinho final que fica na tela de escolha dos fornecedores ele sim tem todos os produtos escolhidos do fornecedor 1 e fornecedor 2 e você só consegue finalizar a compra por essa tela.
fiz uma tela inicial de login com autenticação pois para armazenar os dados do comprador achei interessante fazer desse jeito, então ao finalizar a compra além de armazenar os dados dos produtos é armazenado também o id do usuário logado na aplicação e o id do fornecedor também sendo o fornecedor 1 com o id 1 e o fornecedor 2 com o id 2, assim fica mais fácil na hora de uma possível consulta de dados diferenciar qual produto é de qual fornecedor.
