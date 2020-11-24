<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CONTACT DASHBOARD</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/user.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>

<!-- Navbar -->
    <div id="secondBar" style="background-color:grey;"></div>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header"><a class="navbar-brand navbar-link" href="#"><i class="glyphicon glyphicon-wrench"></i></a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="active" role="presentation"><a href="#"></a></li>
                    <li style="padding-top:2px;" role="presentation"><a style="padding-top:0px; margin:5px 7px 0px 7px; color:white;" href="#"><i class="fa fa-home" style="font-size:20px;" ></i></br>HOME</a></li>
					<li style="padding-top:2px;" role="presentation"><a style="padding-top:0px; margin:5px 5px 0px 5px; color:white;" href="#"><i class="fa fa-address-book" style="font-size:20px; color:#006b99;"></i></br>CONTACTS</a></li>
					<li style="padding-top:2px;" role="presentation"><a style="padding-top:0px; margin:5px 5px 0px 5px; color:white;" href="#"><i class="fa fa-automobile" style="font-size:20px;"></i></br>VEHICLES</a></li>
					<li style="padding-top:2px;" role="presentation"><a style="padding-top:0px; margin:5px 5px 0px 5px; color:white;" href="#"><i class="fa fa-cubes" style="font-size:20px;"></i></br>PRODUCTS</a></li>
					<li style="padding-top:2px;" role="presentation"><a style="padding-top:0px; margin:5px 5px 0px 5px; color:white;" href="#"><i class="fa fa-drivers-license" style="font-size:20px;"></i></br>INVOICES</a></li>
					
                </ul>
				<ul class="nav navbar-nav" style="float:right;">
					<li style="padding-top:2px;" role="presentation"><a style="padding-top:0px; margin:5px 5px 0px 5px; color:white;" href="#"><i class="fa fa-refresh" style="font-size:20px;"></i></br>REFRESH</a></li>
					<li style="padding-top:2px;" role="presentation"><a style="padding-top:0px; margin:5px 5px 0px 5px; color:white;" href="#"><i class="fa fa-info-circle" style="font-size:20px;"></i></br>HELP</a></li>
                </ul>
            </div>	
        </div>
	</nav>
	
<!-- Sidebar -->
    <ul class="nav nav-pills nav-stacked sidebar">
        <li class="active"><a href="#" class="sideItem1">Menu </a></li>
        <li><a href="#" class="sideItem">Dashboard </a></li>
        <li><a href="#" class="sideItem"><span style="padding-left:15px">Add supplieromer </span></a></li>
        <li><a href="#" class="sideItem"><span style="padding-left:15px">Add Supplier </span></a></li>
        <li><a href="#" class="sideItem"><span style="padding-left:15px">Add Employee </span></a></li>
		<hr>
        <li><a href="#" class="sideItem">Contacts </a></li>
    </ul>
	
<!-- Breadcrumb -->
    <div class="main-content" >
        <ol class="breadcrumb">
			<li><a><span style="color:#006b99;">DASHBOARD</span></a></li>
			<li><a><span>CONTACTS</span></a></li>
        </ol>
	
<!-- Menu Strip -->
	<div id="menuStrip">
		<div style="margin-top: 15px;">
			<span><i class="fa fa-address-book" style="font-size:24px;"></i></span><span style="padding-left:10px;"><b>CONTACTS<b></span>
		</div>
		<hr style="margin-bottom:7px; margin-top:3px;">         
	</div>

<!--Select contact -->
	<div class="w3-bar select-contact">
		<a href="#" role="button" class="w3-button w3-dark-grey btn btn1"><li class="fa fa-child"></li> ALL</a>
		<a href="#"role="button" class="w3-button w3-dark-grey btn btn1"><li class="fa fa-group"></li> supplierOMER</a>
		<a href="#"role="button" class="w3-button w3-dark-grey btn btn1"><li class="fa fa-address-card"></li> EMPLOYEE</a>
		<a href="#"role="button" class="w3-button w3-dark-grey btn btn1"><li class="fa fa-truck"></li> SUPPLIER</a>
		<a role="button" class="w3-button w3-disable"></a>
	</div>
	
<!-- Diplaying table -->

	<div class="table-main">			
			<div class="table-heading">
				<span style="margin: 15px 10px ">ALL</span>
				<div id="left-content">
					
						<input style="border-radius: 5px;" class="" type="text" placeholder="Search.." name="search">
						<button style="border-radius: 5px;" type="submit" name="submit"><i class="fa fa-search"></i></button>
					
				</div>
			</div>
<!-- Table content from db -->
        
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333"  HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing"  >
            <Columns>
                <asp:TemplateField HeaderText="Edit Tools">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("cust_ID") %>'>Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer ID">
                    <EditItemTemplate>
                        <b>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("cust_ID") %>'></asp:TextBox>
                        </b>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("cust_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <b>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("cust_name") %>'></asp:TextBox>
                        </b>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("cust_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Surname">
                    <EditItemTemplate>
                        <b>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </b>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("cust_surname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <b>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </b>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("cust_email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cellphone No">
                    <EditItemTemplate>
                        <b>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </b>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("cust_cellphoneNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telephone No">
                    <EditItemTemplate>
                        <b>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </b>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("cust_telephoneNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Attention">
                    <EditItemTemplate>
                        <b>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </b>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("cust_attention") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        <asp:Label ID="lblReport" runat="server" Text="Report"></asp:Label>

	</div>


    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
    </b></b>
    </div>
</asp:Content>
