using Blog.Models;
using Dapper.Contrib.Extensions;
using Microsoft.Data.SqlClient;

namespace Blog.Querys;

public class UserQuery
{
    private readonly SqlConnection _connection;
    public UserQuery(SqlConnection connection)
    {
        _connection = connection;
    }
    public async Task<IEnumerable<User>> GetAllAsync()
    {
        var users = await _connection.GetAllAsync<User>();
        return users;
    }

    public async Task<User> GetByIdAsync(int id)
    {
        var user = await _connection.GetAsync<User>(id);
        return user;
    }
    public async Task CreateAsync(User user)
    {
        await _connection.InsertAsync<User>(user);
        Console.WriteLine($"[{DateTime.UtcNow}] usuário {user.Name} cadastrado com sucesso!");
    }
    
    public async Task UpdateAsync(User user)
    {
        await _connection.UpdateAsync<User>(user);
        Console.WriteLine($"[{DateTime.UtcNow}] usuário {user.Name} Atualizado com sucesso!");
    }
    public async Task DeleteAsync(int idToBeDeleted)
    {
        var user = await _connection.GetAsync<User>(idToBeDeleted);
        await _connection.DeleteAsync<User>(user);
        Console.WriteLine($"[{DateTime.UtcNow}] usuário {user.Name} Atualizado com sucesso!");
    }
}