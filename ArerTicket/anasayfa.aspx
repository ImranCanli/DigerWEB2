<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="anasayfa.aspx.vb" Inherits="ArerTicket.anasayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet' />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/STYLE1.css" rel="stylesheet" />
    <script src="JS/bootstrap.min.js"></script>
    <title>ARER TICKET</title>
    <style>
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 10002;
            background: rgba(0, 0, 0, 0.7);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .popup-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.7);
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            max-width: 700px;
            width: 100%;
            text-align: center;
            z-index: 10002;
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .close-btn {
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
        }

        /* Stil özelleştirmeleri burada yapılabilir */
        .popup-trigger {
            color: #fff; /* veya diğer renk tercihinize göre ayarlayabilirsiniz */
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            font-size: 12px;
            z-index: 1;
            padding: 5px 20px;
            display: inline-block;
            background: #f87c1d;
            border-radius: 5px;
        }

            .popup-trigger:hover {
                color: #555;
            }

        .stokeklebtn {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            padding: 5px 20px;
            height: 40px;
            width: 80%;
            display: inline-block;
            background: #f87c1d;
            border-radius: 5px;
            outline: none;
            border: none;
            top: 10px;
            margin: 10px auto;
            cursor: pointer;
        }

            .stokeklebtn:hover {
                color: #555;
            }

        .stoksilbtn {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            padding: 6px 20px;
            display: inline-block;
            background: red;
            font-size: 12px;
            border-radius: 5px;
            border: none;
            outline: none;
            z-index: 1;
            cursor: pointer;
        }

            .stoksilbtn:hover {
                color: #555;
            }

        .eladio {
            display: grid;
            height: 100%;
            width: 100%;
            grid-template-columns: repeat(1, 1fr);
            text-align: center;
            align-items: center;
            justify-content: center;
            margin: auto;
            line-height: 2rem;
            box-sizing: border-box;
        }

        .buttoncontainer {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            justify-self: end;
        }

        .denemecontainer {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            width: 100%;
        }

        .anagrid {
            width: calc(100%);
        }

        .popup-trigger1 {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            font-size: 12px;
            z-index: 1;
            padding: 5px 20px;
            display: none;
            background: #f87c1d;
            border-radius: 5px;
        }

        @media only screen and (min-width: 315px) {
            .popup-container {
                width: 80%;
            }
        }

        @media only screen and (min-width: 420px) {
            .popup-container {
                width: 80%;
            }
        }

        @media only screen and (max-width: 565px) {
            .popup-container {
                width: 80%;
            }

            .denemecontainer {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media only screen and (max-width: 960px) {
            .popup-container {
                width: 80%;
            }

            .buttoncontainer {
                grid-template-columns: repeat(1, 1fr);
            }

            .popup-trigger {
                display: none;
            }

            .popup-trigger1 {
                display: inline-block;
            }
        }

        @media only screen and (min-width: 1200px) {
            .popup-container {
                width: 80%;
            }
        }
        #FileUpload1 {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }


        #CustomButton {
            background-color: #f87c1d; 
            color: white;
            width: 47%;
            height: 43px;
            padding: 10px 15px;
            cursor: pointer;
            border: none;
            left: 0;
            margin-right: 10px;
            border-radius: 5px;
        }

            #CustomButton:hover {
                color: #555;
            }

        #FileLabel {
            margin-top: 10px;
        }

        #FileUpload2 {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }

        #CustomButton2 {
            background-color: #f87c1d;
            color: white;
            width: 47%;
            height: 43px;
            padding: 10px 15px;
            cursor: pointer;
            border: none;
            left: 0;
            margin-right: 10px;
            border-radius: 5px;
        }

            #CustomButton2:hover {
                color: #555;
            }

        #FileLabel2 {
            margin-top: 10px;
        }

        #FileUpload3 {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }

        #CustomButton3 {
            background-color: #f87c1d;
            color: white;
            width: 47%;
            height: 43px;
            padding: 10px 15px;
            cursor: pointer;
            border: none;
            left: 0;
            margin-right: 10px;
            border-radius: 5px;
        }

            #CustomButton3:hover {
                color: #555;
            }

        #Label1 {
            margin-top: 10px;
        }

        .anacard {
            overflow-y: scroll;
            height: 300px;
            width: 300px;
            min-height: 300px;
        }

        .silcontainer {
            display: grid;
            width: 100%;
            margin: 0;
            padding: 15px;
            grid-template-columns: repeat(2, 1fr);
        }

        .popup-trigger_new {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            font-size: 12px;
            z-index: 1;
            padding: 5px 20px;
            display: inline-block;
            background: #f87c1d;
            border-radius: 5px;
        }

            .popup-trigger_new:hover {
                color: #555;
            }

        .gorunenkoy {
            display: block;
        }

        .gorunmeyenkoy {
            display: none;
        }
    </style>
