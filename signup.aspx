<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="skintrackerr.signup" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Sign Up | SkinTracker</title>
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
        <section class="card" aria-labelledby="signupTitle">
            <h1 id="signupTitle">Create Account</h1>

            <form id="signupForm" runat="server">
                <div class="field">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <div class="field">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <div class="field">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                </div>

                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn" OnClick="btnSignup_Click" />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                <div class="toggle">Already have an account? <a href="signin.aspx">Sign in</a></div>
            </form>
        </section>
    </main>
</body>
</html>

