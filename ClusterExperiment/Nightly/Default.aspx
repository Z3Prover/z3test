<%@ Page Title="Z3 Nightly" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Nightly._Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
        
    <asp:PlaceHolder runat="server" ID="phTop" />

    <h1>
        Z3 Nightly Regression Tests
    </h1>    

    <br />    

    <asp:PlaceHolder runat="server" ID="phMain" />

    <div style="float:right;font-size:smaller;font-family:monospace;font-variant:small-caps;">
    Load time: <%= RenderTime.TotalSeconds %> sec.
    </div>
</asp:Content>
