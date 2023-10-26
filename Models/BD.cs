using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace TP11_ProyectoIntegral.Models;


public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=BDTP11;Trusted_Connection=True;";

    public static bool NuevoUsuario(){
        using (SqlConnection db = New SqlConnection(_connectionString)){
            string sql = "";
        }
    }
}