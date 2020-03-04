<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DeepFirstSearch.index" %>

<!doctype html>
<html lang="en">
<head runat="server">
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="DeepFirstSearch">
    <meta name="author" content="Generation1Studio">

    <!-- Title Page-->
    <title>Deep First Search</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <link href="vendor/wow/animate.css" rel="stylesheet">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet">
    <link href="vendor/slick/slick.css" rel="stylesheet">
    <link href="vendor/select2/select2.min.css" rel="stylesheet">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet">

    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

    <!-- SweetAlert -->

    <link href="dist/sweetalert2.css" rel="stylesheet" />
    <script src="dist/sweetalert2.min.js"></script>

    <script type="text/javascript">
        function successnode(node) {
            swal.fire({
                title: 'ค้นพบโหนด ' + node + ' แล้ว',  //สิ่งที่เปลี่ยนได้ คือหัว
                type: 'success', // อันนี้คือประเภทว่าจะให้เป็นแบบไหน
                timer: 2000  // หน่วงเวลา 
            })
        }
        function falsenode(node) {
            swal.fire({
                title: 'ไม่พบโหนด ' + node + ' ที่ค้นหา',  //สิ่งที่เปลี่ยนได้ คือหัว
                text: 'กรุณากรอกโหนดที่ต้องการค้นหาใหม่ !',  // ข้อความที่แสดง
                type: 'error', // อันนี้คือประเภทว่าจะให้เป็นแบบไหน
                timer: 3000
            })
        }
        function errorSearch() {
            swal.fire({
                title: 'กรุณากรอกโหนดที่ต้องการค้นหา !',  //สิ่งที่เปลี่ยนได้ คือหัว
                type: 'warning', // อันนี้คือประเภทว่าจะให้เป็นแบบไหน
                timer: 2000
            })
        }
        function errorMode() {
            swal.fire({
                title: 'กรุณาเลือกโหมดการค้นหา !',  //สิ่งที่เปลี่ยนได้ คือหัว
                type: 'warning', // อันนี้คือประเภทว่าจะให้เป็นแบบไหน
                timer: 2000
            })
        }
    </script>
