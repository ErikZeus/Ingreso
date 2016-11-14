<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="Register.aspx.cs" Inherits="Ingreso.Register" %>

<asp:content id="ClientArea" contentplaceholderid="MainContent" runat="server">
    <div class="accountHeader">
    <h2>Crear una Cuenta</h2>
    <p style="color:red">
      <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
</div>
<dx:ASPxTextBox ID="tbUsuario" runat="server" Width="300px" Caption="Nombre de Usuario">
  <CaptionSettings Position="Top" />
  <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
    <RequiredField ErrorText="Usuario es requerido." IsRequired="true" />
  </ValidationSettings>
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="tbEmail" runat="server" Width="300px" Caption="E-mail">
  <CaptionSettings Position="Top" />
  <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
    <RequiredField ErrorText="E-mail es requerido." IsRequired="true" />
    <RegularExpression ErrorText="Email validation failed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
  </ValidationSettings>
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server" Width="300px" Caption="Password">
  <CaptionSettings Position="Top" />
  <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
    <RequiredField ErrorText="Password es requerido." IsRequired="true" />
  </ValidationSettings>
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="tbCPassword" Password="true" runat="server" Width="300px" Caption="Confirmar password">
  <CaptionSettings Position="Top" />
  <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
    <RequiredField ErrorText="Confirmar Password es requerido." IsRequired="true" />
  </ValidationSettings>
  <ClientSideEvents Validation="function(s, e) {
            var originalPasswd = Password.GetText();
            var currentPasswd = s.GetText();
            e.isValid = (originalPasswd  == currentPasswd );
            e.errorText = 'El password y la confirmación del password deben ser iguales.';
        }" />
</dx:ASPxTextBox>
<br />
<dx:ASPxButton ID="btnCreateUser" runat="server" Text="Crear Usuario" ValidationGroup="RegisterUserValidationGroup"
    OnClick="btnCreateUser_Click">
</dx:ASPxButton>
</asp:content>