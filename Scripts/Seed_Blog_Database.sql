USE [Blog]
GO

-------------------------------------------------
-- ROLE
-------------------------------------------------
INSERT INTO [Role] ([Name], [Slug]) VALUES
('Administrador', 'admin'),
('Autor', 'author'),
('Leitor', 'reader');

-------------------------------------------------
-- CATEGORY
-------------------------------------------------
INSERT INTO [Category] ([Name], [Slug]) VALUES
    ('Tecnologia', 'tecnologia'),
    ('Programação', 'programacao'),
    ('Banco de Dados', 'banco-de-dados');

-------------------------------------------------
-- TAG
-------------------------------------------------
INSERT INTO [Tag] ([Name], [Slug]) VALUES
    ('CSharp', 'csharp'),
    ('DotNet', 'dotnet'),
    ('SQL Server', 'sql-server'),
    ('Backend', 'backend'),
    ('Frontend', 'frontend'),
    ('Arquitetura', 'arquitetura'),
    ('Boas Práticas', 'boas-praticas'),
    ('Performance', 'performance');

-------------------------------------------------
-- USER
-------------------------------------------------
INSERT INTO [User]
([Name],[Email],[PasswordHash],[Bio],[Image],[Slug])
VALUES
    ('Luis Silva','luis@blog.com','HASH001','Administrador do sistema','https://img.com/1.png','luis-silva'),
    ('Maria Souza','maria@blog.com','HASH002','Autora de tecnologia','https://img.com/2.png','maria-souza'),
    ('João Lima','joao@blog.com','HASH003','Desenvolvedor backend','https://img.com/3.png','joao-lima'),
    ('Ana Costa','ana@blog.com','HASH004','Engenheira de software','https://img.com/4.png','ana-costa'),
    ('Pedro Rocha','pedro@blog.com','HASH005','Entusiasta .NET','https://img.com/5.png','pedro-rocha'),
    ('Carla Mendes','carla@blog.com','HASH006','Dev Fullstack','https://img.com/6.png','carla-mendes'),
    ('Rafael Alves','rafael@blog.com','HASH007','Arquiteto de software','https://img.com/7.png','rafael-alves'),
    ('Juliana Pires','juliana@blog.com','HASH008','Leitora técnica','https://img.com/8.png','juliana-pires'),
    ('Bruno Nogueira','bruno@blog.com','HASH009','Backend sênior','https://img.com/9.png','bruno-nogueira'),
    ('Fernanda Lopes','fernanda@blog.com','HASH010','Analista de sistemas','https://img.com/10.png','fernanda-lopes');

-------------------------------------------------
-- USER ROLE
-------------------------------------------------
-- Autor
INSERT INTO [UserRole] ([UserId],[RoleId]) VALUES
    (1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(9,2);

-- Admin
INSERT INTO [UserRole] ([UserId],[RoleId]) VALUES
    (1,1);

-- Leitor
INSERT INTO [UserRole] ([UserId],[RoleId]) VALUES
    (8,3),(10,3);

-------------------------------------------------
-- POST
-------------------------------------------------
INSERT INTO [Post]
([CategoryId],[AuthorId],[Title],[Summary],[Body],[Slug])
VALUES
    (1,1,'Post Fake 1','Resumo do post 1','Conteúdo completo do post 1','post-fake-1'),
    (2,2,'Post Fake 2','Resumo do post 2','Conteúdo completo do post 2','post-fake-2'),
    (3,1,'Post Fake 3','Resumo do post 3','Conteúdo completo do post 3','post-fake-3'),
    (1,4,'Post Fake 4','Resumo do post 4','Conteúdo completo do post 4','post-fake-4'),
    (2,5,'Post Fake 5','Resumo do post 5','Conteúdo completo do post 5','post-fake-5'),
    (3,6,'Post Fake 6','Resumo do post 6','Conteúdo completo do post 6','post-fake-6'),
    (1,7,'Post Fake 7','Resumo do post 7','Conteúdo completo do post 7','post-fake-7'),
    (2,2,'Post Fake 8','Resumo do post 8','Conteúdo completo do post 8','post-fake-8'),
    (3,1,'Post Fake 9','Resumo do post 9','Conteúdo completo do post 9','post-fake-9'),
    (1,9,'Post Fake 10','Resumo do post 10','Conteúdo completo do post 10','post-fake-10'),
    (2,4,'Post Fake 11','Resumo do post 11','Conteúdo completo do post 11','post-fake-11'),
    (3,5,'Post Fake 12','Resumo do post 12','Conteúdo completo do post 12','post-fake-12'),
    (1,6,'Post Fake 13','Resumo do post 13','Conteúdo completo do post 13','post-fake-13'),
    (2,7,'Post Fake 14','Resumo do post 14','Conteúdo completo do post 14','post-fake-14'),
    (3,2,'Post Fake 15','Resumo do post 15','Conteúdo completo do post 15','post-fake-15'),
    (1,1,'Post Fake 16','Resumo do post 16','Conteúdo completo do post 16','post-fake-16'),
    (2,9,'Post Fake 17','Resumo do post 17','Conteúdo completo do post 17','post-fake-17'),
    (3,4,'Post Fake 18','Resumo do post 18','Conteúdo completo do post 18','post-fake-18'),
    (1,5,'Post Fake 19','Resumo do post 19','Conteúdo completo do post 19','post-fake-19'),
    (2,6,'Post Fake 20','Resumo do post 20','Conteúdo completo do post 20','post-fake-20');

-------------------------------------------------
-- POST TAG
-------------------------------------------------
INSERT INTO [PostTag] ([PostId],[TagId]) VALUES
    (1,4),(1,5),
    (2,1),(2,7),
    (3,2),(3,5),
    (4,4),(4,6),
    (5,1),(5,8),
    (6,2),(6,7),
    (7,4),(7,6),
    (8,1),(8,5),
    (9,2),(9,8),
    (10,4),(10,7),
    (11,1),(11,6),
    (12,2),(12,5),
    (13,4),(13,8),
    (14,1),(14,7),
    (15,2),(15,6),
    (16,4),(16,5),
    (17,1),(17,8),
    (18,2),(18,7),
    (19,4),(19,6),
    (20,1),(20,5);