</head>
<body>
    <script type="text/javascript">

        function OnCardSelectionChanged(s, e) {
            s.GetSelectedFieldValues("firma;baslik;aciklama;ticket_acan;proje", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {

            var fieldValues = values[0].slice(',');

            document.getElementById("<%= guncelfirmaentry.ClientID %>").value = fieldValues[0];
            document.getElementById("<%= guncelbaslikentry.ClientID %>").value = fieldValues[1];
            document.getElementById("<%= guncelaciklamaentry.ClientID %>").value = fieldValues[2];
            document.getElementById("<%= guncelacanentry.ClientID %>").value = fieldValues[3];
            document.getElementById("<%= guncelprojeentry.ClientID %>").value = fieldValues[4];
        <%--document.getElementById("<%= mevcutDosya.ClientID %>").value = fieldValues[5];--%>

        }

        function dropdownChange() {
            var dropdown = document.getElementById('<%= DropDownList2.ClientID %>');
            var textBox = document.getElementById('<%= guncelsonucaciklama.ClientID %>');

            if (dropdown.value === "Sonuçlandı") {
                textBox.classList.remove("gorunmeyenkoy");
                textBox.classList.add("gorunenkoy");
            } else {
                textBox.classList.remove("gorunenkoy");
                textBox.classList.add("gorunmeyenkoy");
            }
        }
    </script>

    <form id="form1" runat="server">
        <section id="sidebar">
            <a href="#" class="brand">ARER BAKIM</a>
            <ul class="side-menu">
                <li><a href="#" class="active"><i class='bx bxs-message icon'></i>TİCKETS</a></li>
                <li class="divider" data-text="STOK">İŞLEMLER</li>
                <li><a href="SonIslemler.aspx"><i class='bx bxs-check-square icon'></i>SON İŞLEMLER</a></li>
                <li><a href="Sonuclandi.aspx"><i class='bx bx-user-check icon'></i>SONUÇLANANLAR</a></li>
            </ul>
        </section>

        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu toggle-sidebar' id="menuac"></i>
                <span class="divider"></span>
            </nav>
            <!-- NAVBAR -->
            <asp:SqlDataSource runat="server" ID="SqlDataSource2"></asp:SqlDataSource>
            <!-- POPUP -->

            <div class="popup-overlay" id="popupOverlay2" onclick="closePopup('popupOverlay2')">
                <div class="popup-container" id="popupContainer2" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay2')">&times;</span>
                    <h2>GÜNCELLE</h2>
                    <div class="eladio">
                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">

                            <asp:FileUpload ID="FileUpload3" runat="server" CssClass="file-upload" onchange="updateButtonText3()" AllowMultiple="false" />

                            <button type="button" id="CustomButton3" onclick="document.getElementById('FileUpload3').click()">Dosya Seç</button>

                            <asp:Label ID="Label1" runat="server" />
                        </div>
                        <%--                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">
                             <asp:HyperLink runat="server" ID="mevcutDosya" style="margin:auto;"></asp:HyperLink>
                        </div>--%>
                        <h6>TARİH</h6>
                        <asp:TextBox ID="guncelledate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="guncelacanentry" placeholder="İşlem Açan İsim Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelfirmaentry" placeholder="Firma Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelbaslikentry" placeholder="Başlık Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelprojeentry" placeholder="Proje Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelaciklamaentry" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelsonucaciklama" TextMode="MultiLine" placeholder="Sonuç Açıklaması Giriniz" CssClass="gorunmeyenkoy" Style="width: 80%; height: 100px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="DropDownList2" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;" onchange="dropdownChange()">
                            <asp:ListItem Text="Sonuçlanmadı" Value="Sonuçlanmadı" style="font-size: 12px;"></asp:ListItem>
                            <asp:ListItem Text="Sonuçlandı" Value="Sonuçlandı" style="font-size: 12px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button runat="server" ID="guncellebuton" CssClass="stokeklebtn" OnClick="guncellebuton_Click" Text="GÜNCELLE" />
                        <asp:Label runat="server" ID="Label2" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay3" onclick="closePopup('popupOverlay3')">
                <div class="popup-container" id="popupContainer3" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay3')">&times;</span>
                    <h2>İŞLEM SEÇ</h2>

                    <div class="eladio">
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay1')">YENİ</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay4')">İŞLEM</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay2')">GÜNCELLE</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay6')">Sil</a>
                        <a href="TicketIslem.aspx" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;">İŞLEMLER</a>
                    </div>
                </div>
            </div>


            <div class="popup-overlay" id="popupOverlay6" onclick="closePopup('popupOverlay6')">
                <div class="popup-container" id="popupContainer6" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay6')">&times;</span>
                    <h2>TİCKET SİL</h2>

                    
                    <div class="silcontainer">
                        <asp:Button runat="server" ID="silbuton" CssClass="stokeklebtn" Text="SİL" Style="background-color: red; margin: 5px auto; width: 80%;" OnClick="silbuton_Click" />
                        <a href="#" class="popup-trigger_new" style="z-index: 2; height: 40px; margin: 13px auto; text-align: center; width: 80%; padding-top: 10px; padding: 5px 20px;" onclick="closePopup('popupOverlay6')">VAZGEÇ</a>

                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay4" onclick="closePopup('popupOverlay4')">
                <div class="popup-container" id="popupContainer4" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay4')">&times;</span>
                    <h2>TİCKET İŞLEM</h2>

                    <div class="eladio">
                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">

                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="file-upload" onchange="updateButtonText2()" AllowMultiple="false" />

                            <button type="button" id="CustomButton2" onclick="document.getElementById('FileUpload2').click()">Dosya Seç</button>

                            <asp:Label ID="FileLabel2" runat="server" />
                        </div>
                        <h6>İŞLEM TARİHİ</h6>
                        <asp:TextBox ID="TextBox6" runat="server" type="date" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <!-- işlem parametreleri -->
                        <asp:TextBox runat="server" TextMode="MultiLine" ID="islementry" placeholder="İşlem giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="yapanentry" placeholder="İşlem yapan Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:Button runat="server" ID="islem_ekle" OnClick="islem_ekle_Click" CssClass="stokeklebtn" Text="İŞLEM EKLE" Style="background-color: green;" />
                        <asp:Label runat="server" ID="Label3" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>


            <div class="popup-overlay" id="popupOverlay1" onclick="closePopup('popupOverlay1')">
                <div class="popup-container" id="popupContainer1" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay1')">&times;</span>
                    <h2>YENİ TİCKET</h2>

                    <div class="eladio">

                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">

                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload" onchange="updateButtonText()" AllowMultiple="false" />

                            <button type="button" id="CustomButton" onclick="document.getElementById('FileUpload1').click()">Dosya Seç</button>

                            <asp:Label ID="FileLabel" runat="server" />
                        </div>

                        <h6>TARİH</h6>
                        <asp:TextBox ID="txtTicketaDate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="acanentry" placeholder="Ticket Açan İsim Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="firmaentry" placeholder="Firma Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="baslikentry" placeholder="Başlık Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="projeentry" placeholder="Proje Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="aciklamaentry" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <%--                        <asp:DropDownList runat="server" ID="DropDownList1" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Sonuçlandı" Value="Sonuçlandı" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Sonuçlanmadı" Value="Sonuçlanmadı" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>--%>

                        <%--<div class="dropdown" style="width:80%; background-color:#f87c1d; margin:auto; border-radius:5px;" visible="false">
                            <asp:button runat="server" id="btnArizaTuru" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="width:100%; border-radius:5px; background-color:#f87c1d; border:none; outline:none;" Text="Arıza Türü"></asp:button>
                            <ul class="dropdown-menu" style="width:100%;">
                                <li>
                                    <asp:Button runat="server" CssClass="dropdown-item" type="button" Text="Arıza" OnClientClick="dropdownItemSelected('Arıza');"></asp:Button></li>
                                <li>
                                    <asp:Button runat="server" CssClass="dropdown-item" type="button" Text="Bakım" OnClientClick="dropdownItemSelected('Bakım');"></asp:Button></li>
                            </ul>
                        </div>--%>

                        <asp:Button runat="server" ID="ticket_akle" CssClass="stokeklebtn" OnClick="ticket_akle_Click" Text="TİCKET EKLE" />
                        <asp:Label runat="server" ID="uyarilabel" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>
            <!--POPUP -->

            <!-- MAIN -->
            <main>
                <%--<div class="info-data">
				<div class="card">
					<div class="head">
						<div>
							<h2><asp:Label runat="server" ID="girenstoklabel"></asp:Label></h2>
							<p>GİREN</p>
						</div>
						<i class='bx bx-trending-up icon' ></i>
					</div>
				</div>
				<div class="card">
					<div class="head">
						<div>
							<h2><asp:Label runat="server" ID="cikanstoklabel"></asp:Label></h2>
							<p>ÇIKAN</p>
						</div>
						<i class='bx bx-trending-down icon down' ></i>
					</div>
				</div>
			</div>--%>
                <asp:Label runat="server" ID="arizaturulabel" Visible="false"></asp:Label>
                <asp:Label runat="server" ID="dosyakayitdeneme"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="data" style="min-height: 100vh;">
                    <div class="content-data" style="height: 100%">
                        <div class="head">
                            <div class="denemecontainer">
                                <h3 style="color: #f87c1d;">TİCKETS</h3>
                                <div class="buttoncontainer">
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay1')">YENİ</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay6')">SİL</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay4')">İŞLEM</a>
                                    <a href="TicketIslem.aspx" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px;">İŞLEMLER</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay2')">GÜNCELLE</a>
                                    <a href="#" class="popup-trigger1" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay3')">SEÇ</a>
                                </div>
                            </div>
                        </div>

                        <%--<dx:ASPxCardView runat="server" ID="ASPxCardView1" DataSourceID="SqlDataSource1" Width="100%" AutoGenerateColumns="False" KeyFieldName="id">
                            <SettingsBehavior AllowFocusedCard="True" ProcessFocusedCardChangedOnServer="True" AllowSelectByCardClick="true" AllowSelectSingleCardOnly="true" />
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            <SettingsPopup>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>

                            <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>

                            <Columns>
                                <dx:CardViewTextColumn FieldName="id" Caption="ID" Visible="false"></dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="tarih" Caption="Tarih" VisibleIndex="0">
                                </dx:CardViewTextColumn>
                                <dx:CardViewColumn FieldName="baslik" Caption="baslik"></dx:CardViewColumn>
                                <dx:CardViewTextColumn FieldName="firma" Caption="Firma" VisibleIndex="1">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="proje" Caption="Proje" VisibleIndex="2">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="baslik" Caption="Başlık" VisibleIndex="3">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="aciklama" Caption="Açıklama" VisibleIndex="4">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="sonuc" Caption="Sonuç" VisibleIndex="5">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="durum" Caption="Durum" VisibleIndex="6">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="islemsay" Caption="İşlem sayısı" VisibleIndex="7">
                                </dx:CardViewTextColumn>
                                <dx:CardViewHyperLinkColumn FieldName="dosya" Caption="Dosya" VisibleIndex="8">
                                </dx:CardViewHyperLinkColumn>
                            </Columns>

                            <EditFormLayoutProperties ColumnCount="2">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="760">
                                </SettingsAdaptivity>
                            </EditFormLayoutProperties>
                            <CardLayoutProperties ColumnCount="1">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit">
                                </SettingsAdaptivity>
                            </CardLayoutProperties>
                            <CardLayoutProperties>
                                <Items>
                                    <dx:CardViewCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                                    </dx:CardViewCommandLayoutItem>
                                    <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                                    </dx:EditModeCommandLayoutItem>
                                </Items>
                            </CardLayoutProperties>
                            <Styles>
                                <FocusedCard BackColor="#F87C1D" Font-Bold="True" ForeColor="White">
                                </FocusedCard>
                            </Styles>

                            <StylesExport>
                                <Card BorderSize="1" BorderSides="All"></Card>

                                <Group BorderSize="1" BorderSides="All"></Group>

                                <TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>

                                <Tab BorderSize="1"></Tab>
                            </StylesExport>
                        </dx:ASPxCardView>--%>


                        <dx:ASPxCardView ID="ASPxCardView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id" Width="100%" Font-Bold="True" Cursor="pointer" SettingsEditing-NewCardPosition="Top">
                            <Settings LayoutMode="Breakpoints" />
                            <SettingsAdaptivity>
                                <BreakpointsLayoutSettings CardsPerRow="3">
                                    <Breakpoints>
                                        <dx:CardViewBreakpoint DeviceSize="Custom" MaxWidth="1200" CardsPerRow="3" />
                                        <dx:CardViewBreakpoint DeviceSize="Custom" MaxWidth="980" CardsPerRow="2" />
                                        <dx:CardViewBreakpoint DeviceSize="Custom" MaxWidth="600" CardsPerRow="1" />
                                    </Breakpoints>
                                </BreakpointsLayoutSettings>
                            </SettingsAdaptivity>
                            <SettingsBehavior AllowFocusedCard="True" AllowSelectByCardClick="True" AllowSelectSingleCardOnly="True" ProcessFocusedCardChangedOnServer="True" />
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                            <SettingsPopup>
                                <EditForm AllowResize="True" AutoUpdatePosition="True" CloseOnEscape="True" HorizontalAlign="Center">
                                </EditForm>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>
                            <ClientSideEvents SelectionChanged="OnCardSelectionChanged" />
                            <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Columns>
                                <dx:CardViewTextColumn FieldName="id" VisibleIndex="0" Caption="ID" Visible="false">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="sil" VisibleIndex="1" Caption="sil" Visible="false">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="baslik" VisibleIndex="2" Caption="Başlık">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="proje" VisibleIndex="3" Caption="Proje">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="aciklama" VisibleIndex="4" Caption="Açıklama">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="tarih" VisibleIndex="5" Caption="Tarih" PropertiesTextEdit-DisplayFormatString="d" SortOrder="Descending">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="durum" VisibleIndex="6" Caption="Durum" Visible="false">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="ticket_acan" VisibleIndex="7" Caption="İşlem Açan">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="proje" VisibleIndex="8" Caption="Proje" Visible="false">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="firma" ReadOnly="True" Visible="true" Caption="Firma" VisibleIndex="9">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="islemsay" Visible="true" Caption="İşlem sayısı" VisibleIndex="10">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="ticket_id" Visible="false" Caption="ID">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewHyperLinkColumn FieldName="dosya" Caption="Dosya" VisibleIndex="11"></dx:CardViewHyperLinkColumn>

                            </Columns>

                            <Styles BreakpointsCard-Height="100%" Card-Height="200px" BatchEditCell-Paddings-Padding="20px">
                                <Card Height="200px" Width="280px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="anacard" Paddings-Padding="10px">
                                    <Paddings Padding="10px"></Paddings>
                                </Card>

                                <BreakpointsCard Height="100%"></BreakpointsCard>

                                <CardError HorizontalAlign="Center" VerticalAlign="Middle">
                                </CardError>
                                <EditFormCard HorizontalAlign="Center" VerticalAlign="Middle">
                                </EditFormCard>

                                <BatchEditCell>
                                    <Paddings Padding="20px"></Paddings>
                                </BatchEditCell>
                            </Styles>
                            <%--<EditFormLayoutProperties ColumnCount="3">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="790">
                                </SettingsAdaptivity>
                            </EditFormLayoutProperties>--%>
                            <EditFormLayoutProperties>
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit">
                                </SettingsAdaptivity>
                            </EditFormLayoutProperties>
                            <CardLayoutProperties ColumnCount="1">
                                <Items>
                                    <dx:CardViewCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                                    </dx:CardViewCommandLayoutItem>
                                    <%--<dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="id">
                                    </dx:CardViewColumnLayoutItem>--%>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="tarih">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="baslik">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="proje">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="aciklama">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="firma">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="İşlem sayısı">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="dosya">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="İşlem Açan">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                                    </dx:EditModeCommandLayoutItem>
                                </Items>
                            </CardLayoutProperties>

                            <StylesExport>
                                <Card BorderSize="1" BorderSides="All"></Card>
                                <Group BorderSize="1" BorderSides="All"></Group>
                                <TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>
                                <Tab BorderSize="1"></Tab>
                            </StylesExport>
                        </dx:ASPxCardView>
                    </div>
                </div>

            </main>
            <%--<asp:Image runat="server" ID="resim"/>--%>
            <!-- MAIN -->
        </section>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="JS/JS1.js"></script>

        <asp:HiddenField runat="server" ID="selectedSonuc" />
        <asp:HiddenField runat="server" ID="selectedAriza" />
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>

        //var menu1 = document.getElementById("menuac");
        //menu1.addEventListener("click", function () {
        //    var sidemenu = document.getElementById("sidebar");

        //    if (sidemenu.classList.contains("hide")) {
        //        sidemenu.classList.remove("hide");
        //    }
        //    else {
        //        sidemenu.classList.add("hide")
        //    }
        //});


        //document.addEventListener("DOMContentLoaded", function () {

        //    var side = document.getElementById("sidebar");
        //    side.classList.add("hide");

        //});

        function updateButtonText() {
            var fileUpload = document.getElementById('FileUpload1');
            var customButton = document.getElementById('CustomButton');
            var fileLabel = document.getElementById('<%= FileLabel.ClientID %>');

            if (fileUpload.files.length > 0) {
                customButton.innerText = 'Dosya Seçildi';
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
                customButton.innerText = 'Dosya Seç';
                fileLabel.innerText = '';
            }
        }

        function updateButtonText2() {
            var fileUpload = document.getElementById('FileUpload2');
            var customButton = document.getElementById('CustomButton2');
            var fileLabel = document.getElementById('<%= FileLabel2.ClientID %>');

            if (fileUpload.files.length > 0) {
                customButton.innerText = 'Dosya Seçildi';
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
                customButton.innerText = 'Dosya Seç';
                fileLabel.innerText = '';
            }
        }

        function updateButtonText3() {
            var fileUpload = document.getElementById('FileUpload3');
            var customButton = document.getElementById('CustomButton3');
            var fileLabel = document.getElementById('<%= Label1.ClientID %>');

            if (fileUpload.files.length > 0) {
                customButton.innerText = 'Dosya Seçildi';
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
                customButton.innerText = 'Dosya Seç';
                fileLabel.innerText = '';
            }
        }

        function openPopup2(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.display = 'block';

            setTimeout(function () {
                popupOverlay.style.opacity = 1;
                popupContainer.style.opacity = 1;
            }, 10);
            closePopup('popupOverlay3');
        }

        function openPopup(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.display = 'block';

            setTimeout(function () {
                popupOverlay.style.opacity = 1;
                popupContainer.style.opacity = 1;
            }, 10);

        }

        function closePopup(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.opacity = 0;
            popupContainer.style.opacity = 0;

            setTimeout(function () {
                popupOverlay.style.display = 'none';
            }, 300);
        }
    </script>
</body>
</html>
