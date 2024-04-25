## Desafio Vetor Editora API - Sistema de Instrumentos Psicológicos Online

### Importante:
- Esse Readme aborda: **Entidades da Aplicação**, **Padronização e Boas Práticas Aplicadas**, **Requisitos** e por fim  **Como testar**
- Por favor leia com atenção cada ponto para um entendimento completo da aplicação, suas regras de negócio e arquitetura.

### Entidades da Aplicação:

1. **Psychologist (Psicólogo):**
   - Representa os psicólogos que após serem autenticados tem o permissionamento de operar toda a aplicação.
   - Atributos: Nome, Senha.

2. **Evaluated (Avaliado):**
   - Representa os indivíduos que serão avaliados por meio dos instrumentos psicológicos.
   - Atributos: Nome, CPF, Email e Data de Nascimento.
   - Relacionamentos: Pode ter vários instrumentos aplicados.

3. **Instrument (Instrumento):**
   - Representa os instrumentos psicológicos que serão aplicados nos avaliados.
   - Atributos: Título e Descrição.
   - Relacionamentos: Pode ser aplicado em vários avaliados e pode conter várias questões.

4. **Question (Questão):**
   - Representa as perguntas que compõem os instrumentos psicológicos.
   - Atributos: Conteúdo da questão.
   - Relacionamentos: Pertence a um instrumento e pode ter várias respostas.

5. **Answer (Resposta):**
   - Representa as respostas fornecidas pelos avaliados às questões dos instrumentos.
   - Atributos: Conteúdo da resposta.
   - Relacionamentos: Pertence a uma questão.

Essas entidades formam a base da aplicação para o sistema de instrumentos psicológicos online. Elas estão interligadas por meio de relacionamentos para facilitar o gerenciamento e a aplicação dos instrumentos, bem como o armazenamento e a análise das respostas dos avaliados.

### Padronização e Boas Práticas Aplicadas:

1. **Separação de Responsabilidades (Separation of Concerns):**
   - A aplicação segue o padrão MVC (Model-View-Controller), onde cada componente tem uma responsabilidade específica: o Model (Modelo) representa os dados e a lógica de negócios, o Controller (Controlador) lida com a interação do usuário e o fluxo de controle, e a View (Visão) apresenta os dados ao usuário.
   - Além disso, a camada de lógica de negócios foi subdividida em **Model, Repository e Service**, garantindo uma separação clara entre a representação dos dados, a persistência e a manipulação dos mesmos.

2. **Design Patterns (Padrões de Projeto):**
   - O padrão Repository foi utilizado para encapsular a lógica de persistência de dados em objetos separados, facilitando a manutenção e a testabilidade do código.
   - A utilização de Service Objects (Objetos de Serviço) permite encapsular a lógica de negócios em classes específicas, tornando o código mais modular e reutilizável.
   - O uso de Transactions (Transações) em operações de banco de dados garante a atomicidade das operações e a consistência dos dados.

3. **Injeção de dependência**
     - A injeção de dependência é aplicada para promover a modularidade e a flexibilidade do código, permitindo a substituição de implementações e mudanças de comportamento sem modificar o código existente.

4. **Test-Driven Development (Desenvolvimento Orientado a Testes - TDD):**
   - Todos os componentes da aplicação possuem testes unitários escritos utilizando o framework RSpec, garantindo que as funcionalidades se comportem conforme o esperado e que futuras alterações não quebrem o funcionamento existente.
   - O TDD promove uma abordagem incremental para o desenvolvimento de software, onde os testes são escritos antes da implementação do código, o que ajuda a garantir a qualidade do software desde o início do processo de desenvolvimento.
   - Como os todos os componentes da aplicação possuem testes unitários, a API conta com uma cobertura de mais de 75 testes.

5. **Tratamento de Exceções e Internacionalização:**
   - O código inclui tratamento de exceções para lidar com situações de erro de forma robusta e garantir uma experiência de usuário consistente.
   - O uso da gem I18n para internacionalização permite a tradução de mensagens de erro e avisos, tornando a aplicação mais acessível para usuários de diferentes idiomas.
   - Os idiomas disponíveis hoje são o português e o inglês.

