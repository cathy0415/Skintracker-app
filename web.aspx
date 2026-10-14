<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="web.aspx.cs" Inherits="skintrackerr.web" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>SkinCare Routine Tracker</title>
    <link rel="stylesheet" href="css/web.css" />
</head>
<body>
    <form id="form1" runat="server">
  
        <header class="site-header">
            <div class="container header-inner">
                <div class="brand">
                    <div class="logo">SkinTracker</div>      
                    <nav class="top-nav">
                        <a href="web.aspx">Dashboard</a>
                        <a href="#progress">Progress</a>
                        <a href="#routines">My Routines</a>
                        <a href="products.aspx">Product Library</a>
                        <a href="routinebuilder.aspx">Routine Builder</a>
                    </nav>
                </div>
                <div class="header-actions">
                <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-label"></asp:Label>
                 <asp:HyperLink ID="lnkSignup" runat="server" CssClass="btn btn-outline" NavigateUrl="signup.aspx">Sign up</asp:HyperLink>
                 <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline" OnClick="btnLogout_Click" Visible="false" />
               </div>

            </div>
        </header>

        <!-- HERO -->
        <section class="hero">
            <div class="container hero-inner">
                <div class="hero-left">
                    <h1>Track Your Skincare Journey</h1>
                    <p class="lead">Build personalized routines, track progress, and connect with a community of skincare enthusiasts.</p>
                    <div class="hero-cta">
                        <a class="btn btn-primary" href="routinebuilder.aspx">Create New Routine</a>
                        <a class="btn btn-ghost" href="tutorial.aspx">Watch Tutorial</a>
                    </div>
                </div>
                <div class="hero-right">
                    <img src="images/front.jpeg" alt="hero" />
                </div>
            </div>
        </section>

        <!-- MAIN CONTENT -->
        <main class="container main-grid" id="dashboard">

            <!-- KPI CARDS -->
            <section class="kpis card">
                <div class="kpi"><div class="kpi-icon"></div><div class="kpi-val">28<div class="kpi-sub">Days Tracked</div></div></div>
                <div class="kpi"><div class="kpi-icon"></div><div class="kpi-val">3<div class="kpi-sub">Active Routines</div></div></div>
                <div class="kpi"><div class="kpi-icon"></div><div class="kpi-val">15<div class="kpi-sub">Products Used</div></div></div>
                <div class="kpi"><div class="kpi-icon"></div><div class="kpi-val">85%<div class="kpi-sub">Consistency</div></div></div>
            </section>

            <!-- Progress + Routine -->
            <section class="grid-two" id="progress">

                <!-- LEFT: Progress -->
                <section class="progress-card">
                    <h2>Progress Overview</h2>

                    <div class="filter-bar">
                        <span class="active">Days</span>
                        <span>Week</span>
                        <span>Month</span>
                    </div>

                    <div class="progress-item">
                        <h4>Routine Consistency <span>85%</span></h4>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 85%;"></div>
                        </div>
                    </div>

                    <div class="progress-item">
                        <h4> Skin Improvement <span>+12%</span></h4>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 60%;"></div>
                        </div>
                    </div>

                    <div class="mini-stats">
                        <div class="stat">
                            <h3>8</h3>
                            <p>Products Used</p>
                        </div>
                        <div class="stat">
                            <h3>12</h3>
                            <p>Routine Days</p>
                        </div>
                    </div>
                </section>

                <!-- RIGHT: Today's Routine -->
                <aside class="col card today-card">
                    <div class="routine-card">
                        <h3>Today's Routine</h3>

                        <label class="task">
                            <input type="checkbox" />
                            <span class="checkmark"></span>
                            <span class="content">
                                <strong>Morning Cleanser</strong><br />
                                CeraVe Foaming Cleanser
                            </span>
                        </label>

                        <label class="task">
                            <input type="checkbox" />
                            <span class="checkmark"></span>
                            <span class="content">
                                <strong>Hydrating Serum</strong><br />
                                The Ordinary Hyaluronic Acid
                            </span>
                        </label>

                        <label class="task">
                            <input type="checkbox" />
                            <span class="checkmark"></span>
                            <span class="content">
                                <strong>SPF Moisturizer</strong><br />
                                Nivea Soft Cream
                            </span>
                        </label>
                    </div>
                </aside>
            </section>

            <!-- ROUTINES + PRODUCTS -->
            <section class="grid-two" style="margin-top:28px">
              
              <div class="col card" id="routines">
               <h3>My Routines</h3>
              <asp:Repeater ID="rptRoutines" runat="server" OnItemCommand="rptRoutines_ItemCommand">
             <HeaderTemplate>
                <div class="routine-list">
             </HeaderTemplate>
               <ItemTemplate>
            <div class="routine-item" style="display:flex;justify-content:space-between;align-items:center;padding:14px;background:#fbfbfb;border-radius:10px;margin-bottom:10px;">
                <div>
                    <strong><%# Eval("RoutineName") %></strong>
                    <div class="muted small">
                        <%# Eval("Steps") %> • <%# Eval("SkinType") %> • <%# Eval("Concerns") %>
                    </div>
                </div>

                <div style="display:flex;gap:8px;align-items:center;">
                    <span class="tag" style="margin-right:8px;"><%# Eval("Visibility") %></span>
                    <asp:Button ID="btnEdit" runat="server" CssClass="btn-mini" Text="✏️ Edit"
                                CommandName="EditRoutine" CommandArgument='<%# Eval("RoutineID") %>' />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn-mini btn-danger" Text="🗑 Delete"
                                CommandName="DeleteRoutine" CommandArgument='<%# Eval("RoutineID") %>' />
                </div>
            </div>
        </ItemTemplate>

        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Panel ID="pnlNoRoutines" runat="server" Visible="false" CssClass="empty-state"
        Style="margin-top:12px;padding:20px;border-radius:10px;background:#fbfffd;border:1px dashed rgba(0,184,148,0.12);text-align:center;">
        <div style="color:#00b894;font-weight:700;margin-bottom:6px;">You have no routines yet</div>
        <div class="muted small" style="margin-bottom:12px;">Create your first routine to see it appear here.</div>
        <a class="btn btn-outline full" href="routinebuilder.aspx">+ Create New Routine</a>
    </asp:Panel>
