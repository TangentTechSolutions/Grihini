﻿<%@ Page Title="" Language="C#" MasterPageFile="~/GUI_Form/Master1.Master" AutoEventWireup="true" CodeBehind="Addtocarttt.aspx.cs" Inherits="Grihini.GUI_Form.Addtocarttt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../CSS/addtocart_jqzoom.css" rel="stylesheet" type="text/css" />
    <script src="../JS/addtocart_one.js" type="text/javascript"></script>
    <script src="../JS/addtocart_two.js" type="text/javascript"></script>
    <script src="../JS/addtocart_three.js" type="text/javascript"></script>
    <script src="../JS/addtocart_four.js" type="text/javascript"></script>

<script type="text/javascript">

    $(function () {

        var table = $('<table></table>');
        table.append('<thead><tr><th class="number">Number</th></tr></thead>');
        var tbody = $('<tbody></tbody>');
        for (var i = 0; i < 100; i++) {
            tbody.append('<tr><td>' + Math.floor(Math.random() * 100) + '</td></tr>');
        }
        table.append(tbody);
        $('.example.ex-2').append(table);

        $('table').tablesort().data('tablesort');

        $('thead th.number').data('sortBy', function (th, td, sorter) {
            return parseInt(td.text(), 10);
        });

    });
</script>


<style type"text/css">

body{margin:0px;padding:0px;font-family:Arial;}
a img,:link img,:visited img { border: none; }
table { border-collapse: collapse; border-spacing: 0; }
:focus { outline: none; }
*{margin:0;padding:0;}
p, blockquote, dd, dt{margin:0 0 8px 0;line-height:1.5em;}
fieldset {padding:0px;padding-left:7px;padding-right:7px;padding-bottom:7px;}
fieldset legend{margin-left:15px;padding-left:3px;padding-right:3px;color:#333;}
dl dd{margin:0px;}
dl dt{}

.clearfix:after{clear:both;content:".";display:block;font-size:0;height:0;line-height:0;visibility:hidden;}
.clearfix{display:block;zoom:1}


ul#thumblist{display:block;}
ul#thumblist li{float:left;margin-right:2px;list-style:none;}
ul#thumblist li a{display:block;border:1px solid #CCC;}
ul#thumblist li a.zoomThumbActive{
    border:1px solid red;
}

.jqzoom{
	text-decoration:none;
	float:left;
}

</style>

<style type="text/css">
	body {
		font: normal 14px/21px Arial, serif;
	}
	.example {
		float: left;
		width: 1024px;

	}
	table {
		font-size: 1em;
		border-collapse: collapse;
		margin: 0 auto
	}
	table, th, td {
		border: 1px solid #999;
		padding: 18px 16px;
		text-align: left;
	}
	th {
		background: #f4f4f4;
		cursor: pointer;
	}

	th:hover,
	th.sorted {
		background: #d4d4d4;
	}

	th.no-sort,
	th.no-sort:hover {
		background: #f4f4f4;
		cursor: not-allowed;
	}

	th.sorted.ascending:after {
		content: "  \2191";
	}

	th.sorted.descending:after {
		content: " \2193";
	}
	.txt{
		float:right;
		font-family:Arial;
		font-size:12px;
		margin:10px 0 0 30px;
	}
		.txt2{
		float:right;
		font-family:Arial;
		font-size:12px;
		margin:10px 0 0 30px;
	}
	.product-details{
		float:left;
		margin:5px 0 0 0;
	}
		.product-details-txt{
			float:left;
			width:200px;
			margin:8px 0 0 30px;
		}
	.product-txt-name{
		font-family:Arial;
		font-size:13px;
		float:left;
		width:200px;
		color:#000;
				}
	.product-txt-size{
		font-family:Arial;
		font-size:13px;
		float:left;
		width:200px;
		color:#999;

				}
				.remove-btn{
					width:200px;
					float:left;
				}
				a{
					text-decoration:none;
				}
			.remove-btn-txt a{
				font-family:Arial;
				font-size:12px;
				float:right;
				color:#06C;

				margin:10px 0 0 0;

				}
			.remove-btn-txt a:hover{
				font-family:Arial;
				font-size:12px;
				float:right;
				color:#039;
				text-decoration:underline;
				margin:10px 0 0 0;
				transition:all 0.6s;
				text-decoration:underline;

				}
				.add2main-txt{
					font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif;
					font-size:16px;
					float:left;
					color:#FFF;
					margin:10px 0 5px 20px;
					font-weight:bold;
				}
	
	</style>
<script type="text/javascript">

    $(document).ready(function () {
        $('.jqzoom').jqzoom({
            zoomType: 'standard',
            lens: true,
            preloadImages: false,
            alwaysOn: false
        });

    });


</script>




<%--<div>
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

</div>--%>
<div>




<div class="wrapper" style="background:none;">
<div class="product">
<div class="main-wrapper" style="height:425px;">

<div style="width:1024px; float:left; height:35px; margin:5px 0 0 0; background-color:#0099CC;">
<div class="add2main-txt">ADD TO CART</div>
        </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="false" EmptyDataText="No Products In Cart"
     AllowSorting="false" Visible="true" Width="1024px" EnableModelValidation="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-BorderColor="Red"
     EmptyDataRowStyle-BackColor="Azure" EmptyDataRowStyle-ForeColor="Red" onrowcommand="griduser_RowCommand">

     

    <Columns>
  <asp:TemplateField HeaderText="ITEM"   ControlStyle-Font-Size="12px"  >
            <ItemTemplate>
            <asp:Label ID="lbl_Item" runat="server" Text='<%#Eval("Product_name") %>'></asp:Label>
            

            </ItemTemplate>
            </asp:TemplateField>

            <asp:ImageField DataImageUrlField="ImageName2" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Preview Image"/>

      

  <asp:TemplateField HeaderText="QTY"   ControlStyle-Font-Size="12px"  >
            <ItemTemplate>
            <asp:Label ID="lbl_QTY" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>

            </ItemTemplate>
            </asp:TemplateField>

  <asp:TemplateField HeaderText="PRICE (Rs.)"   ControlStyle-Font-Size="12px"  >
            <ItemTemplate>
            <asp:Label ID="lbl_PRICE" runat="server" text='<%#Eval("Product_price") %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>

  <asp:TemplateField HeaderText="Subtotal (Rs.)" ControlStyle-Font-Size="12px"  >
            <ItemTemplate>
            <asp:Label ID="lbl_Subtotal" runat="server" text='<%#Eval("Subtotal") %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Delete" ControlStyle-Font-Size="12px"  >
            <ItemTemplate>
           
            <asp:ImageButton ID="btndelete" ImageUrl="~/Images/trash-icon.png" Height="25px" Width="25px" ToolTip="Delete" runat="server"
             CommandName="Delete" CommandArgument='<%# Eval("Cart_Id") %>'/>                                      
            </ItemTemplate>
            </asp:TemplateField>
        
  
  </Columns>



    </asp:GridView>

<div style="float:right; margin:20px 0 0 0;">


    <asp:Button ID="Button1" runat="server" Text="Confirm" OnClick="Button1_click" style="padding:5px 15px 5px 15px; background-color:#ea9b12; border:none; color:White; cursor:pointer;" />
    
    </div>

</div>
</div>
</div>









</div>





</asp:Content>