6. **Autenticação JWT (JSON Web Tokens):**
   - A aplicação utiliza autenticação JWT para garantir a segurança das rotas e dos dados transmitidos entre o cliente e o servidor.
   - O JWT é empregado para autenticar **psicólogos** e autorizar o acesso a recursos protegidos da aplicação.
   - Essa abordagem oferece uma maneira segura e escalável de gerenciar a autenticação e a autorização na aplicação.


### Requisitos:

1. **Autenticação como psicólogo:**

2. **Cadastro de Avaliados:**

3. **Visualização de Instrumentos Aplicados:**

4. **Aplicação de Instrumentos:**

5. **Envio de E-mail ao Distribuir Instrumento:**

6. **Acesso aos Resultados por parte do Psicólogo:**

7. **Execução do Instrumento por parte do Avaliado:**

8. **Preenchimento de Dados pelo Avaliado:**

9. **Início do Instrumento pelo Avaliado:**


### Importante:
- As requisições a API deverão ser feitas através de um cliente como Postman ou Insôminia
- Esse passo a passo é o "caminho feliz" do fluxo da aplicação. Fique a vontade para sobrecarregar a API com cenários de testes manuais como um verdadeiro usuário (o melhor QA que existe xD)
- Sinta-se a vontade para ler os casos de testes unitaŕios e testá-los manualmente, já que ele aborda várias possibilidades e em como a API lidaria com elas, funcionando assim como uma verdadeira documenação dinâmica da aplicação.
- Uma branch com **Docker** será disponibilzada caso você tenha o **Docker** instalado, a aplicação está rodando no **localhost:3000**. Porém se você tiver problemas para subir a aplcição ou acessá-la após dar um docker compose up no container, use branch **main** e rode **rails server** para subir a aplicação. O nome da branch com docker configurado é **docker** :D
- Caso opte por rodar na branch **main** você deverá ter o **Ruby 3.1.2**, **Rails 7.1.3** e **Postgres lastest** version para subir a aplicação.

### COMO TESTAR

1. **Cadastro Psicólogo:**

    Antes de executar qualquer ação na aplicação, você deve cadastrar-se como psicólogo e autenticar-se. Para isso, siga as etapas abaixo:

    - Acesse a rota:
       ```
       http://localhost:3000/psychologists
       ```

    - Selecione o método HTTP:
       **POST**

    - Insira os dados para cadastro de psicólogo no corpo da requisição, por exemplo:
       ```json
       {
           "psychologist": {
               "name": "Alfredo",
               "password": "123456",
               "password_confirmation": "123456"
           }
       }
       ```

    - Envie a requisição. Se tudo ocorrer bem, os dados da criação serão retornados.

2. **Autenticação como Psicólogo:**

    Para autenticar-se como psicólogo, siga estas etapas:

    - Acesse a rota:
       ```
       http://localhost:3000/login
       ```

    - Selecione o método HTTP:
       **POST**

    - Insira os dados para autenticação do psicólogo que você cadastrou:
       ```json
       {
           "name": "Alfredo",
           "password": "123456"
       }
       ```

    - Se tudo ocorrer bem, você receberá um token JWT semelhante a este:
       ```json
       {
           "token": "eyJhbGciOiJIUzI1NiJ9.eyJwc3ljaG9sb2dpc3RfaWQiOjF9.r4d6vNX4pKk_tLXxKMA0hCeUxjo6j1q-kPYHOEzn9AU"
       }
       ```

    - Parabéns, você está autenticado como psicólogo.

3. **Cadastro Avaliado:**

    Antes de cadastrar um avaliado, assegure-se de ter o token JWT do psicólogo e siga estas etapas:

    - Copie o token recebido e vá para a aba **Headers**.

    - No campo **Key**, digite:
       ```
       Authorization
       ```

    - No campo **Value**, digite:
       ```
       Bearer <seu_token_jwt_aqui>
       ```
       Substitua `<seu_token_jwt_aqui>` pelo token que você recebeu ao autenticar como psicólogo.

    - Volte para a aba **Body** e acesse a rota:
       ```
       http://localhost:3000/evaluateds
       ```

    - Selecione o método HTTP:
       **POST**

    - Insira os dados para cadastro do avaliado no corpo da requisição, por exemplo:
       ```json
       {
           "evaluated": {
               "name": "William",
               "email": "williambible@gmail.com",
               "cpf": "529.982.247-25",
               "birthdate": "10/09/2000"
           }
       }
       ```

    - Se tudo ocorrer bem, os dados do usuário deverão ser retornados.

