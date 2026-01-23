using Blog.Config;
using Blog.Models;
using Blog.Querys;
using Dapper;
using Microsoft.Data.SqlClient;

using var connection = new SqlConnection(Config.ConnectionString);

var userQuery = new UserQuery(connection);

//########################################################
var users = await userQuery.GetAllAsync();
foreach (var u in users)
{
    Console.WriteLine($"User: {u.Id},  Email: {u.Email}");
}
//########################################################
var user = await userQuery.GetByIdAsync(1);
Console.WriteLine(user.Email);

//########################################################
var userInsert = new User()
{
    Name = "testando insert",
    Bio = "teste de insert",
    Image = "http://",
    Email = "helloinsert@gmail.com",
    PasswordHash = "HASH",
    Slug = "Insert-teste-2"
};
userQuery.CreateAsync(userInsert);

//########################################################
await userQuery.UpdateAsync(userInsert);

//########################################################
await userQuery.DeleteAsync(3);