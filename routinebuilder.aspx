<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="routinebuilder.aspx.cs" Inherits="skintrackerr.routinebuilder" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Routine Builder | SkinTracker</title>
    <link rel="stylesheet" href="css/routinebuilder.css" />
</head>
<body>
    <form id="routineForm" runat="server">
        <nav class="navbar">
            <div class="logo">Skin Tracker</div>
            <ul class="nav-links">
                <li><a href="web.aspx">Home</a></li>
                <li><a href="products.aspx">Products</a></li>
                <li><a href="routinebuilder.aspx" class="active">Routine Builder</a></li>
            </ul>
        </nav>

        <section class="routine-section">
            <div class="routine-card">
                <h2>Build Your Skincare Routine</h2>
                <p class="subtitle">Customize your perfect skincare plan.</p>

                <div class="routine-form">
                    <label>Routine Name</label>
                    <asp:TextBox ID="txtRoutineName" runat="server" CssClass="input" placeholder="My Morning Routine" />

                    <label>Skin Type</label>
                    <asp:DropDownList ID="ddlSkinType" runat="server" CssClass="input">
                        <asp:ListItem>Oily</asp:ListItem>
                        <asp:ListItem>Dry</asp:ListItem>
                        <asp:ListItem>Combination</asp:ListItem>
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>Sensitive</asp:ListItem>
                    </asp:DropDownList>

                    <label>Skin Concerns</label>
                    <asp:TextBox ID="txtConcerns" runat="server" CssClass="input" placeholder="e.g. Acne, Redness, Pigmentation" />

                    <label>Ingredient Sensitivities / Allergies</label>
                    <asp:TextBox ID="txtAllergies" runat="server" CssClass="input" placeholder="e.g. Fragrance, Alcohol, etc." />

                    <label>Number of Steps</label>
                    <asp:DropDownList ID="ddlSteps" runat="server" CssClass="input">
                        <asp:ListItem>Minimal (3 Steps)</asp:ListItem>
                        <asp:ListItem>Standard (5 Steps)</asp:ListItem>
                        <asp:ListItem>Extended (10 Steps)</asp:ListItem>
                    </asp:DropDownList>
                    
                      <label>Visibility</label>
                    <asp:DropDownList ID="ddlVisibility" runat="server" CssClass="input">
                    <asp:ListItem>Private</asp:ListItem>
                    <asp:ListItem>Public</asp:ListItem>
                     </asp:DropDownList>

                 <asp:Button ID="Button1" runat="server" Text="Save Routine" CssClass="btn" OnClick="btnSave_Click" />
                 <asp:Label ID="Label1" runat="server" CssClass="status"></asp:Label>

                </div>
            </div>
        </section>
        <script>
               if (window.location.search.includes("updated=true")) {
                alert("✅ Your routine has been updated successfully!");
                }
        </script>

    </form>
</body>
</html>
