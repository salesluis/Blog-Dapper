using Blog.Config;
using Microsoft.Data.SqlClient;

using var connection = new SqlConnection(Config.ConnectionString);