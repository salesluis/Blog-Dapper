## 📋 Índice

- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Instalação e Configuração](#-instalação-e-configuração)
- [Como Executar](#-como-executar)
- [Modelo de Dados](#-modelo-de-dados)
- [Estrutura do Banco de Dados](#-estrutura-do-banco-de-dados)
- [Contribuindo](#-contribuindo)
- [Licença](#-licença)

O projeto foi desenvolvido seguindo boas práticas de desenvolvimento, utilizando **Dapper** como micro-ORM para acesso eficiente aos dados e **Docker Compose** para facilitar a configuração do ambiente de desenvolvimento.

## 🛠 Tecnologias Utilizadas

- **[.NET 10.0](https://dotnet.microsoft.com/)** - Framework de desenvolvimento
- **[Dapper](https://github.com/DapperLib/Dapper)** (v2.1.66) - Micro-ORM para acesso a dados
- **[Dapper.Contrib](https://github.com/DapperLib/Dapper.Contrib)** (v2.0.78) - Extensões do Dapper
- **[Microsoft.Data.SqlClient](https://github.com/dotnet/SqlClient)** (v6.1.4) - Driver SQL Server para .NET
- **[SQL Server 2019](https://www.microsoft.com/sql-server)** - Banco de dados relacional
- **[Docker](https://www.docker.com/)** - Containerização do banco de dados
- **[Docker Compose](https://docs.docker.com/compose/)** - Orquestração de containers

Antes de começar, certifique-se de ter instalado:

- [.NET SDK 10.0](https://dotnet.microsoft.com/download) ou superior
- [Docker](https://www.docker.com/get-started) e [Docker Compose](https://docs.docker.com/compose/install/)
- Um editor de código (Visual Studio, VS Code, Rider, etc.)
- Git (opcional, para clonar o repositório)

## Instalação e Configuração

### 1. Clone o repositório

```bash
git clone <url-do-repositorio>
cd Blog
```

### 2. ConnectionString já é fornecida e deve funcionar em ambiente de Desenvolvimento

Edite o arquivo `Config/Config.cs` e ajuste a string de conexão apenas SE necessário:

```csharp
public static string ConnectionString =
    "Server=localhost,1433;Database=Blog;User Id=sa;Password=1q2w3e4r@#$;Trusted_Connection=False; TrustServerCertificate=True";
```

### 3. Inicie o Banco de Dados com Docker

O projeto inclui um arquivo `compose.yaml` que configura automaticamente o SQL Server:

```bash
docker compose up -d
```

Este comando irá:

- Iniciar um container SQL Server 2019
- Executar automaticamente os scripts de criação e população do banco
- Expor a porta 1433 para conexão local

### 4. Aguarde a Inicialização

O script `init-database-blog.sh` aguarda o SQL Server estar pronto e então executa:

- Criação do banco de dados `Blog`
- Criação de todas as tabelas e relacionamentos
- População inicial com dados de exemplo

Você pode verificar os logs do container para acompanhar o processo:

```bash
docker compose logs -f mssqltools
```

### 5. Verifique se o Banco foi Criado

Conecte-se ao SQL Server usando suas ferramentas preferidas ou execute:

```bash
docker exec -it <container-id> /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P '1q2w3e4r@#$' -Q "SELECT name FROM sys.databases"
```

## ▶️ Como Executar

### Executar a Aplicação

```bash
dotnet run
```

## 📊 Estrutura do Banco de Dados

### Tabelas

- **User**: Armazena informações dos usuários
- **Role**: Define os papéis disponíveis no sistema
- **UserRole**: Tabela de relacionamento muitos-para-muitos entre User e Role
- **Category**: Categorias de posts
- **Tag**: Tags para classificação de posts
- **Post**: Posts do blog
- **PostTag**: Tabela de relacionamento muitos-para-muitos entre Post e Tag

### Índices

O banco de dados inclui índices otimizados para:

- Busca por email de usuário
- Busca por slug (usuários, categorias, tags, posts)
- Performance em consultas frequentes

## 🔧 Configurações Adicionais

### Variáveis de Ambiente (Recomendado)

Para maior segurança, considere usar variáveis de ambiente:

```bash
export DB_SERVER=localhost,1433
export DB_NAME=Blog
export DB_USER=sa
export DB_PASSWORD=1q2w3e4r@#$
```

E modifique `Config.cs` para ler essas variáveis.

## 📝 Dados Iniciais

O script `Seed_Blog_Database.sql` popula o banco com:

- **3 Roles**: Administrador, Autor, Leitor
- **3 Categorias**: Tecnologia, Programação, Banco de Dados
- **8 Tags**: CSharp, DotNet, SQL Server, Backend, Frontend, Arquitetura, Boas Práticas, Performance
- **10 Usuários**: Com diferentes perfis e roles
- **20 Posts**: Distribuídos entre diferentes autores e categorias

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer um Fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abrir um Pull Request

## 👨‍💻 Autor

Desenvolvido como parte de estudos em desenvolvimento .NET e arquitetura de software.

---

**Desenvolvido usando .NET e Dapper**
