using Blog.Config;
using Blog.Models;
using Blog.Repositories;
using Dapper;
using Microsoft.Data.SqlClient;

using var connection = new SqlConnection(Config.ConnectionString);

var repository = new Repository<User>(connection);

//########################################################
var models = await repository.GetAllAsync();
foreach (var m in models)
    Console.WriteLine($"User: {m.Id},  Email: {m.Email}");
//########################################################
var model = await repository.GetByIdAsync(1);
Console.WriteLine(model.Email);

//########################################################
var modelInsert = new User()
{
    Name = "testando insert",
    Bio = "teste de insert",
    Image = "http://",
    Email = "helloinsert@gmail.com",
    PasswordHash = "HASH",
    Slug = "Insert-teste-2"
};
await repository.CreateAsync(modelInsert);

//########################################################
await repository.UpdateAsync(modelInsert);

//########################################################
await repository.DeleteAsync(3);