4. **Cadastro de Instrumento:**

    - Acesse a rota:
       ```
       http://localhost:3000/instruments
       ```

    - Selecione o método HTTP:
       **POST**

    - Insira os dados para cadastro de instrumento no corpo da requisição, por exemplo:
       ```json
       {
         "instrument": {
           "title": "Title of first instrument",
           "description": "Description of first instrument"
          }
       }
       ```

    - Envie a requisição. Se tudo ocorrer bem, os dados da criação serão retornados.

5. **Associar um instrumento a um avaliado:**

    - Acesse a rota:
       ```
       http://localhost:3000/evaluateds/1/assign_instrument
       ```

      Substitua o 1 pelo ID do usuário que você deseja associar.

    - No corpo da requisição, coloque:
       ```
       {
          "instrument_id": 2
       }
       ```

      Substitua o 2 pelo ID do instrumento que você deseja associar.

    - Se tudo der certo, a requisição retornará o avaliado e os instrumentos associados a ele.

6. **Email para o Avaliado:**

    - Após associar um instrumento a um avaliado, verifique o log da aplicação no terminal do seu VSCode.
      
    - Você verá algo semelhante a isso:
      ```
      Rendering layout layouts/mailer.html.erb
        Rendering notifier_mailer/instrument_assigned_email.html.erb within layouts/mailer
        Rendered notifier_mailer/instrument_assigned_email.html.erb within layouts/mailer (Duration: 0.0ms | Allocations: 14)
        Rendered layout layouts/mailer.html.erb (Duration: 0.3ms | Allocations: 109)
      NotifierMailer#instrument_assigned_email: processed outbound mail in 1.6ms
      Delivered mail 6629ec8260920_17fce29e0-324@francisco-IdeaPad-3-15ALC6.mail (2004.5ms)
      Date: Thu, 25 Apr 2024 02:39:14 -0300
      From: from@example.com
      To: williambible@gmail.com
      Message-ID: <6629ec8260920_17fce29e0-324@francisco-IdeaPad-3-15ALC6.mail>
      Subject: Instrument Assigned
      Mime-Version: 1.0
      Content-Type: text/html;
       charset=UTF-8
      Content-Transfer-Encoding: 7bit
      
      <!DOCTYPE html>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
          <style>
            /* Email styles need to be inline */
          </style>
        </head>
      
        <body>
          <!DOCTYPE html>
      <html>
      <head>
        <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
      </head>
      <body>
        <h1>Instrument Assigned</h1>
        <p>An instrument has been assigned to you.</p>
        <p>Fill it on: <a href="http://mocklink">http://mocklink</a></p>
      </body>
      </html>
      
        </body>
      </html>
      ```

    - Acesse a rota no seu navegador para ver o corpo do email:
      ```
      http://localhost:3000/rails/mailers/notifier
      ```
      
    - Clique no link e você verá o corpo do email.

    - O email é enviado para o email do avaliado que teve o instrumento associado.

    - Devido à necessidade de um domínio válido para o envio de emails, a aplicação apenas simula esse envio. Caso um domínio válido seja adicionado, o email será enviado.

 7. **Visualizar Avaliado e os Instrumentos Associados a Ele:**

    - Acesse a rota:
      ```
      http://localhost:3000/evaluateds/1/show_evaluted_and_related_instruments
      ```

      Substitua o ID pelo do usuário que você deseja ver.

    - Selecione o método HTTP:
      **GET**
   
    - Envie a requisição. Se tudo der certo, você verá os dados do avaliado e os instrumentos associados a ele.

