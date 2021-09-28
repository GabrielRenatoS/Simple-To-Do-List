using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Newtonsoft.Json;
using ToDoList.Models; 

namespace ToDoList.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ToDoTaskController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public ToDoTaskController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        public JsonResult Get()
        {
            using SqlConnection sql = new SqlConnection(_configuration.GetConnectionString("ToDoListAppConn"));
            using (SqlCommand cmd = new SqlCommand("SelectAllTasks", sql))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                var response = new List<ToDoTask>();
                sql.Open();

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        response.Add(new ToDoTask()
                        {
                            Id = (int)reader["id"],
                            Description = (string)reader["description"],
                            IsFinished = (bool)reader["isFinished"]
                        });
                    }
                }
                sql.Close();

                return new JsonResult(response);
            }
        }

        [HttpPost]
        public async Task Post(ToDoTask newTask) 
        {
            using SqlConnection sql = new SqlConnection(_configuration.GetConnectionString("ToDoListAppConn"));
            using (SqlCommand cmd = new SqlCommand("AddTask", sql))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@DESCRIPTION", newTask.Description));
                cmd.Parameters.Add(new SqlParameter("@ISFINISHED", newTask.IsFinished));
                await sql.OpenAsync();
                await cmd.ExecuteNonQueryAsync();
                await sql.CloseAsync();


                //return new JsonResult("Task added successfully!");
                return;
            }
        }

        [HttpPut]
        public async Task Update(ToDoTask updatedTask) 
        {
            using SqlConnection sql = new SqlConnection(_configuration.GetConnectionString("ToDoListAppConn"));
            using (SqlCommand cmd = new SqlCommand("UpdateTask", sql))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@ID", updatedTask.Id));
                cmd.Parameters.Add(new SqlParameter("@DESCRIPTION", updatedTask.Description));
                cmd.Parameters.Add(new SqlParameter("@ISFINISHED", updatedTask.IsFinished));
                await sql.OpenAsync();
                await cmd.ExecuteNonQueryAsync();
                await sql.CloseAsync();

                return;
            }
        }

        [HttpDelete("{taskId:int}")]
        public async Task Delete(int taskId)
        {
            using SqlConnection sql = new SqlConnection(_configuration.GetConnectionString("ToDoListAppConn"));
            using (SqlCommand cmd = new SqlCommand("DeleteTask", sql))
            {
                Console.WriteLine("Begin Delete");

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@ID", taskId));
                await sql.OpenAsync();
                await cmd.ExecuteNonQueryAsync();
                await sql.CloseAsync();
                Console.WriteLine("Finish Delete");
                return;
            }
        }
    }
}
