using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace Ingreso
{
    public class AcesoDatos
    {

        public DataTable Regresaunatabla(String SQl)
        {
            DataTable content = new DataTable();

            MySql.Data.MySqlClient.MySqlConnection Cnn = new MySql.Data.MySqlClient.MySqlConnection(ConfigurationManager.ConnectionStrings["CNN"].ToString());
            MySql.Data.MySqlClient.MySqlCommand Cmd = new MySql.Data.MySqlClient.MySqlCommand(SQl,Cnn);
            MySql.Data.MySqlClient.MySqlDataAdapter Adpt = new MySql.Data.MySqlClient.MySqlDataAdapter(Cmd);
            Adpt.Fill(content);

            return content;
        }
        public string Regresaunregistro(String SQL)
        {
            DataTable content = new DataTable();
            string respuesta = "";
            try
            {
                MySql.Data.MySqlClient.MySqlConnection Cnn = new MySql.Data.MySqlClient.MySqlConnection(ConfigurationManager.ConnectionStrings["CNN"].ToString());
                MySql.Data.MySqlClient.MySqlCommand Cmd = new MySql.Data.MySqlClient.MySqlCommand(SQL, Cnn);
                MySql.Data.MySqlClient.MySqlDataAdapter Adapt = new MySql.Data.MySqlClient.MySqlDataAdapter(Cmd);
                Adapt.Fill(content);

                foreach (DataRow rw in content.Rows)
                {
                    respuesta = rw[0].ToString();
                    break;
                }
            }
            catch (Exception ed)
            {
                Helper.RegistrarEvento("En funcion Regresunregistro : " + ed.Message);
              
            }

 
            return  respuesta;
        }
        public void Ejecutar(string sql)
        {
            MySql.Data.MySqlClient.MySqlConnection Cnn = new MySql.Data.MySqlClient.MySqlConnection(ConfigurationManager.ConnectionStrings["CNN"].ToString());
            try

            {
                
                MySql.Data.MySqlClient.MySqlCommand Cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, Cnn);
                Cnn.Open();
                Cmd.ExecuteNonQuery();
                Cnn.Close();

            }
            catch (Exception ed)
            {
                Helper.RegistrarEvento("En funcion Regresunregistro : " + ed.Message);
                Cnn.Close();
            }
        }
        
    }
}