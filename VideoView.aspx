<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="VideoView.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>VideoView</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
    <asp:Button ID="btnPlay" runat="server" OnClick="btnPlay_Click" Text="Play" />
    
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Data/11 Awesome Video Games Nobody Played.mp4"/>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Data/11 Awesome Video Games Nobody Played.mp4" />
    <br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    
</asp:Content>
