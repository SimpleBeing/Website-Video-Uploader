<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Upload and download file.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Upload and Download.</h2>
    <div class="row">
        <div class="col-md-4">
            <asp:FileUpload ID="FileUpload1" runat="server" Width="272px" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Width="91px"/>
            <br />
            <asp:Button ID="btnDownload" runat="server" OnClick="btnDownload_Click" Text="Download" Width="91px" />
            <br />
            <asp:Button ID="dbDisplay" runat="server" OnClick="dbDisplay_Click" Text="Display" Width="91px" />
        </div>
        <div class="col-md-8">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="File">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("File") %>' CommandArgument='<%# Eval("File") %>' CommandName="Download"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size in Bytes" />
                <asp:BoundField DataField="Type" HeaderText="File Size" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        </div>
    </div>
    <br />
    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
    <p>
        <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
    </p>
    
</asp:Content>
