<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="Login.aspx.cs" Inherits="Ingreso.Login" %>

<asp:Content ID="Content3" runat="server" contentplaceholderid="MainContent">

</asp:Content>


<asp:Content ID="Content4" runat="server" contentplaceholderid="Content">
                   <div >
        <dx:aspxtextbox id="tbUserName" runat="server" Width="300px" caption="User Name" autocompletetype="None" xmlns:dx="devexpress.web">
      <CaptionSettings Position="Top" /> <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text"> <RequiredField ErrorText="El usuario es requerido." IsRequired="true" /> </ValidationSettings> </dx:aspxtextbox>
        <dx:aspxtextbox id="tbPassword" runat="server" password="true" Width="300px" caption="Password" xmlns:dx="devexpress.web">
      <CaptionSettings Position="Top" /> <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text"> <RequiredField ErrorText="El password es requerido." IsRequired="true" /> </ValidationSettings> </dx:aspxtextbox>
        <asp:Label ID="lblMensaje" runat="server" Enabled="False" ForeColor="#CC0000" Text="."></asp:Label>
        <br />

        <br />
    </div>
    <div>
        <div>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Pruebe que no es un robot, complete el captcha.">
            </dx:ASPxLabel>
             <br />  <br />
            <asp:TextBox ID="txtimgcode" runat="server" autocomplete="off" Height="20px" Width="150px" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/captcha.Bmp" />
            <br />
            &nbsp;<br />
            <dx:aspxbutton id="ASPxButton1" runat="server" text="Nuevo Captcha" xmlns:dx="devexpress.web" onclick="ASPxButton1_Click" height="21px" width="114px"></dx:aspxbutton>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <br />
            <asp:Label ID="lblMsgCaptcha" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

            <br />
            <br />
        </div>
        <dx:aspxbutton id="btnLogin" runat="server"  text="Log In" validationgroup="LoginUserValidationGroup"
            onclick="btnLogin_Click" xmlns:dx="devexpress.web" height="25px" width="114px">
      </dx:aspxbutton>

            <br />
            <br />
            <br />
            <br />
        <div>        

        </div>
    </div>
</asp:Content>






