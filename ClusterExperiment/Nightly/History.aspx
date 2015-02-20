<%@ Page Title="History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="History.aspx.cs" Inherits="Nightly.History" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server" >
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />

    <asp:PlaceHolder runat="server" ID="phTop" />

    <h1>Z3 Nightly Regression Test History</h1>

    <br />

    <asp:PlaceHolder runat="server" ID="phMain">
        <asp:Table ID="tblEntries" runat="server" BorderStyle="Solid" BorderWidth="1" Width="30%">
            <asp:TableHeaderRow BorderStyle="Solid" BackColor="Gray" ForeColor="Black">
                <asp:TableHeaderCell Width="3%" HorizontalAlign="Left">ID</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="12%" HorizontalAlign="Center">Submission Time</asp:TableHeaderCell>                
                <asp:TableHeaderCell Width="7%" HorizontalAlign="Center" ColumnSpan="2">Compare to ...</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </asp:PlaceHolder>

    <div style="float: right; font-size: smaller; font-family: monospace; font-variant: small-caps;">
        Load time: <%= RenderTime.TotalSeconds %> sec.
    </div>
</asp:Content>