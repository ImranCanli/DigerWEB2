Imports System.Data.SqlClient
Imports System.IO

Public Class _default
    Inherits System.Web.UI.Page


    Dim baglan As New SqlConnection
    Dim cmd As New SqlCommand
    Dim read As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub gobutton_Click(sender As Object, e As EventArgs)

        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "SELECT kadi, parola FROM login_yeni WHERE kadi = @kadi AND parola = @parola"
        cmd.Parameters.AddWithValue("@kadi", kullaniciadientry.Text)
        cmd.Parameters.AddWithValue("@parola", sifreentry.Text)
        cmd.Connection = baglan

        read = cmd.ExecuteReader

        If read.Read Then
            Session("kadi") = read("kadi")
            Session("parola") = read("parola")

            Response.Redirect("anasayfa.aspx")
        End If

    End Sub

End Class