</div>


                <!-- PRODUCTS -->
                <div class="col card" id="products">
                    <h3>Product Recommendations</h3>
                    <ul class="rec-list">
                        <li>
                            <img src="images/cera.jpeg" alt="CeraVe Foaming Facial Cleanser" />
                            <div>
                                <strong>CeraVe Foaming Facial Cleanser</strong>
                                <div class="muted small">CeraVe  4.5</div>
                            </div>
                            <button class="add">+</button>
                        </li>

                        <li>
                            <img src="images/ordinary.jpeg" alt="The Ordinary Hyaluronic Acid 2% + B5" />
                            <div>
                                <strong>The Ordinary Hyaluronic Acid 2% + B5</strong>
                                <div class="muted small">The Ordinary  4.3</div>
                            </div>
                            <button class="add">+</button>
                        </li>

                        <li>
                            <img src="images/Neutrogena.jpeg" alt="Neutrogena Ultra Sheer SPF 30" />
                            <div>
                                <strong>Neutrogena Ultra Sheer SPF 30</strong>
                              <div class="muted small">Neutrogena  4.2</div>
                            </div>
                            <button class="add">+</button>
                        </li>
                    </ul>
                    <a class="btn full" href="products.aspx">Browse All Products</a>
                </div>
            </section>
        </main>

        <!-- FOOTER -->
        <footer class="container footer">
             <p>© 2025 SkinTracker | Explore • Track • Glow</p>
        </footer>
    </form>
</body>
</html>
