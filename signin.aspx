<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="skintrackerr.signin" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Sign In | SkinTracker</title>
    <link rel="stylesheet" href="css/signup.css" />
</head>
<body>
    <header class="navbar">
        <div class="logo">❤ SkinTracker</div>
        <ul class="nav-links">
            <li><a href="web.aspx">Home</a></li>
            <li><a href="products.aspx">Products</a></li>
            <li><a href="routinebuilder.aspx">Routine Builder</a></li>
        </ul>
    </header>
    <main class="page">
        <section class="card" aria-labelledby="loginTitle">
            <h1 id="loginTitle">Login</h1>

            <form id="signinForm" runat="server">
                <div class="field">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="field">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                </div>
                <asp:Button ID="btnSignin" runat="server" Text="Sign In" CssClass="btn" OnClick="btnSignin_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
                <div class="toggle">Don’t have an account? <a href="signup.aspx">Sign Up</a></div>
            </form>
        </section>
    </main>
</body>
</html>
