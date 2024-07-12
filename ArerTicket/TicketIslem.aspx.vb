Public Class TicketIslem
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        dosyakayitdeneme.Text = Session("eladio2").ToString()

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM ticket_detail WHERE master_id =" + Session("eladio2").ToString()
    End Sub

End Class