using System.Data;
using Blog.Abstractions;
using Blog.Models;
using Dapper.Contrib.Extensions;
using Microsoft.Data.SqlClient;

namespace Blog.Repositories;

public class Repository<T>: IRepository<T> where T : class 
{
    private readonly SqlConnection _connection;
    
    public Repository(SqlConnection connection)
        => _connection = connection;
    
    public async Task<IEnumerable<T>> GetAllAsync()
        => await _connection.GetAllAsync<T>();

    public async Task<T> GetByIdAsync(int id)
        =>await _connection.GetAsync<T>(id);
    
    public async Task CreateAsync(T model)
        => await _connection.InsertAsync<T>(model);

    
    public async Task UpdateAsync(T model)
       => await _connection.UpdateAsync<T>(model);
    
    public async Task DeleteAsync(int idToBeDeleted)
    {
        var model = await _connection.GetAsync<T>(idToBeDeleted);
        await _connection.DeleteAsync<T>(model);
    }
}