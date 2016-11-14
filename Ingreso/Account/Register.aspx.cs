using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Ingreso.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Text.RegularExpressions;

namespace Ingreso {
    public partial class Register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            
        }

        protected void btnCreateUser_Click(object sender, EventArgs e) {
            //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            //var user = new ApplicationUser() { UserName = tbUserName.Text, Email = tbEmail.Text };
            //IdentityResult result = manager.Create(user, tbPassword.Text);
            //if (result.Succeeded)
            //{
            //    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
            //    //string code = manager.GenerateEmailConfirmationToken(user.Id);
            //    //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
            //    //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

            //    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
            //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //}
            //else
            //{
            //    ErrorMessage.Text = result.Errors.FirstOrDefault();
            //}
            if (tbUsuario.Text == "")
            {
                ErrorMessage.Text = "Ingrese su Usuario";
                return;
            }
            if (tbPassword.Text != tbCPassword.Text)
            {
                ErrorMessage.Text = "Los Password no son iguales";
                return;
            }
            if (tbPassword.Text == "")
            {
                ErrorMessage.Text = "Ingrese un Password";
                return;
            }
            if (tbEmail.Text == "")
            {
                ErrorMessage.Text = "Ingrese un Usuario";
                return;
            }

            if (IngresoEjecutivo.ValidarUsuario(tbUsuario.Text))
            {
                this.ErrorMessage.Text = "Este nombre de usuario ya existe.";
                return;
            }

            if (email_bien_escrito(tbEmail.Text))
            {
                IngresoEjecutivo.AgregarV(tbUsuario.Text, tbCPassword.Text, tbEmail.Text);
                ErrorMessage.Text = "Usuario guardado exitosamente";
                return;
            }






            
        }

        private Boolean email_bien_escrito(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}