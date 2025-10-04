<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AminrupAdmin.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Work-Sure ERP | Login</title>
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
                        <%-- keep your preloader markup --%>
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
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Authentication card start -->
                            <div class="md-float-material form-material">
                                <%--<div class="text-center">
                                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/aminrup/files/assets/images/Vaaman-engineers-2.png" AlternateText="logo.png" CssClass="" />
                                </div>--%>

                                <div class="text-center">
                                    <asp:HyperLink ID="hlLogo" runat="server"
                                        NavigateUrl="https://www.vaaman.in/"
                                        Target="_blank"
                                        CssClass="d-inline-block">
                                        <asp:Image ID="imgLogo" runat="server"
                                            ImageUrl="~/aminrup/files/assets/images/Vaaman-engineers-2.png"
                                            AlternateText="Company Logo"
                                            CssClass="img-fluid"
                                            ToolTip="Visit Aminrup Technologies" />
                                    </asp:HyperLink>
                                </div>


                                <div class="auth-box card">
                                    <div class="card-block">
                                        <div class="row m-b-20">
                                            <div class="col-md-12">
                                                <h3 class="text-center">Work-Sure ERP | Sign In</h3>
                                            </div>
                                        </div>

                                        <asp:ValidationSummary ID="vsErrors" runat="server" CssClass="text-danger" HeaderText="" />

                                        <div class="form-group form-primary">
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Your Email Address" />
                                            <span class="form-bar"></span>
                                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                                ControlToValidate="txtEmail" MaxLength="50"
                                                ErrorMessage="Email is required."
                                                Display="Dynamic"
                                                CssClass="text-danger" />
                                        </div>

                                        <!-- Password field (place in the form) -->
                                        <div class="form-group form-primary" style="position: relative;">
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control pr-5"
                                                TextMode="Password" Placeholder="Password" autocomplete="current-password" MaxLength="50" />
                                            <span class="form-bar"></span>
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                                ControlToValidate="txtPassword"
                                                ErrorMessage="Password is required."
                                                Display="Dynamic"
                                                CssClass="text-danger" />

                                            <!-- toggle; plain span so ASP.NET keeps ID you give it. -->
                                            <span id="togglePassword" role="button" aria-label="Show password"
                                                class="icofont icofont-eye-alt"
                                                style="position: absolute; top: 50%; right: 15px; transform: translateY(-50%); cursor: pointer; font-size: 18px;"
                                                title="Show Password"></span>
                                        </div>




                                        <div class="row m-t-25 text-left">
                                            <%--<div class="col-12">
                                                <%--<div class="checkbox-fade fade-in-primary">
                                                    <label style="cursor: pointer">
                                                        <asp:CheckBox ID="chkRemember" runat="server" CssClass="" />
                                                        <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                        <span class="text-inverse">Remember me</span>
                                                    </label>
                                                </div>
                                                <div class="forgot-phone text-right f-right">
                                                    <asp:HyperLink ID="hlForgot" runat="server" NavigateUrl="#" CssClass="text-right f-w-600">Forgot Password?</asp:HyperLink>
                                                </div>
                                            </div>--%>

                                            <div class="col-12 d-flex justify-content-between align-items-center">
                                                <!-- Left: WhatsApp support link -->
                                                <div class="whatsapp-support text-left">
                                                    <asp:HyperLink ID="hlWhatsApp" runat="server"
                                                        NavigateUrl="https://wa.me/919155374222?text=Hello%20Team%2C%20I%20need%20assistance%20with%20my%20login."
                                                        Target="_blank"
                                                        CssClass="text-success f-w-600 d-inline-flex align-items-center">
                                                        <i class="icofont icofont-brand-whatsapp" style="font-size:18px; margin-right:5px;"></i>WhatsApp Support
                                                    </asp:HyperLink>
                                                </div>

                                                <!-- Right: Forgot password -->
                                                <div class="forgot-phone text-right f-right">
                                                    <asp:HyperLink ID="hlForgot" runat="server" NavigateUrl="#" CssClass="text-right f-w-600">Forgot Password?
                                                    </asp:HyperLink>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row m-t-30">
                                            <div class="col-md-12">
                                                <!-- keep type=button if you plan client-side handling; change to Submit or use OnClick for server handler -->
                                                <asp:Button ID="btnSignIn" runat="server" Text="Sign in"
                                                    CssClass="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20" />
                                            </div>
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-8">
                                                <p class="text-inverse text-left m-b-0">Thank you.</p>
                                                <p class="text-inverse text-left">
                                                    <asp:HyperLink ID="hlBackToSite" runat="server"
                                                        NavigateUrl="aminrup/_default/WebForm1.aspx" CssClass="f-w-600">
                                                    <b>Back to website</b>
                                                    </asp:HyperLink>
                                                </p>
                                            </div>
                                            <%--<div class="col-lg-6 col-md-6 col-sm-4 text-right">
                                                <asp:Image ID="imgSmallLogo" runat="server" ImageUrl="~/aminrup/files/assets/images/favicon-32x32.png" AlternateText="small-logo.png" />
                                                <p class="text-inverse text-sm-right">Aminrup Technologies</p>
                                            </div>--%>
                                            <div class="col-lg-6 col-md-6 col-sm-4 text-right">
                                                <asp:HyperLink ID="hlSmallLogo" runat="server"
                                                    NavigateUrl="https://www.aminruptechnologies.co.in/"
                                                    Target="_blank"
                                                    CssClass="d-inline-block mr-2">
                                                    <asp:Image ID="imgSmallLogo" runat="server"
                                                        ImageUrl="~/aminrup/files/assets/images/favicon-32x32.png"
                                                        AlternateText="small-logo.png"
                                                        CssClass="align-middle" />
                                                </asp:HyperLink>

                                                <p class="text-inverse text-sm-right mb-0 d-inline-block align-middle">
                                                    <asp:HyperLink ID="lnkCompany" runat="server"
                                                        NavigateUrl="https://www.aminruptechnologies.co.in/"
                                                        Target="_blank"
                                                        CssClass="text-inverse font-weight-bold text-decoration-none">Aminrup Technologies
                                                    </asp:HyperLink>
                                                </p>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end of card -->
                        </div>
                    </div>
                </div>
            </section>

            <!--[if lt IE 10]>
            <div class="ie-warning">
            <h1>Warning!!</h1>
            <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
            <!-- ... keep browser icons as-is ... -->
            <%--<p>Sorry for the inconvenience!</p>--%>
        </div>
        <![endif]-->

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
            $(function () {
                // hide theme loader if still visible
                $('.theme-loader').fadeOut(150); // hides overlay if any
                // also remove any overlay that might be left from common-pages
                $('.theme-loader, .page-overlay, .overlay-backdrop').css({ 'display': 'none', 'visibility': 'hidden', 'opacity': '0' });
            });

            // showPNotify helper (global so server-registered scripts can call it)
            function showPNotify(type, title, text, delay) {
                delay = typeof delay !== 'undefined' ? delay : 3000;
                new PNotify({
                    title: title || '',
                    text: text || '',
                    type: type || 'notice',
                    styling: 'brighttheme',
                    delay: delay
                });
            }
            (function () {
                function initPasswordToggle() {
                    var $toggle = $('#togglePassword');
                    var $input = $('#<%= txtPassword.ClientID %>');
                    if ($toggle.length === 0 || $input.length === 0) return;

                    $toggle.off('click.pwdToggle').on('click.pwdToggle', function () {
                        var isPwd = $input.attr('type') === 'password';
                        try {
                            $input.attr('type', isPwd ? 'text' : 'password');
                        } catch (e) {
                            // fallback for weird browser behavior
                            var $new = $input.clone().attr('type', isPwd ? 'text' : 'password');
                            $input.replaceWith($new);
                            $input = $new;
                        }
                        $(this).toggleClass('icofont-eye-alt icofont-eye-blocked');
                        $(this).attr('title', isPwd ? 'Hide Password' : 'Show Password');
                        $input.focus();
                    });
                }

                function initSignInHandler() {
                    var $btn = $('#<%= btnSignIn.ClientID %>');
                    var $email = $('#<%= txtEmail.ClientID %>');
                    var $pwd = $('#<%= txtPassword.ClientID %>');
                    if ($btn.length === 0) return;

                    $btn.off('click.signin').on('click.signin', function (e) {
                        e.preventDefault();

                        var email = $email.val().trim();
                        var pwd = $pwd.val();

                        // Basic client-side checks (you can extend)
                        if (email === '') {
                            showPNotify('error', 'Validation Failed', 'Please enter your email address.');
                            $email.focus();
                            return false;
                        }
                        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        if (!emailPattern.test(email)) {
                            showPNotify('error', 'Invalid Email', 'Please enter a valid email address.');
                            $email.focus();
                            return false;
                        }
                        if (pwd === '') {
                            showPNotify('error', 'Validation Failed', 'Please enter your password.');
                            $pwd.focus();
                            return false;
                        }

                        // Visual feedback & prevent double-clicks
                        $btn.prop('disabled', true).text('Signing in...').addClass('disabled');
                        showPNotify('info', 'Signing In', 'Attempting to sign you in...', 2000);

                        // Fire server-side click (WebForms postback)
                        __doPostBack('<%= btnSignIn.UniqueID %>', '');
                        return false;
                    });
                }

                // Run on first load
                $(document).ready(function () {
                    initPasswordToggle();
                    initSignInHandler();
                });

                // Re-initialize after MS AJAX partial postbacks (UpdatePanel)
                if (typeof Sys !== "undefined" && Sys && Sys.Application) {
                    Sys.Application.add_load(function () {
                        initPasswordToggle();
                        initSignInHandler();
                    });
                }
            })();
        </script>


    </form>
</body>
</html>
