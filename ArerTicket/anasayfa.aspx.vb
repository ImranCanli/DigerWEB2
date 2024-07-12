Imports System.Data.SqlClient
Imports System.IO

Public Class anasayfa
    Inherits System.Web.UI.Page

    Dim baglan1 As New SqlConnection
    Dim cmd1 As New SqlCommand
    Dim oku1 As SqlDataReader

    Dim cmd2 As New SqlCommand

    Dim baglan2 As New SqlConnection
    Dim cmd3 As New SqlCommand
    Dim oku2 As SqlDataReader

    Dim baglan4 As New SqlConnection
    Dim cmd4 As New SqlCommand
    Dim oku4 As SqlDataReader

    Dim baglan9 As New SqlConnection
    Dim cmd9 As New SqlCommand

    Dim baglan10 As New SqlConnection
    Dim cmd10 As New SqlCommand
    Dim oku10 As SqlDataReader

    Dim oku As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        verial()

    End Sub

    Protected Sub verial()

        SqlDataSource1.SelectCommand = ""

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM view_ticket WHERE sil = 0 AND sonuc = 'Sonuçlanmadı' ORDER BY tarih DESC"

    End Sub

    Private Function RandomIdOlustur() As Integer
        Dim random As New Random()
        Return random.Next(100000, 999999)
    End Function

    Protected Sub ticket_akle_Click(sender As Object, e As EventArgs)

        Dim dosyakayit As String
        Dim yeniDosyaAdi As String
        Dim dosyaAdiSon As String = "-"
        Dim labelDegeri As String = RandomIdOlustur().ToString()

        If FileUpload1.HasFiles Then

            Dim dosyayolu As String = Server.MapPath("~/files/")
            Dim sessionDegeri As String = "Arer" ' Session'dan değeri al
            yeniDosyaAdi = $"{sessionDegeri}_{labelDegeri}{Path.GetExtension(FileUpload1.FileName)}"

            FileUpload1.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdi))

            'dosyakayitdeneme.Text = "Dosya Yolu: " & Path.Combine(dosyayolu, yeniDosyaAdi)
            'dosyakayitdeneme.Text = yeniDosyaAdi
            dosyakayit = Path.Combine(dosyayolu, yeniDosyaAdi)

            dosyaAdiSon = "~/files/" + yeniDosyaAdi

        Else
            'dosya seçilmediyse
            dosyakayitdeneme.Text = "Dosya seçilmedi"
        End If

        Try

            Dim affected As Integer
            Dim sonucsuz As String = "Sonuçlanmadı"

            baglan1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan1.Open()
            cmd1.Parameters.Clear()
            cmd1.CommandText = "INSERT INTO ticket_master (ticket_id, tarih, durum, baslik, proje, aciklama, dosya, sonuc, firma, sil, ticket_acan) VALUES (@ticket_id, @tarih, 0, @baslik, @proje, @aciklama, @dosya, @sonuc, @firma, @sil, @ticket_acan)"
            cmd1.Parameters.AddWithValue("@ticket_id", labelDegeri)
            cmd1.Parameters.AddWithValue("@tarih", Convert.ToDateTime(txtTicketaDate.Text))
            'cmd1.Parameters.AddWithValue("@durum", durumentry.Text)
            cmd1.Parameters.AddWithValue("@baslik", baslikentry.Text)
            cmd1.Parameters.AddWithValue("@proje", projeentry.Text)
            cmd1.Parameters.AddWithValue("@sil", 0)
            cmd1.Parameters.AddWithValue("@aciklama", If(String.IsNullOrEmpty(aciklamaentry.Text), "-", aciklamaentry.Text))
            cmd1.Parameters.AddWithValue("@dosya", If(String.IsNullOrEmpty(dosyaAdiSon), "-", dosyaAdiSon))
            cmd1.Parameters.AddWithValue("@sonuc", sonucsuz)
            cmd1.Parameters.AddWithValue("@firma", firmaentry.Text)
            cmd1.Parameters.AddWithValue("@ticket_acan", acanentry.Text)
            cmd1.Connection = baglan1

            affected = cmd1.ExecuteNonQuery()

            If affected > 0 Then

                firmaentry.Text = ""
                acanentry.Text = ""
                baslikentry.Text = ""
                aciklamaentry.Text = ""
                projeentry.Text = ""

                verial()

            Else
                uyarilabel.Text = "Kayıt işlemi başarısız. Girilen bilgileri kontrol edip tekrar deneyiniz."
                uyarilabel.Visible = True
            End If

        Catch ex As Exception
            uyarilabel.Text = "Kayıt işlemi başarısız. Girilen bilgileri kontrol edip tekrar deneyiniz. Hata ;" + ex.Message
            uyarilabel.Visible = True
        End Try

        baglan1.Close()

    End Sub


    Protected Sub islem_ekle_Click(sender As Object, e As EventArgs)

        Try
            Dim afctd As Integer
            Dim yeniDosyaAdi1 As String
            Dim dosyakayit1 As String
            Dim dosyaAdison1 As String = "-"
            Dim LabelDegeri As String = RandomIdOlustur()

            If FileUpload2.HasFiles Then

                Dim dosyayolu As String = Server.MapPath("~/islemfiles/")
                Dim sessionDegeri As String = "Arer"
                yeniDosyaAdi1 = $"{sessionDegeri}_{LabelDegeri}{Path.GetExtension(FileUpload2.FileName)}"

                FileUpload2.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdi1))

                'dosyakayitdeneme.Text = "Dosya Yolu: " & Path.Combine(dosyayolu, yeniDosyaAdi)
                dosyakayit1 = Path.Combine(dosyayolu, yeniDosyaAdi1)

                dosyaAdison1 = "~/islemfiles/" + yeniDosyaAdi1
            Else
                'dosya seçilmediyse
                dosyakayitdeneme.Text = "Dosya seçilmedi !"
            End If

            baglan4.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan4.Open()
            cmd4.Parameters.Clear()
            cmd4.CommandText = "INSERT INTO ticket_detail (master_id, tarih, islem, dosya, yapan) VALUES (@master_id, @tarih, @islem, @dosya, @yapan)"
            cmd4.Connection = baglan4
            cmd4.Parameters.AddWithValue("@master_id", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("ticket_id"))
            cmd4.Parameters.AddWithValue("@tarih", Convert.ToDateTime(TextBox6.Text))
            cmd4.Parameters.AddWithValue("@islem", islementry.Text)
            cmd4.Parameters.AddWithValue("@dosya", If(String.IsNullOrEmpty(dosyaAdison1), "-", dosyaAdison1))
            cmd4.Parameters.AddWithValue("@yapan", yapanentry.Text)
            cmd4.Connection = baglan4

            afctd = cmd4.ExecuteNonQuery()

            If afctd > 0 Then

                TextBox6.Text = ""
                islementry.Text = ""
                yapanentry.Text = ""

                verial()
            End If

        Catch ex As Exception

            Label3.Text = "İşlem gerçekleştirilirken hata oluştu. Hata ;" + ex.Message
            Label3.Visible = True

        End Try

    End Sub

    Private Sub ASPxCardView2_FocusedCardChanged(sender As Object, e As EventArgs) Handles ASPxCardView2.FocusedCardChanged
        If ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex) IsNot Nothing Then
            Session("eladio2") = ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("ticket_id")
        End If
    End Sub

    Protected Sub guncellebuton_Click(sender As Object, e As EventArgs)


        Dim dosyakayit As String
        Dim yeniDosyaAdi As String
        Dim dosyaAdiSon As String = "-"
        Dim labelDegeri As String = ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("ticket_id")
        'arizaturulabel.Text = selectedAriza.Value.ToString()
        If FileUpload3.HasFiles Then

            Dim dosyayolu As String = Server.MapPath("~/files/")
            Dim sessionDegeri As String = "ArerGuncel" ' Session'dan değeri al
            yeniDosyaAdi = $"{sessionDegeri}_{labelDegeri}{Path.GetExtension(FileUpload3.FileName)}"

            FileUpload3.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdi))

            'dosyakayitdeneme.Text = "Dosya Yolu: " & Path.Combine(dosyayolu, yeniDosyaAdi)
            'dosyakayitdeneme.Text = yeniDosyaAdi
            dosyakayit = Path.Combine(dosyayolu, yeniDosyaAdi)

            dosyaAdiSon = "~/files/" + yeniDosyaAdi

        Else
            'dosya seçilmediyse
            dosyakayitdeneme.Text = "Dosya seçilmedi"
        End If

        Try

            Dim affected As Integer

            baglan1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan1.Open()
            cmd1.Parameters.Clear()
            cmd1.CommandText = "UPDATE ticket_master SET tarih = @tarih, ticket_acan = @ticket_acan, baslik = @baslik, proje = @proje, aciklama = @aciklama, dosya = @dosya, sonuc = @sonuc, firma = @firma, sonuc_aciklama = @sonuc_aciklama WHERE ticket_id = @ticket_id"
            'cmd1.Parameters.AddWithValue("@tarih", guncelledate.Text)

            If Not String.IsNullOrEmpty(guncelledate.Text) Then
                cmd1.Parameters.AddWithValue("@tarih", Convert.ToDateTime(guncelledate.Text))
            Else
                cmd1.Parameters.AddWithValue("@tarih", Convert.ToDateTime(ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("tarih")))
            End If

            If String.IsNullOrEmpty(guncelsonucaciklama.Text) Then
                cmd1.Parameters.AddWithValue("@sonuc_aciklama", dosyaAdiSon)
            Else
                cmd1.Parameters.AddWithValue("@sonuc_aciklama", guncelsonucaciklama.Text)
            End If

            cmd1.Parameters.AddWithValue("@ticket_acan", guncelacanentry.Text)
            'If Not String.IsNullOrEmpty(gunceldurumentry.Text) Then
            '    cmd1.Parameters.AddWithValue("@durum", gunceldurumentry.Text)
            'Else
            '    cmd1.Parameters.AddWithValue("@durum", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("durum"))
            'End If

            cmd1.Parameters.AddWithValue("@baslik", guncelbaslikentry.Text)
            'If Not String.IsNullOrEmpty(guncelbaslikentry.Text) Then
            '    cmd1.Parameters.AddWithValue("@baslik", guncelbaslikentry.Text)
            'Else
            '    cmd1.Parameters.AddWithValue("@baslik", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("baslik"))
            'End If

            cmd1.Parameters.AddWithValue("@proje", guncelprojeentry.Text)
            'If Not String.IsNullOrEmpty(guncelprojeentry.Text) Then
            '    cmd1.Parameters.AddWithValue("@proje", guncelprojeentry.Text)
            'Else
            '    cmd1.Parameters.AddWithValue("@proje", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("proje"))
            'End If
            cmd1.Parameters.AddWithValue("@aciklama", guncelaciklamaentry.Text)
            'If Not String.IsNullOrEmpty(guncelaciklamaentry.Text) Then
            '    cmd1.Parameters.AddWithValue("@aciklama", guncelaciklamaentry.Text)
            'Else
            '    cmd1.Parameters.AddWithValue("@aciklama", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("aciklama"))
            'End If

            cmd1.Parameters.AddWithValue("@firma", guncelfirmaentry.Text)
            'If Not String.IsNullOrEmpty(guncelfirmaentry.Text) Then
            '    cmd1.Parameters.AddWithValue("@firma", guncelfirmaentry.Text)
            'Else
            '    cmd1.Parameters.AddWithValue("@firma", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("firma"))
            'End If
            'cmd1.Parameters.AddWithValue("@dosya", If(String.IsNullOrEmpty(dosyaAdiSon), , dosyaAdiSon))

            If Not String.IsNullOrEmpty(dosyaAdiSon) Then
                cmd1.Parameters.AddWithValue("@dosya", dosyaAdiSon)
            ElseIf Not String.IsNullOrEmpty(ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("dosya")) Then
                cmd1.Parameters.AddWithValue("@dosya", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("dosya"))
            Else
                cmd1.Parameters.AddWithValue("@dosya", DBNull.Value)
            End If

            cmd1.Parameters.AddWithValue("@sonuc", DropDownList2.SelectedValue)
            cmd1.Parameters.AddWithValue("@ticket_id", labelDegeri)

            cmd1.Connection = baglan1

            affected = cmd1.ExecuteNonQuery()

            If affected > 0 Then

                guncelledate.Text = ""
                guncelfirmaentry.Text = ""
                guncelacanentry.Text = ""
                guncelbaslikentry.Text = ""
                guncelbaslikentry.Text = ""
                guncelaciklamaentry.Text = ""

                verial()

            Else
                Label2.Text = "Kayıt işlemi başarısız. Girilen bilgileri kontrol edip tekrar deneyiniz."
                Label2.Visible = True
            End If

        Catch ex As Exception
            Label2.Text = "Kayıt işlemi başarısız. Girilen bilgileri kontrol edip tekrar deneyiniz. Hata ;" + ex.Message
            Label2.Visible = True
        End Try

        baglan1.Close()


        'If Not String.IsNullOrEmpty(guncelledate.Text) Then
        '    cmd1.Parameters.AddWithValue("@tarih", guncelledate.Text)
        'Else
        '    cmd1.Parameters.AddWithValue("@tarih", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("tarih")) ' mevcutDurum değişkenini mevcut durum değerine göre ayarlayın
        'End If

        'If Not String.IsNullOrEmpty(gunceldurumentry.Text) Then
        '    cmd1.Parameters.AddWithValue("@durum", gunceldurumentry.Text)
        'Else
        '    cmd1.Parameters.AddWithValue("@durum", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("durum")) ' mevcutDurum değişkenini mevcut durum değerine göre ayarlayın
        'End If

        'If Not String.IsNullOrEmpty(guncelbaslikentry.Text) Then
        '    cmd1.Parameters.AddWithValue("@baslik", guncelbaslikentry.Text)
        'Else
        '    cmd1.Parameters.AddWithValue("@baslik", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("baslik")) ' mevcutDurum değişkenini mevcut durum değerine göre ayarlayın
        'End If

        'If Not String.IsNullOrEmpty(guncelprojeentry.Text) Then
        '    cmd1.Parameters.AddWithValue("@proje", guncelprojeentry.Text)
        'Else
        '    cmd1.Parameters.AddWithValue("@proje", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("proje")) ' mevcutDurum değişkenini mevcut durum değerine göre ayarlayın
        'End If

        'If Not String.IsNullOrEmpty(guncelaciklamaentry.Text) Then
        '    cmd1.Parameters.AddWithValue("@aciklama", guncelaciklamaentry.Text)
        'Else
        '    cmd1.Parameters.AddWithValue("@aciklama", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("aciklama")) ' mevcutDurum değişkenini mevcut durum değerine göre ayarlayın
        'End If

        'If Not String.IsNullOrEmpty(guncelfirmaentry.Text) Then
        '    cmd1.Parameters.AddWithValue("@firma", guncelfirmaentry.Text)
        'Else
        '    cmd1.Parameters.AddWithValue("@firma", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("firma")) ' mevcutDurum değişkenini mevcut durum değerine göre ayarlayın
        'End If

    End Sub

    Protected Sub silbuton_Click(sender As Object, e As EventArgs)

        Dim affected As Integer

        baglan1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan1.Open()
        cmd1.Parameters.Clear()
        cmd1.CommandText = "UPDATE ticket_master SET sil = 1 WHERE ticket_id = @ticket_id"
        cmd1.Parameters.AddWithValue("@ticket_id", ASPxCardView2.GetDataRow(ASPxCardView2.FocusedCardIndex).Item("ticket_id"))
        cmd1.Connection = baglan1

        affected = cmd1.ExecuteNonQuery

        If affected > 0 Then
            verial()
        End If

    End Sub
End Class