<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PokemonIVCalculator.aspx.cs" Inherits="Calculator.Home" %>

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

        /*Dropdown*/
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
            z-index: 1;
        }
        /*.dropdown:hover .dropdown-content {
            display: block;
        }*/

        hr {
            margin-top: 7px;
            margin-bottom: 7px;
            border-color: #818182;
            opacity: 0.7;
        }
    </style>

    <!--Navbar Content-->
    <nav>
        <ul class="list-unstyled main-menu">
            <!--Include your navigation here-->
            <li class="text-right"><a href="#" id="nav-close">X</a></li>
            <li><a href="#IVCalcAnchor">IV Calculator <span class="icon"></span></a></li>
            <li><a href="#MaxStatsAnchor">Maximum Stats <span class="icon"></span></a></li>
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

    <!-- Main Content -->
    <hr />
    <a name="IVCalcAnchor"></a>
    <div class="container-fluid" runat="server" style="font-family: 'Century Gothic'; padding-left: 100px; padding-right: 100px; margin-top: 70px;">

        <!-- Input -->
        <div class="row">
            <div class="col-sm-2">
                <p style="margin-left: auto; margin-right: auto; text-align: center;"><b>Pokemon</b></p>
                <asp:DropDownList ID="pokemonDDL"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="pokemonDDLSelection_Change"
                    runat="server"
                    CssClass="form-control">

                    <asp:ListItem Selected="True">Bulbasaur</asp:ListItem>
                    <asp:ListItem>Ivysaur</asp:ListItem>
                    <asp:ListItem>Venusaur</asp:ListItem>
                    <asp:ListItem>Charmander</asp:ListItem>
                    <asp:ListItem>Charmeleon</asp:ListItem>
                    <asp:ListItem>Charizard</asp:ListItem>
                    <asp:ListItem>Squirtle</asp:ListItem>
                    <asp:ListItem>Wartortle</asp:ListItem>
                    <asp:ListItem>Blastoise</asp:ListItem>
                    <asp:ListItem>Caterpie</asp:ListItem>
                    <asp:ListItem>Metapod</asp:ListItem>
                    <asp:ListItem>Butterfree</asp:ListItem>
                    <asp:ListItem>Weedle</asp:ListItem>
                    <asp:ListItem>Kakuna</asp:ListItem>
                    <asp:ListItem>Beedrill</asp:ListItem>
                    <asp:ListItem>Pidgey</asp:ListItem>
                    <asp:ListItem>Pidgeotto</asp:ListItem>
                    <asp:ListItem>Pidgeot</asp:ListItem>
                    <asp:ListItem>Rattata</asp:ListItem>
                    <asp:ListItem>Raticate</asp:ListItem>
                    <asp:ListItem>Spearow</asp:ListItem>
                    <asp:ListItem>Fearow</asp:ListItem>
                    <asp:ListItem>Ekans</asp:ListItem>
                    <asp:ListItem>Arbok</asp:ListItem>
                    <asp:ListItem>Pikachu</asp:ListItem>
                    <asp:ListItem>Raichu</asp:ListItem>
                    <asp:ListItem>Sandshrew</asp:ListItem>
                    <asp:ListItem>Sandslash</asp:ListItem>
                    <asp:ListItem>Nidoran♀</asp:ListItem>
                    <asp:ListItem>Nidorina</asp:ListItem>
                    <asp:ListItem>Nidoqueen</asp:ListItem>
                    <asp:ListItem>Nidoran♂</asp:ListItem>
                    <asp:ListItem>Nidorino</asp:ListItem>
                    <asp:ListItem>Nidoking</asp:ListItem>
                    <asp:ListItem>Clefairy</asp:ListItem>
                    <asp:ListItem>Clefable</asp:ListItem>
                    <asp:ListItem>Vulpix</asp:ListItem>
                    <asp:ListItem>Ninetales</asp:ListItem>
                    <asp:ListItem>Jigglypuff</asp:ListItem>
                    <asp:ListItem>Wigglytuff</asp:ListItem>
                    <asp:ListItem>Zubat</asp:ListItem>
                    <asp:ListItem>Golbat</asp:ListItem>
                    <asp:ListItem>Oddish</asp:ListItem>
                    <asp:ListItem>Gloom</asp:ListItem>
                    <asp:ListItem>Vileplume</asp:ListItem>
                    <asp:ListItem>Paras</asp:ListItem>
                    <asp:ListItem>Parasect</asp:ListItem>
                    <asp:ListItem>Venonat</asp:ListItem>
                    <asp:ListItem>Venomoth</asp:ListItem>
                    <asp:ListItem>Diglett</asp:ListItem>
                    <asp:ListItem>Dugtrio</asp:ListItem>
                    <asp:ListItem>Meowth</asp:ListItem>
                    <asp:ListItem>Persian</asp:ListItem>
                    <asp:ListItem>Psyduck</asp:ListItem>
                    <asp:ListItem>Golduck</asp:ListItem>
                    <asp:ListItem>Mankey</asp:ListItem>
                    <asp:ListItem>Primeape</asp:ListItem>
                    <asp:ListItem>Growlithe</asp:ListItem>
                    <asp:ListItem>Arcanine</asp:ListItem>
                    <asp:ListItem>Poliwag</asp:ListItem>
                    <asp:ListItem>Poliwhirl</asp:ListItem>
                    <asp:ListItem>Poliwrath</asp:ListItem>
                    <asp:ListItem>Abra</asp:ListItem>
                    <asp:ListItem>Kadabra</asp:ListItem>
                    <asp:ListItem>Alakazam</asp:ListItem>
                    <asp:ListItem>Machop</asp:ListItem>
                    <asp:ListItem>Machoke</asp:ListItem>
                    <asp:ListItem>Machamp</asp:ListItem>
                    <asp:ListItem>Bellsprout</asp:ListItem>
                    <asp:ListItem>Weepinbell</asp:ListItem>
                    <asp:ListItem>Victreebel</asp:ListItem>
                    <asp:ListItem>Tentacool</asp:ListItem>
                    <asp:ListItem>Tentacruel</asp:ListItem>
                    <asp:ListItem>Geodude</asp:ListItem>
                    <asp:ListItem>Graveler</asp:ListItem>
                    <asp:ListItem>Golem</asp:ListItem>
                    <asp:ListItem>Ponyta</asp:ListItem>
                    <asp:ListItem>Rapidash</asp:ListItem>
                    <asp:ListItem>Slowpoke</asp:ListItem>
                    <asp:ListItem>Slowbro</asp:ListItem>
                    <asp:ListItem>Magnemite</asp:ListItem>
                    <asp:ListItem>Magneton</asp:ListItem>
                    <asp:ListItem>Farfetch'd</asp:ListItem>
                    <asp:ListItem>Doduo</asp:ListItem>
                    <asp:ListItem>Dodrio</asp:ListItem>
                    <asp:ListItem>Seel</asp:ListItem>
                    <asp:ListItem>Dewgong</asp:ListItem>
                    <asp:ListItem>Grimer</asp:ListItem>
                    <asp:ListItem>Muk</asp:ListItem>
                    <asp:ListItem>Shellder</asp:ListItem>
                    <asp:ListItem>Cloyster</asp:ListItem>
                    <asp:ListItem>Gastly</asp:ListItem>
                    <asp:ListItem>Haunter</asp:ListItem>
                    <asp:ListItem>Gengar</asp:ListItem>
                    <asp:ListItem>Onix</asp:ListItem>
                    <asp:ListItem>Drowzee</asp:ListItem>
                    <asp:ListItem>Hypno</asp:ListItem>
                    <asp:ListItem>Krabby</asp:ListItem>
                    <asp:ListItem>Kingler</asp:ListItem>
                    <asp:ListItem>Voltorb</asp:ListItem>
                    <asp:ListItem>Electrode</asp:ListItem>
                    <asp:ListItem>Exeggcute</asp:ListItem>
                    <asp:ListItem>Exeggutor</asp:ListItem>
                    <asp:ListItem>Cubone</asp:ListItem>
                    <asp:ListItem>Marowak</asp:ListItem>
                    <asp:ListItem>Hitmonlee</asp:ListItem>
                    <asp:ListItem>Hitmonchan</asp:ListItem>
                    <asp:ListItem>Lickitung</asp:ListItem>
                    <asp:ListItem>Koffing</asp:ListItem>
                    <asp:ListItem>Weezing</asp:ListItem>
                    <asp:ListItem>Rhyhorn</asp:ListItem>
                    <asp:ListItem>Rhydon</asp:ListItem>
                    <asp:ListItem>Chansey</asp:ListItem>
                    <asp:ListItem>Tangela</asp:ListItem>
                    <asp:ListItem>Kangaskhan</asp:ListItem>
                    <asp:ListItem>Horsea</asp:ListItem>
                    <asp:ListItem>Seadra</asp:ListItem>
                    <asp:ListItem>Goldeen</asp:ListItem>
                    <asp:ListItem>Seaking</asp:ListItem>
                    <asp:ListItem>Staryu</asp:ListItem>
                    <asp:ListItem>Starmie</asp:ListItem>
                    <asp:ListItem>Mr. Mime</asp:ListItem>
                    <asp:ListItem>Scyther</asp:ListItem>
                    <asp:ListItem>Jynx</asp:ListItem>
                    <asp:ListItem>Electabuzz</asp:ListItem>
                    <asp:ListItem>Magmar</asp:ListItem>
                    <asp:ListItem>Pinsir</asp:ListItem>
                    <asp:ListItem>Tauros</asp:ListItem>
                    <asp:ListItem>Magikarp</asp:ListItem>
                    <asp:ListItem>Gyarados</asp:ListItem>
                    <asp:ListItem>Lapras</asp:ListItem>
                    <asp:ListItem>Ditto</asp:ListItem>
                    <asp:ListItem>Eevee</asp:ListItem>
                    <asp:ListItem>Vaporeon</asp:ListItem>
                    <asp:ListItem>Jolteon</asp:ListItem>
                    <asp:ListItem>Flareon</asp:ListItem>
                    <asp:ListItem>Porygon</asp:ListItem>
                    <asp:ListItem>Omanyte</asp:ListItem>
                    <asp:ListItem>Omastar</asp:ListItem>
                    <asp:ListItem>Kabuto</asp:ListItem>
                    <asp:ListItem>Kabutops</asp:ListItem>
                    <asp:ListItem>Aerodactyl</asp:ListItem>
                    <asp:ListItem>Snorlax</asp:ListItem>
                    <asp:ListItem>Articuno</asp:ListItem>
                    <asp:ListItem>Zapdos</asp:ListItem>
                    <asp:ListItem>Moltres</asp:ListItem>
                    <asp:ListItem>Dratini</asp:ListItem>
                    <asp:ListItem>Dragonair</asp:ListItem>
                    <asp:ListItem>Dragonite</asp:ListItem>
                    <asp:ListItem>Mewtwo</asp:ListItem>
                    <asp:ListItem>Mew</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-sm-2">
                <p style="margin-left: auto; margin-right: auto; text-align: center;"><b>CP</b></p>
                <asp:TextBox runat="server" ID="cpTextBox" CssClass="form-control">
                </asp:TextBox>
            </div>

            <div class="col-sm-2">
                <p style="margin-left: auto; margin-right: auto; text-align: center;"><b>Health (HP)</b></p>
                <asp:TextBox runat="server" ID="hpTextBox" CssClass="form-control">
                </asp:TextBox>
            </div>

            <div class="col-sm-2">
                <p style="margin-left: auto; margin-right: auto; text-align: center;"><b>Trainer Level</b></p>
                <asp:DropDownList ID="trainerLevelDDL"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="trainerLevelDDLSelection_Change"
                    runat="server"
                    CssClass="form-control">

                    <asp:ListItem Selected="True">2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    <asp:ListItem>32</asp:ListItem>
                    <asp:ListItem>33</asp:ListItem>
                    <asp:ListItem>34</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>36</asp:ListItem>
                    <asp:ListItem>37</asp:ListItem>
                    <asp:ListItem>38</asp:ListItem>
                    <asp:ListItem>39</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-sm-2">
                <p style="margin-left: auto; margin-right: auto; text-align: center;"><b>Powered</b></p>
                <asp:DropDownList ID="poweredDDL"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="poweredDDLSelection_Change"
                    runat="server"
                    CssClass="form-control">

                    <asp:ListItem Selected="True">No</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>

                </asp:DropDownList>
            </div>
        </div>
        <!-- Result Label -->
        <div class="well well-lg" style="margin-top: 20px">
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <asp:Label ID="resultLabel" runat="server" Text="PERFECT: " Font-Bold="true" Font-Size="X-Large"
                    CssClass="StrongText">
                
                </asp:Label>
            </div>
        </div>
    </div>

    <!-- Max Values -->
    <hr />
    <a name="MaxStatsAnchor"></a>
    <div class="container-fluid" runat="server" style="font-family: 'Century Gothic'; padding-left: 100px; padding-right: 100px;">
        <div style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 20px; margin-bottom: 10px;">
            <asp:Label ID="Label1" runat="server" Text="Pokemon: Statistics" Font-Bold="true" Font-Size="X-Large"
                CssClass="StrongText">
                
            </asp:Label>
        </div>
        <div class="well well-lg">
            <div class="row" runat="server" id="statsRow">
                <div class="col-lg-6">
                    <asp:DropDownList ID="pStatsDDL"
                        AutoPostBack="True"
                        OnSelectedIndexChanged="pStatsDDLSelection_Change"
                        runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-6">
                    <div style="margin-left: auto; margin-right: auto; text-align: left;">
                        <asp:Label ID="maxStatsLabel" runat="server" Text="" Font-Size="X-Large"
                            CssClass="StrongText">
                
                        </asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        

    </script>
</asp:Content>


