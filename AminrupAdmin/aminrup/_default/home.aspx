<%@ Page Title="Next-Sure ERP | Home" Language="C#" MasterPageFile="~/aminrup/_default/aminrup_admin.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="AminrupAdmin.aminrup._default.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">

                    <div class="page-header">
                        <div class="row align-items-end">
                            <div class="col-lg-8 col-sm-8">
                                <div class="page-header-title">
                                    <div class="d-inline">
                                        <h4>Hi, Welcome Back!</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-4">
                                <div class="page-header-breadcrumb">
                                    <ul class="breadcrumb-title">
                                        <li class="breadcrumb-item">
                                            <a href="home.aspx"><i class="feather icon-home"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Page-header end -->

                    <div class="page-body">
                        <div class="row">
                        <div class="col-lg-12">&nbsp;</div></div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="cover-profile">
                                    <div class="profile-bg-img">
                                        <img class="profile-bg-img img-fluid" src="..\files\assets\images\user-profile\bg-img1.jpg" alt="bg-img">
                                        <div class="card-block user-info">
                                            <div class="col-md-12">
                                                <div class="media-left">
                                                    <a href="#" class="profile-image">
                                                        <img class="user-img img-radius" src="..\files\assets\images\user-profile\user-img.jpg" alt="user-img">
                                                    </a>
                                                </div>
                                                <div class="media-body row">
                                                    <div class="col-lg-12">
                                                        <div class="user-title">
                                                            <h2>Administrator</h2>
                                                            <span class="text-white">Super Admin</span>
                                                        </div>
                                                    </div>
                                                    <div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--profile cover end-->
                        <div class="row">
                            <!-- statustic start -->
                            <div class="col-md-6 col-lg-3">
                                <div class="card statustic-card">
                                    <div class="card-header">
                                        <h5>Permit Based JOB's</h5>
                                    </div>
                                    <div class="card-block text-center">
                                        <span class="d-block text-c-blue f-36">16</span>
                                        <p class="m-b-0">Total</p>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-blue" style="width: 80%"></div>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-c-blue">
                                        <h6 class="text-white m-b-0">Today: 2</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="card statustic-card">
                                    <div class="card-header">
                                        <h5>Attendance & Upload Status</h5>
                                    </div>
                                    <div class="card-block text-center">
                                        <span class="d-block text-c-green f-36">16</span>
                                        <p class="m-b-0">Total</p>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-green" style="width: 100%"></div>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-c-green">
                                        <h6 class="text-white m-b-0">Due Today: 0</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="card statustic-card">
                                    <div class="card-header">
                                        <h5>Out-Punch Pending</h5>
                                    </div>
                                    <div class="card-block text-center">
                                        <span class="d-block text-c-pink f-36">2</span>
                                        <p class="m-b-0">Total</p>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-pink" style="width: 80%"></div>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-c-pink">
                                        <h6 class="text-white m-b-0">Open Today: 2</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="card statustic-card">
                                    <div class="card-header">
                                        <h5>Approval Status</h5>
                                    </div>
                                    <div class="card-block text-center">
                                        <span class="d-block text-c-yellow f-36">14</span>
                                        <p class="m-b-0">Total</p>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-yellow" style="width: 80%"></div>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-c-yellow">
                                        <h6 class="text-white m-b-0">Un-Approved: 0</h6>
                                    </div>
                                </div>
                            </div>
                            <!-- statustic end -->
                        </div>

                    </div>
                    <!-- Page-body end -->
                </div>
            </div>
            <!-- Main body end -->
            <div id="styleSelector">
            </div>
        </div>
    </div>
</asp:Content>