</head>
<body class="animsition">
    <form id="mainform" runat="server">
        <div class="page-wrapper">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop3 d-none d-lg-block">
                <div class="section__content section__content--p35">
                    <div class="header3-wrap">
                        <div class="header__logo offset-lg-2">
                            <a href="#">
                                <img src="images/icon/rmuti.ico" width="40px" />
                            </a>
                            <h4 class="heading-title">RAJAMANGALA UNIVERSITY OF TECHNOLOGY ISAN</h4>
                        </div>

                        <div class="header__tool">
                            <div class="account-wrap">
                                <div class="account-item account-item--style2 clearfix js-item-menu">
                                    <div class="image">
                                        <img src="images/icon/Thailand_48px.png" width="45px" />
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn aboutme_title" href="#">CPE.59241 / GROUP 8</a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="images/icon/Linux_48px.png" />
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#">GROUP 8</a>
                                                </h5>
                                                <span class="email">อ๊าาาๆๆๆ~ อ๊าาาาห์~</span>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__body">
                                            <div class="account-dropdown__item">
                                                <a href="https://www.facebook.com/bungernnoii" target="_blank">
                                                    <i class="zmdi zmdi-account"></i>อดิศักดิ์ เขียงกระโทก &nbsp;59172110267-0</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="https://www.facebook.com/naymobie.dekzaloso" target="_blank">
                                                    <i class="zmdi zmdi-account"></i>วสุพล พวงจันทึก &emsp;&emsp;59172110376-7</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="https://www.facebook.com/chantawutt" target="_blank">
                                                    <i class="zmdi zmdi-account"></i>ฉันทวุฒิ  รวมใหม่ &emsp;&emsp;59172110593-1</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- END HEADER DESKTOP-->
            <!-- HEADER MOBILE-->
            <header class="header-mobile header-mobile-2 d-block d-lg-none">
                <div class="header-mobile__bar">
                    <div class="container-fluid">
                        <div class="header-mobile-inner">
                            <a class="logo">
                                <img src="images/icon/rmuti.ico" width="40px" />
                            </a>
                            <h4 class="heading-title">RAJAMANGALA UNIVERSITY OF TECHNOLOGY ISAN</h4>
                            <button class="hamburger hamburger--slider" type="button"></button>
                        </div>
                    </div>
                </div>
            </header>
            <div class="sub-header-mobile-2 d-block d-lg-none">
                <div class="header__tool">
                    <div class="account-wrap">
                        <div class="account-item account-item--style2 clearfix js-item-menu">
                            <div class="image">
                                <img src="images/icon/Thailand_48px.png" width="45px" />
                            </div>
                            <div class="content">
                                <a class="js-acc-btn aboutme_title" href="#">CPE.59241 / GROUP 8</a>
                            </div>
                            <div class="account-dropdown js-dropdown">
                                <div class="info clearfix">
                                    <div class="image">
                                        <a href="#">
                                            <img src="images/icon/Linux_48px.png" />
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h5 class="name">
                                            <a href="#">GROUP 8</a>
                                        </h5>
                                        <span class="email">อ๊าาาๆๆๆ~ อ๊าาาาห์~</span>
                                    </div>
                                </div>
                                <div class="account-dropdown__body">
                                    <div class="account-dropdown__item">
                                        <a href="https://www.facebook.com/bungernnoii" target="_blank">
                                            <i class="zmdi zmdi-account"></i>อดิศักดิ์ เขียงกระโทก &nbsp;59172110267-0</a>
                                    </div>
                                    <div class="account-dropdown__item">
                                        <a href="https://www.facebook.com/naymobie.dekzaloso" target="_blank">
                                            <i class="zmdi zmdi-account"></i>วสุพล พวงจันทึก &emsp;&emsp;59172110376-7</a>
                                    </div>
                                    <div class="account-dropdown__item">
                                        <a href="https://www.facebook.com/chantawutt" target="_blank">
                                            <i class="zmdi zmdi-account"></i>ฉันทวุฒิ  รวมใหม่ &emsp;&emsp;59172110593-1</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END HEADER MOBILE -->
            <!-- PAGE CONTENT-->
            <div class="page-content--bgf7">
                <!-- HEAD TITLE-->
                <section class="welcome p-t-30">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="title-5">DEEP FIRST SEARCH ALGORITHM</h3>
                                <div class="title-sub">ARTIFICIAL INTELLIGENCE</div>
                                <hr class="line-seprate">
                            </div>
                        </div>
                    </div>
                </section>
                <!-- END HEAD TITLE-->
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:Timer ID="Timer1" runat="server" Interval="1000" Enabled="False" OnTick="Timer1_Tick" />
                <asp:UpdatePanel ID="GeneticPanel" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" />
                    </Triggers>
                    <ContentTemplate>
                        <!-- CONTROL-->
                        <section class="statistic statistic2">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="title-7 m-b-20">CONTROL</h3>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-lg-3">
                                        <div class="statistic__item statistic__item--green">
                                            <h2 class="number">Node Search</h2>
                                            <span class="desc">Enter Node For Search</span>
                                            <div class="row form-group">
                                                <div class="col col-md-12">
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fas fa-search"></i>
                                                        </div>
                                                        <asp:TextBox ID="txb_Search" runat="server" placeholder="Enter Node..." CssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="โหนดที่ต้องการค้นหา"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="statistic__item statistic__item--orange">
                                            <h2 class="number">Search Mode</h2>
                                            <span class="desc">Automatic or Manual</span>
                                            <div class="row form-group">
                                                <div class="col col-md-12">
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fas fa-cogs"></i>
                                                        </div>
                                                        <asp:DropDownList runat="server" ID="ddl_Mode" CssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="โหมดการค้นหา">
                                                            <asp:ListItem Value="0">Select Mode</asp:ListItem>
                                                            <asp:ListItem Value="1">Automatic</asp:ListItem>
                                                            <asp:ListItem Value="2">Manual</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="statistic__item statistic__item--blue">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12">
                                                    <center>
                                                        &ensp;
                                                     </center>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12">
                                                    <center>
                                                         &nbsp;<asp:Button runat="server" ID="btn_Strat"  CssClass="btn btn-success" OnClick="btn_Strat_ServerClick" Text="&ensp; Start &ensp;" data-toggle="tooltip" data-placement="top" title="เริ่มทำงาน"></asp:Button>&emsp;                                   
                                                     <asp:Button runat="server" ID="btn_Reset"  CssClass="btn btn-danger" OnClick="btn_Reset_ServerClick" Text="&ensp; Reset &ensp;" data-toggle="tooltip" data-placement="top" title="ยกเลิกการทำงาน"></asp:Button>
                                                 
                                                     </center>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12">
                                                    <center>
                                                        &ensp;
                                                     </center>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12">
                                                    <center>
                                                       &nbsp;<asp:Button runat="server" ID="btn_Next"  CssClass="btn btn-primary" OnClick="btn_Next_ServerClick" Text="&ensp;&nbsp; Next &ensp;" Enabled="False" data-toggle="tooltip" data-placement="top" title="ค้นหาโหนดต่อไป"></asp:Button> &emsp;
                                                        <asp:Button runat="server" ID="btn_Prev"  CssClass="btn btn-secondary" OnClick="btn_Prev_ServerClick" Text="&ensp;&nbsp; Prev &nbsp;&ensp;" Enabled="False"  data-toggle="tooltip" data-placement="top" title="ค้นหาโหนดก่อนหน้า"></asp:Button>     
                                                     </center>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="statistic__item statistic__item--red">
                                            <center>
                                    <asp:Image ID="imgLoop" runat="server" Width="140px"></asp:Image>
                                </center>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- END CONTROL-->
                        <!-- MAIN-->
                        <section class="statistic-chart">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="title-7 m-b-20">OUTPUT</h3>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- CHART-->
                                    <div class="col-md-6 col-lg-8">
                                        <div class="statistic-chart-1">
                                            <asp:Image ID="imgTree" runat="server" ViewStateMode="Enabled" usemap="#image-map"></asp:Image>
                                            <map name="image-map" id="image-map">
                                                <area id="a" coords="365,21,25" shape="circle" onclick="a()">
                                                <area id="b" coords="185,140,25" shape="circle" onclick="b()">
                                                <area id="c" coords="542,140,25" shape="circle" onclick="c()">
                                                <area id="d" coords="99,262,25" shape="circle" onclick="d()">
                                                <area id="e" coords="277,262,25" shape="circle" onclick="e()">
                                                <area id="f" coords="449,262,25" shape="circle" onclick="f()">
                                                <area id="g" coords="629,262,25" shape="circle" onclick="g()">
                                                <area id="h" coords="57,376,25" shape="circle" onclick="h()">
                                                <area id="i" coords="142,376,25" shape="circle" onclick="i()">
                                                <area id="j" coords="234,375,25" shape="circle" onclick="j()">
                                                <area id="k" coords="320,375,25" shape="circle" onclick="k()">
                                                <area id="l" coords="413,375,25" shape="circle" onclick="l()">
                                                <area id="m" coords="498,375,25" shape="circle" onclick="m()">
                                                <area id="n" coords="590,375,25" shape="circle" onclick="n()">
                                                <area id="o" coords="675,375,25" shape="circle" onclick="o()">
                                            </map>
                                        </div>
                                    </div>
                                    <!-- END CHART-->
                                    <!-- TABLE-->
                                    <div class="col-md-6 col-lg-4">
                                        <div class="table-responsive m-b-40">
                                            <table class="table table-borderless table-data3" runat="server" id="tb">
                                                <thead>
                                                    <tr>
                                                        <th>Node Search</th>
                                                        <th>Queue</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- END TABLE-->
                                </div>
                            </div>
                        </section>
                        <!-- END MAIN-->
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- COPYRIGHT-->
                <section class="p-t-60 p-b-20">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2019. Create By Generation1Studio Inc, CPE#8 RMUTI Korat.</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
                <!-- END COPYRIGHT-->
            </div>
            <!-- END PAGE CONTENT-->
        </div>

        <!-- Jquery JS-->
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendor/slick/slick.min.js">
        </script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/animsition/animsition.min.js"></script>
        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendor/circle-progress/circle-progress.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="js/main.js"></script>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
                $('[data-toggle="tooltip"]').click(function () {
                    $('[data-toggle="tooltip"]').tooltip("hide");
                });
                $("#a").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "A";
                });
                $("#b").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "B";
                });
                $("#c").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "C";
                });
                $("#d").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "D";
                });
                $("#e").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "E";
                });
                $("#f").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "F";
                });
                $("#g").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "G";
                });
                $("#h").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "H";
                });
                $("#i").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "I";
                });
                $("#j").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "J";
                });
                $("#k").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "K";
                });
                $("#l").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "L";
                });
                $("#m").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "M";
                });
                $("#n").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "N";
                });
                $("#o").click(function () {
                    document.getElementById("<%=txb_Search.ClientID%>").value = "O";
                });
            });
        </script>
    </form>
</body>
</html>
