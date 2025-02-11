﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Sonuclandi.aspx.vb" Inherits="ArerTicket.Sonuclandi" %>

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

        .popup-trigger {
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
            grid-template-columns: repeat(1, 1fr);
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
                grid-template-columns: repeat(1, 1fr);
            }
        }

        @media only screen and (min-width: 768px) {
            .popup-container {
                width: 80%; 
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section id="sidebar">
            <a href="#" class="brand">ARER BAKIM</a>
            <ul class="side-menu">
                <li><a href="anasayfa.aspx"><i class='bx bxs-message icon'></i>TİCKETS</a></li>
                <li class="divider" data-text="İŞLEMLER">İŞLEMLER</li>
                <li><a href="#"><i class='bx bxs-check-square icon'></i>SON İŞLEMLER</a></li>
                <li><a href="#" class="active"><i class='bx bx-user-check icon'></i>SONUÇLANANLAR</a></li>
            </ul>
        </section>

        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu toggle-sidebar' id="menuac"></i>
                <span class="divider"></span>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>

                <asp:Label runat="server" ID="dosyakayitdeneme"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="data">
                    <div class="content-data">
                        <div class="head">
                            <div class="denemecontainer">
                                <h3 style="color: #f87c1d;">SONUÇLANANLAR</h3>
                                <div class="buttoncontainer">
                                    <a href="anasayfa.aspx" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px;">GERİ</a>
                                </div>
                            </div>
                        </div>
        
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%" CssClass="anagrid">
                            <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
                            <SettingsSearchPanel Visible="True" />

                            <SettingsSearchPanel Visible="False" />

                            <Styles>
                                <Header Wrap="True" BackColor="White" Font-Names="Arial Black" Font-Size="7pt"></Header>

                                <SelectedRow BackColor="#F87C1D" ForeColor="White">
                                </SelectedRow>
                            </Styles>
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                                AllowHideDataCellsByColumnMinWidth="true">
                            </SettingsAdaptivity>
                            <SettingsPager PageSize="32" />
                            <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="480" ShowHeaderFilterButton="True" />

                            <SettingsBehavior AllowEllipsisInText="true" AllowFocusedRow="False" AllowSelectByRowClick="False" ProcessFocusedRowChangedOnServer="False"/>

                            <SettingsPopup>
                                <HeaderFilter PopupAnimationType="Slide">
                                </HeaderFilter>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="1" Caption="ID" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sil" VisibleIndex="2" Caption="Sil" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="tarih" VisibleIndex="3" Caption="Tarih" MinWidth="60" SortOrder="Descending">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="baslik" VisibleIndex="4" Caption="Başlık">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="aciklama" VisibleIndex="5" Caption="Açıklama">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sonuc_aciklama" VisibleIndex="6" Caption="Sonuç Açıklama">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="durum" VisibleIndex="7" Caption="Durum">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ticket_acan" VisibleIndex="8" Caption="İşlm Açan">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="proje" VisibleIndex="9" Caption="Proje">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="firma" VisibleIndex="10" Caption="Firma">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ticket_id" VisibleIndex="11" Caption="Ticket ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Dosya" FieldName="dosya" VisibleIndex="11">
                                    <PropertiesHyperLinkEdit NullDisplayText="Dosya Eklenmedi">
                                    </PropertiesHyperLinkEdit>
                                </dx:GridViewDataHyperLinkColumn>
                            </Columns>
                            
                            <Styles AdaptiveDetailButtonWidth="14">
                                <Header Font-Names="Arial Black" Font-Size="7pt" Wrap="True" BackColor="White"></Header>
                                <SelectedRow BackColor="#F87C1D" ForeColor="White"></SelectedRow>
                            </Styles>
                            <Paddings Padding="0px" />
                            <Border BorderWidth="0px" />
                            <BorderBottom BorderWidth="1px" />
                        </dx:ASPxGridView>

                        <%--<dx:ASPxCardView ID="ASPxCardView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id" Width="100%" Font-Bold="True" Cursor="pointer" SettingsEditing-NewCardPosition="Top">
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
                                <dx:CardViewTextColumn FieldName="aciklama" VisibleIndex="3" Caption="Açıklama">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="tarih" VisibleIndex="4" Caption="Tarih" PropertiesTextEdit-DisplayFormatString="d" SortOrder="Descending">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="durum" VisibleIndex="5" Caption="Durum" Visible="false">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="ticket_acan" VisibleIndex="6" Caption="İşlem Açan">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="proje" VisibleIndex="7" Caption="Proje" Visible="false">
                                    <PropertiesTextEdit>
                                        <FocusedStyle Font-Bold="True" ForeColor="White">
                                        </FocusedStyle>
                                    </PropertiesTextEdit>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="firma" ReadOnly="True" Visible="true" Caption="Firma" VisibleIndex="8">
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
                                <dx:CardViewHyperLinkColumn FieldName="dosya" Caption="Dosya" VisibleIndex="10"></dx:CardViewHyperLinkColumn>

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
                            <EditFormLayoutProperties>
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit">
                                </SettingsAdaptivity>
                            </EditFormLayoutProperties>
                            <CardLayoutProperties ColumnCount="1">
                                <Items>
                                    <dx:CardViewCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                                    </dx:CardViewCommandLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="tarih">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="baslik">
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
                        </dx:ASPxCardView>--%>                            

                    </div>
                </div>

<%--                <asp:HyperLink ID="dosyayiac" runat="server" Target="_blank" NavigateUrl='<%# Eval("DosyaYolu") %>' Text="Dosyayı Görüntüle" Visible='<%# Not String.IsNullOrEmpty(Eval("DosyaYolu").ToString()) %>'></asp:HyperLink>--%>

            </main>
            <%--<asp:Image runat="server" ID="resim"/>--%>
            <!-- MAIN -->
        </section>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="JS/JS1.js"></script>

        <asp:HiddenField runat="server" ID="selectedSonuc"/>
        <asp:HiddenField runat="server" ID="selectedAriza" />
    </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
