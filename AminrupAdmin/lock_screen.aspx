<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lock_screen.aspx.cs" Inherits="AminrupAdmin.lock_screen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Work-Sure ERP | Lock Screen</title>
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Custom ERP" />
    <meta name="keywords" content="Next-Sure, ERP, CSMS, Aminrup Technologies, Vaaman Engineers" />
    <meta name="author" content="Aminrup Technologies, Jamshedpur, JH" />

    <link rel="icon" href="aminrup/files/assets/images/favicon.ico" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="aminrup/files/bower_components/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="aminrup/files/assets/icon/themify-icons/themify-icons.css" />
    <link rel="stylesheet" type="text/css" href="aminrup/files/assets/icon/feather/css/feather.css" />
    <link rel="stylesheet" type="text/css" href="aminrup/files/assets/icon/icofont/css/icofont.css" />
    <link rel="stylesheet" type="text/css" href="aminrup/files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="aminrup/files/assets/css/custom.css" />
    <link rel="stylesheet" type="text/css" href="aminrup/files/bower_components/pnotify/css/pnotify.css" />
    <link rel="stylesheet" type="text/css" href="aminrup/files/bower_components/pnotify/css/pnotify.brighttheme.css" />
</head>
<body>
    <!-- Single WebForms server form -->
    <form id="form1" runat="server">
        <div>
            <!-- Pre-loader start -->
            <div class="theme-loader">
                <div class="ball-scale">
                    <div class='contain'>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Pre-loader end -->

            <section class="login-block">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Login card start -->
                            <div class="text-center">
                                <asp:HyperLink ID="hlLogo" runat="server"
                                    NavigateUrl="https://www.vaaman.in/"
                                    Target="_blank"
                                    CssClass="d-inline-block">
                                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/aminrup/files/assets/images/Vaaman-engineers-2.png" AlternateText="Company Logo" CssClass="img-fluid" ToolTip="Visit Aminrup Technologies" />
                                </asp:HyperLink>
                            </div>

                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">Work-Sure ERP | Re-Login
                                                <i class="feather icon-lock text-primary f-60 p-t-15 p-b-20 d-block"></i>
                                            </h3>
                                        </div>
                                    </div>

                                    <div class="form-group form-primary">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Your Email Address" />
                                        <span class="form-bar"></span>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Button ID="btnUnlock" runat="server" CssClass="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" OnClick="btnUnlock_Click" Text="Lock Screen" />
                                        </div>
                                    </div>

                                    <p class="text-inverse text-right">Back to <a href="index.aspx">Login</a></p>

                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-8">
                                            <p class="text-inverse text-left m-b-0">Thank you.</p>
                                            <p class="text-inverse text-left">
                                                <asp:HyperLink ID="hlBackToSite" runat="server" NavigateUrl="aminrup/_default/WebForm1.aspx" CssClass="f-w-600">
                                                    <b>Back to website</b>
                                                </asp:HyperLink>
                                            </p>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-4 text-right">
                                            <asp:HyperLink ID="hlSmallLogo" runat="server" NavigateUrl="https://www.aminruptechnologies.co.in/" Target="_blank" CssClass="d-inline-block mr-2">
                                                <asp:Image ID="imgSmallLogo" runat="server" ImageUrl="~/aminrup/files/assets/images/favicon-32x32.png" AlternateText="small-logo.png" CssClass="align-middle" />
                                            </asp:HyperLink>

                                            <p class="text-inverse text-sm-right mb-0 d-inline-block align-middle">
                                                <asp:HyperLink ID="lnkCompany" runat="server" NavigateUrl="https://www.aminruptechnologies.co.in/" Target="_blank" CssClass="text-inverse font-weight-bold text-decoration-none">Aminrup Technologies
                                                </asp:HyperLink>
                                            </p>
                                        </div>
                                    </div>

                                    <!-- server-side error label -->
                                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <!-- Login card end -->
                        </div>
                        <!-- end of col-sm-12 -->
                    </div>
                    <!-- end of row -->
                </div>
                <!-- end of container-fluid -->
            </section>

        </div>

        <!-- Required Jquery and plugin scripts -->
        <script type="text/javascript" src="aminrup/files/bower_components/jquery/js/jquery.min.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/popper.js/js/popper.min.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/modernizr/js/modernizr.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/modernizr/js/css-scrollbars.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/i18next/js/i18next.min.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
        <script type="text/javascript" src="aminrup/files/assets/js/common-pages.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/pnotify/js/pnotify.js"></script>
        <script type="text/javascript" src="aminrup/files/bower_components/pnotify/js/pnotify.buttons.js"></script>

        <script type="text/javascript">
            function showPNotify(title, text, type) {
                try {
                    PNotify.alert({ text: text, type: type || 'info', delay: 2000 });
                } catch (e) {
                    alert(title + ": " + text);
                }
            }
        </script>
    </form>
</body>
</html>
