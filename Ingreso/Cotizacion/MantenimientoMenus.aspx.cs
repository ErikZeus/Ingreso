using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ingreso
{
    public partial class MantenimientoMenus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                cargarcombos();


            }




        }
        public void cargarcombos()
        {
            AcesoDatos ac = new AcesoDatos();
        GridView1.DataSource = ac.Regresaunatabla("Select indice,  usuario, rol from vendedores where ifnull(status,0) != 0 ");
                GridView1.DataBind();

                GridView2.DataSource = ac.Regresaunatabla("Select * from menu ");
                GridView2.DataBind();

                GridView3.DataSource = ac.Regresaunatabla("Select * from submenu");
                GridView3.DataBind();

                GridView4.DataSource = ac.Regresaunatabla("Select * from roles");
                GridView4.DataBind();

                GridView5.DataSource = ac.Regresaunatabla("Select * from roldetalle");
                GridView5.DataBind();

            this.cboUsuario.DataSource = ac.Regresaunatabla("Select usuario, indice from vendedores where ifnull(status,0) != 0 ");
                cboUsuario.DataTextField = "usuario";
                cboUsuario.DataValueField = "indice";
                this.cboUsuario.DataBind();


                this.cboRol.DataSource = ac.Regresaunatabla("Select rolnombre, indice from roles");
                cboRol.DataTextField = "rolnombre";
                cboRol.DataValueField = "indice";
                this.cboRol.DataBind();

                this.cbMenu.DataSource = ac.Regresaunatabla("Select nombre, indice from menu");
                cbMenu.DataTextField = "nombre";
                cbMenu.DataValueField = "indice";
                this.cbMenu.DataBind();

                this.cbSubMenu.DataSource = ac.Regresaunatabla("Select nombre, indice from submenu");
                cbSubMenu.DataTextField = "nombre";
                cbSubMenu.DataValueField = "indice";
                this.cbSubMenu.DataBind();

                this.cbMenu2.DataSource = ac.Regresaunatabla("Select nombre, indice from menu");
                cbMenu2.DataTextField = "nombre";
                cbMenu2.DataValueField = "indice";
                this.cbMenu2.DataBind();

                this.cdRol2.DataSource = ac.Regresaunatabla("Select rolnombre, indice from roles");
                cdRol2.DataTextField = "rolnombre";
                cdRol2.DataValueField = "indice";
                this.cdRol2.DataBind();

                this.cmbSuMenus.DataSource = ac.Regresaunatabla("Select nombre, indice from submenu");
                cmbSuMenus.DataTextField = "nombre";
                cmbSuMenus.DataValueField = "indice";
                this.cmbSuMenus.DataBind();

                this.cmbRolParaSubMenu.DataSource = ac.Regresaunatabla("Select rolnombre, indice from roles");
                cmbRolParaSubMenu.DataTextField = "rolnombre";
                cmbRolParaSubMenu.DataValueField = "indice";
                this.cmbRolParaSubMenu.DataBind();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string _indice_usuario = this.cboUsuario.SelectedItem.Value.ToString();
                string rol = this.cboRol.SelectedItem.Value.ToString();

                AcesoDatos a = new AcesoDatos();

                a.Ejecutar("update vendedores set rol = '" + rol + "' where indice = '" + _indice_usuario + "'  ");

                Rols.Text = "Rol agregado con exito";
                Rols.DataBind();

             

            }
            catch (Exception es)
            {
                Helper.RegistrarEvento("Asignando Roles. " + es.Message);

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string nom = NomM.Text;
            AcesoDatos a = new AcesoDatos();
            a.Ejecutar("insert into menu (nombre) values('" + nom + "')");
            Menus.Text = "Agregado con exito";
            cargarcombos();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string borrar = this.cbMenu.SelectedItem.Value.ToString();
            AcesoDatos a = new AcesoDatos();
            a.Ejecutar("Delete from menu where indice = '"+borrar+"'");
            Menus.Text = "Borrado con exito";
            cargarcombos();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string nom = NomSub.Text;

            string indi = this.cbMenu2.SelectedItem.Value.ToString();
            string url = Urlt.Text;

            AcesoDatos a = new AcesoDatos();
            a.Ejecutar("insert into submenu (nombre,idmenu,url) values('" + nom + "','"+indi+"','"+url+"')");
            SubMenu.Text = "Agregado con exito";
            cargarcombos();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string borrar = this.cbSubMenu.SelectedItem.Value.ToString();
            AcesoDatos a = new AcesoDatos();
            a.Ejecutar("Delete from submenu where indice = '" + borrar + "'");
            SubMenu.Text = "Borrado con exito";
            cargarcombos();
        }

  


        protected void Button7_Click(object sender, EventArgs e)
        {
            string borrar = this.cdRol2.SelectedItem.Value.ToString();
            AcesoDatos a = new AcesoDatos();
            a.Ejecutar("Delete from roles where indice = '" + borrar + "'");
            Rol2.Text = "Borrado con exito";
            cargarcombos();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string nom = ARol.Text;
            AcesoDatos a = new AcesoDatos();
            a.Ejecutar("insert into roles (rolnombre) values('" + nom + "')");
            Rol2.Text = "Agregado con exito";
            cargarcombos();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string rol = this.cmbRolParaSubMenu.SelectedItem.Value.ToString();
            string submenu = this.cmbSuMenus.SelectedItem.Value.ToString();
            string val = "";

            AcesoDatos a = new AcesoDatos();

            val = a.Regresaunregistro("select count(*) from roldetalle where idrol ='" + rol + "' and idsubmenu ='"+ submenu +"'  ");
            if (val == "0")
            {
                a.Ejecutar("insert roldetalle set idrol = '" + rol + "', idsubmenu = '" + submenu + "'  ");
                lblMensajeAsociarRoles.Text = "Rol agregado con exito";

            }
            else {
                lblMensajeAsociarRoles.Text = "Este submenu ya existe para este rol.";
            }

            lblMensajeAsociarRoles.DataBind();
            cargarcombos();
        }
    }
}