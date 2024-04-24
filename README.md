## Desafio Vetor Editora API - Sistema de Instrumentos Psicológicos Online

### Importante: 
- Esse Readme aborda: **Entidades da Aplicação**, **Padronização e Boas Práticas Aplicadas**, **Requisitos** e por fim  **Como testar**

### Entidades da Aplicação:

1. **Evaluated (Avaliado):**
   - Representa os indivíduos que serão avaliados por meio dos instrumentos psicológicos.
   - Atributos: Nome, CPF, Email e Data de Nascimento.
   - Relacionamentos: Pode ter vários instrumentos aplicados.

2. **Instrument (Instrumento):**
   - Representa os instrumentos psicológicos que serão aplicados nos avaliados.
   - Atributos: Título e Descrição.
   - Relacionamentos: Pode ser aplicado em vários avaliados e pode conter várias questões.

3. **Question (Questão):**
   - Representa as perguntas que compõem os instrumentos psicológicos.
   - Atributos: Conteúdo da questão.
   - Relacionamentos: Pertence a um instrumento e pode ter várias respostas.

4. **Answer (Resposta):**
   - Representa as respostas fornecidas pelos avaliados às questões dos instrumentos.
   - Atributos: Conteúdo da resposta.
   - Relacionamentos: Pertence a uma questão.

Essas entidades formam a base da aplicação para o sistema de instrumentos psicológicos online. Elas estão interligadas por meio de relacionamentos para facilitar o gerenciamento e a aplicação dos instrumentos, bem como o armazenamento e a análise das respostas dos avaliados.

### Padronização e Boas Práticas Aplicadas:

1. **Separação de Responsabilidades (Separation of Concerns):**
   - A aplicação segue o padrão MVC (Model-View-Controller), onde cada componente tem uma responsabilidade específica: o Model (Modelo) representa os dados e a lógica de negócios, o Controller (Controlador) lida com a interação do usuário e o fluxo de controle, e a View (Visão) apresenta os dados ao usuário.
   - Além disso, a camada de lógica de negócios foi subdividida em Model, Repository e Service, garantindo uma separação clara entre a representação dos dados, a persistência e a manipulação dos mesmos.

2. **Design Patterns (Padrões de Projeto):**
   - O padrão Repository foi utilizado para encapsular a lógica de persistência de dados em objetos separados, facilitando a manutenção e a testabilidade do código.
   - A utilização de Service Objects (Objetos de Serviço) permite encapsular a lógica de negócios em classes específicas, tornando o código mais modular e reutilizável.
   - O uso de Transactions (Transações) em operações de banco de dados garante a atomicidade das operações e a consistência dos dados.

3. **Injeção de dependência**
     - A injeção de dependência é aplicada para promover a modularidade e a flexibilidade do código, permitindo a substituição de implementações e mudanças de comportamento sem modificar o código existente.

4. **Test-Driven Development (Desenvolvimento Orientado a Testes - TDD):**
   - Todos os componentes da aplicação possuem testes unitários escritos utilizando o framework RSpec, garantindo que as funcionalidades se comportem conforme o esperado e que futuras alterações não quebrem o funcionamento existente.
   - O TDD promove uma abordagem incremental para o desenvolvimento de software, onde os testes são escritos antes da implementação do código, o que ajuda a garantir a qualidade do software desde o início do processo de desenvolvimento.
   - Como os todos os componentes da aplicação possuem testes unitários, a API conta com uma cobertura de 65 testes.

5. **Tratamento de Exceções e Internacionalização:**
   - O código inclui tratamento de exceções para lidar com situações de erro de forma robusta e garantir uma experiência de usuário consistente.
   - O uso da gem I18n para internacionalização permite a tradução de mensagens de erro e avisos, tornando a aplicação mais acessível para usuários de diferentes idiomas.
   - Os idiomas disponíveis hoje são o português e o inglês




### Requisitos:

2. **Cadastro de Avaliados:**

3. **Visualização de Instrumentos Aplicados:**

4. **Aplicação de Instrumentos:**

5. **Envio de E-mail ao Distribuir Instrumento:**

6. **Acesso aos Resultados por parte do Psicólogo:**

7. **Execução do Instrumento por parte do Avaliado:**
   
8. **Preenchimento de Dados pelo Avaliado:**
   
8. **Início do Instrumento pelo Avaliado:**
   


