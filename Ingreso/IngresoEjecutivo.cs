using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Ingreso
{
    public class IngresoEjecutivo
    {

        private string UsuarioEjecutivo = "";
        private string Password = "";
        

        public IngresoEjecutivo()
        { }

        public  void Usuario(string _UsuarioEjecutivo)
        {

            this.UsuarioEjecutivo = _UsuarioEjecutivo.Replace("'", "").Replace("/", "").Replace(")", "").Replace("*", "").Replace("--", "");

        }
        public void Contraseña(string _Contraseña)
        {
            this.Password = _Contraseña.Replace("'", "").Replace("/", "").Replace(")", "").Replace("*", "").Replace("--", "");
        }

        public Boolean Validar()
        {
            string validausuario= "";
            string validapassword = "";

            AcesoDatos ac = new AcesoDatos();
            validausuario = ac.Regresaunregistro("Select indice from vendedores where usuario = '"+UsuarioEjecutivo+"' and ifnull(status,0) = 1 ");
            validapassword = ac.Regresaunregistro("Select indice from vendedores where  usuario = '" + UsuarioEjecutivo + "' and password = '" + Password + "'  and ifnull(status,0) = 1 ");
            if (validausuario == validapassword && validausuario != "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static void AgregarV(string usuario, string contraseña, string correo)
        {
            usuario = usuario.Replace("'", "").Replace("/", "").Replace(")", "").Replace("*", "").Replace("--", "");
            contraseña = contraseña.Replace("'", "").Replace("/", "").Replace(")", "").Replace("*", "").Replace("--", "");
            correo = correo.Replace("'", "").Replace("/", "").Replace(")", "").Replace("*", "").Replace("--", "");
 
            AcesoDatos ac = new AcesoDatos();
            ac.Ejecutar("insert into vendedores (usuario,password,correo, status) values('"+usuario+"', '"+contraseña+"', '"+correo+"', 1)");

        }
        public static bool ValidarUsuario(string user)
        {
            bool respuesta = false;
            AcesoDatos ac = new AcesoDatos();
            user = user.Replace("'", "").Replace("/", "").Replace(")", "").Replace("*", "").Replace("--", "");
            string valida = ac.Regresaunregistro("Select count(*) from vendedores where usuario ='"+ user.Trim() + "'  and ifnull(status,0) = 1  ");
            if (valida != "0")
                respuesta = true;

            return respuesta;
        }
          
    }
}