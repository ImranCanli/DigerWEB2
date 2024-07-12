Public Class Sonuclandi
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM ticket_master WHERE sonuc = 'Sonuçlandı' AND sil = 0 ORDER BY tarih DESC"

    End Sub

End Class