8. **Adicionando Perguntas ao Instrumento:**

   - Acesse a rota:
     ```
     http://localhost:3000/questions
     ```
   
   - Selecione o método HTTP:
     **POST**

   - No corpo da requisição, coloque:
     ```json
     {           
       "question": {
           "instrument_id": 1,
           "content": "Is Rails an awesome stack to work with?"
          }
     }
     ```

   - Para ter certeza de que a pergunta foi corretamente associada com um instrumento, selecione a rota:
     ```
     http://localhost:3000/instruments/2
     ```

    - Selecione o método HTTP:
       **GET**

    - Você receberá a resposta contendo o instrumento, as perguntas associadas a ele e as respostas associadas a pergunta.

9. **Adicionando Respostas às Perguntas de um Instrumento:**

   - As ações relacionadas a perguntas são as únicas ações que podem ser realizadas sem autenticação, tendo em vista que são destinadas a um avaliado responder.

   - Acesse a rota:
     ```
     http://localhost:3000/answers
     ``` 

   - Selecione o método HTTP:
     **POST**

   - No corpo da requisição, coloque:
     ```json
     {           
        "answer": {
            "question_id": 1,
            "content": "Totally, Rails is an amazing language to work with"
          }
     }
     ```

   - Se tudo der certo, a pergunta e a resposta retornarão no corpo da requisição.

   - Para ter certeza de que as perguntas e respostas estão associadas corretamente com um instrumento, selecione a rota:
     ```
     http://localhost:3000/instruments/2
     ```

    - Selecione o método HTTP:
       **GET**

    - Você receberá a resposta contendo o instrumento, as perguntas associadas a ele e as respostas associadas a pergunta.

   - Se a quantidade de perguntas for a mesma quantidade de respostas, o instrumento mudará seu atributo status de **pendente** para **done**.

### EXTRAS

**Avaliados**

1. Ver todos os avaliados: 

   - Método HTTP: GET
   - Rota: `http://localhost:3000/evaluateds`
   
2. Ver avaliado específico:

   - Método HTTP: GET
   - Rota: `http://localhost:3000/evaluateds/:ID`
   
3. Atualizar avaliado:

   - Método HTTP: PUT
   - Rota: `http://localhost:3000/evaluateds/:ID`
   - Corpo da requisição, exemplo:
     ```json
     {
        "evaluated": {
           "name": "William updated"
        }
     }
     ```
     - Ou use qualquer outro atributo que você queira atualizar

4. Deletar avaliado:

   - Método HTTP: DELETE
   - Rota: `http://localhost:3000/evaluateds/:ID`


**Instrumentos**

1. Ver todos os instrumentos: 

   - Método HTTP: GET
   - Rota: `http://localhost:3000/instruments`

2. Ver instrumento específico:

   - Método HTTP: GET
   - Rota: `http://localhost:3000/instruments/:ID`

3. Atualizar instrumento:

   - Método HTTP: PUT
   - Rota: `http://localhost:3000/instruments/:ID`
   - Corpo da requisição, exemplo:
     ```json
     {
        "instrument": {
           "title": "Title updated"
        }
     }
     ```
     - Ou use qualquer outro atributo que você queira atualizar

4. Deletar instrumento:

   - Método HTTP: DELETE
   - Rota: `http://localhost:3000/instruments/:ID`

**Perguntas**

3. Atualizar pergunta:

   - Método HTTP: PUT
   - Rota: `http://localhost:3000/questions/:ID`
   - Corpo da requisição, exemplo:
     ```json
     {
        "question": {
           "content": "This content has been updated"
        }
     }
     ```
     - Ou use qualquer outro atributo que você queira atualizar

4. Deletar pergunta:

   - Método HTTP: DELETE
   - Rota: `http://localhost:3000/pergunta/:ID`

### Considerações finais

- Tome o tempo necessário para ler essa documentação e testar a aplicação.
- Não se limite ao passo a passo de testes aqui, tente quebrar a aplicação e testar as validações e regras de negócio.
- Use os testes e os models para entender plenamente cada domínio da aplicação e como eles interagem um com o outro e suas regras.
- Caso haja qualquer dúvida ou erro no passo a passo de testes, ou sugestões para melhorias, não guarde para si, entre em contato comigo pelo email: franciscosantanaalvesleite@gmail.com ou abra um PR com as correções se desejar :D

