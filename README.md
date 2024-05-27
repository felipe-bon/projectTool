# Gerenciador de projetos que usa metodologias ageis de maneira compartilhada.

É uma ferramenta para gerenciar projetos de software de forma compartilhada, utilizando metodologias ágeis.

Um usuário pode criar ou entrar em um projeto existente, cada projeto possui um quadro Scrum em que os integrantes do projeto podem visualizar as tarefas, e de acordo com as permições de cada cargo, podem adicionar tarefas, nomear responsáveis por tarefas entre outras funcionalidades.


# Tecnologias


Este é um projeto feito utilizando o framework **Ruby on Rails, JavaScript, HTML, CSS, e postgreSQL**. 

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/ruby/ruby-original.svg" width=50 /><img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rails/rails-original-wordmark.svg" width=50 /><img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg" width=50 /><img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg" width=50 /><img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg" width=50 /><img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-original-wordmark.svg" width=50 />

</br>

# Informações Técnicas

Para o desenvolvimento deste software foi usada a linguagem Ruby juntamente com o framework Ruby on Rails, html e css para o front-end, para a persistência dos dados foi usado o banco de dados relacional SQLite3 e posteriormente substituído pelo postgreSQL.

A arquitetura do projeto segue o padrão MVC (Model-View-Controller), assim o projeto está separado em camadas de modelo, view e controller.

## Model

 A camada de modelo é representada pela pasta model onde se guarda os arquivos que descrevem as relações e representam as tabelas do banco de dados relacional. 

## Controller

A camada de controle é representada pela pasta Controller, que contém arquivos controller.rb para cada modelo (como projetos_controller.rb, tarefas_controller.rb, profiles_controller.rb). Cada controlador atua como intermediário entre o modelo e a visão, processando entradas do usuário e coordenando operações no modelo. Além dos controladores vinculados a modelos, o projeto inclui controladores independentes, como o controlador da home e o application_controller.rb, que é padrão do framework.

## View

As pastas de view tem subpastas relacionadas aos nomes de cada modelo, cada subpasta guarda arquivos .html.erb que são views ou componentes das view que permite a visualização de um específico modelo e interação com o usuário por meio de formulários.

## Persistência de Dados

Além das camadas que compõem o padrão MVC, o projeto possui uma camada adicional encarregada da persistência dos dados. Essa camada é representada pela pasta "db", que contém os schemas para a criação das tabelas no banco de dados, sendo este postgreSQL. As tabelas, por sua vez, são representadas pelos modelos do projeto.

# Modelo Relacional

<img src="/assetsReadme/DiagramaModeloRelacional.png" width=1000 />

# Recursos

- Registro e autenticação de usuário com **devise**.
- Usuários podem criar projetos ou ingressar em projetos existentes.
- Cada usuário pode ingressar em um projeto como **dev**, **scrum master** ou **product owner**.
- Dentro de um projeto o scrum master pode criar, editar e deletar uma tarefa.
- Cada tarefa possui uma pessoa responsável por ela, e apenas o responsável pode avançar a tarefa no quadro Scrum.
- Product owner pode escrever user stories (ainda não foi feito).
- Todos os integrantes de um projeto podem ver o quadro Scrum.


