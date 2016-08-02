﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Calculator.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>




        /*Menu bar
            http://blog.themearmada.com/off-canvas-slide-menu-for-bootstrap/
        */
        a.nav-expander {
            background: none repeat scroll 0 0 #000000;
            color: #FFFFFF;
            display: block;
            font-size: 15px;
            font-weight: 400;
            height: 50px;
            margin-right: 0;
            padding: 1em 1.6em 2em;
            position: absolute;
            right: 0;
            text-decoration: none;
            text-transform: uppercase;
            top: 0;
            transition: right 0.3s ease-in-out 0s;
            width: 130px;
            z-index: 12;
            transition: right 0.3s ease-in-out 0s;
            -webkit-transition: right 0.3s ease-in-out 0s;
            -moz-transition: right 0.3s ease-in-out 0s;
            -o-transition: right 0.3s ease-in-out 0s;
        }

            a.nav-expander:hover {
                cursor: pointer;
            }

            a.nav-expander.fixed {
                position: fixed;
            }

        .nav-expanded a.nav-expander.fixed {
            right: 20em;
        }

        nav {
            background: #2d2f33;
            display: block;
            height: 100%;
            overflow: auto;
            position: fixed;
            right: -20em;
            font-size: 15px;
            top: 0;
            width: 20em;
            z-index: 2000;
            transition: right 0.3s ease-in-out 0s;
            -webkit-transition: right 0.3s ease-in-out 0s;
            -moz-transition: right 0.3s ease-in-out 0s;
            -o-transition: right 0.3s ease-in-out 0s;
        }

        .nav-expanded nav {
            right: 0;
        }

        body.nav-expanded {
            margin-left: 0em;
            transition: right 0.4s ease-in-out 0s;
            -webkit-transition: right 0.4s ease-in-out 0s;
            -moz-transition: right 0.4s ease-in-out 0s;
            -o-transition: right 0.4s ease-in-out 0s;
        }

        #nav-close {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-weight: 300;
            font-size: 24px;
            padding-right: 10px;
        }

        .main-menu {
            padding-top: 12px;
        }

            .main-menu li {
                border-bottom: 1px solid #323949;
                margin-left: 20px;
                font-size: 18px;
                padding: 12px;
            }

                .main-menu li a {
                    color: #6F7D8C;
                    text-decoration: none;
                }

                    .main-menu li a:hover {
                        color: #FFFFFF;
                        text-decoration: none;
                    }

                .main-menu li .sub-nav {
                    border-bottom: 0px;
                    padding: 4px;
                }

            .main-menu a .caret {
                width: 0;
                height: 0;
                display: inline-block;
                vertical-align: top;
                border-top: 4px solid #4f5963;
                border-right: 4px solid transparent;
                border-left: 4px solid transparent;
                content: "";
                margin-top: 8px;
            }

            .main-menu a:hover .caret {
                border-top-color: #4f5963;
            }

            .main-menu li.open > a > .caret {
                border-top: none;
                border-bottom: 4px solid #4f5963;
                border-right: 4px solid transparent;
                border-left: 4px solid transparent;
            }

            .main-menu li.open > a:hover > .caret {
                border-bottom-color: #4f5963;
            }

        .icon:before {
            font-family: 'FontAwesome';
            font-style: normal;
            font-variant: normal;
            font-weight: normal;
            line-height: 1;
            text-transform: none;
            content: '\f105';
        }

        .main-menu li > a > span.icon {
            float: right;
            margin: 0.1em 1.7em -0.1em 0;
            opacity: 0;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }

        .main-menu li > a:hover > span.icon {
            float: right;
            margin: 0.1em 0.8em -0.1em 0;
            opacity: 1;
        }
    </style>

    <!--Page Content-->
    <nav>
        <ul class="list-unstyled main-menu">
            <!--Include your navigation here-->
            <li class="text-right"><a href="#" id="nav-close">X</a></li>
            <li><a href="../Home">Home <span class="icon"></span></a></li>
            <li><a href="#">Menu Two <span class="icon"></span></a></li>
            <li><a href="#">Menu Three <span class="icon"></span></a></li>
            <li><a href="#">Sub Menu Header</a>
                <ul class="list-unstyled">
                    <li class="sub-nav"><a href="#">Sub Menu One <span class="icon"></span></a></li>
                    <li class="sub-nav"><a href="#">Sub Menu Two <span class="icon"></span></a></li>
                    <li class="sub-nav"><a href="#">Sub Menu Three <span class="icon"></span></a></li>
                    <li class="sub-nav"><a href="#">Sub Menu Four <span class="icon"></span></a></li>
                    <li class="sub-nav"><a href="#">Sub Menu Five <span class="icon"></span></a></li>
                </ul>
            </li>
            <li><a href="#">Menu Four <span class="icon"></span></a></li>
            <li><a href="#">Menu Five <span class="icon"></span></a></li>
        </ul>
    </nav>

    <div class="navbar navbar-inverse navbar-fixed-top">

        <!--Include your brand here-->
        <a class="navbar-brand" href="#">Calculator</a>
        <div class="navbar-header pull-left">
            <a id="nav-expander" class="nav-expander fixed">MENU &nbsp;<i class="fa fa-bars fa-lg white"></i>
            </a>
        </div>
    </div>

    <p>
        Home
    </p>
</asp:Content>
