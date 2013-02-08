<%@ Page Title="Job Comparison" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Compare.aspx.cs" Inherits="Nightly.Compare" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server" >

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />

    <asp:PlaceHolder runat="server" ID="phTop" />

    <h1>Z3 Nightly Regression Tests
    </h1>

    <br />

    <asp:PlaceHolder runat="server" ID="phPre" />

    <table>
        <tr>
            <td>
                <asp:PlaceHolder runat="server" ID="phChart" />
            </td>
            <td valign="top" align="center">
                <table>
                    <tr>
                        <asp:PlaceHolder runat="server" ID="phHisto" />
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Panel runat="server" Height="15" /></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Panel ID="p1" runat="server" BorderWidth="1" Width="200">
                                <asp:Label ID="l1" runat="server" Font-Bold="true" ForeColor="Black">Select job for X axis:</asp:Label>

                                <asp:Table runat="server" ID="tblX" Width="200">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:RadioButton ID="rbnTagX" runat="server" GroupName="rbnsX" Text="By Tag: " />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:DropDownList ID="lstTagX" runat="server" Width="100" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:RadioButton ID="rbnIDX" runat="server" GroupName="rbnsX" Text="By ID: " />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtIDX" runat="server" Width="100"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:Panel>
                        </td>
                        <td align="center">
                            <asp:Panel ID="p2" runat="server" BorderWidth="1" Width="200">
                                <asp:Label ID="l2" runat="server" Font-Bold="true" ForeColor="Black">Select job for Y axis:</asp:Label>

                                <asp:Table runat="server" ID="tblY" Width="200">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:RadioButton ID="rbnTagY" runat="server" GroupName="rbnsY" Text="By Tag: " />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:DropDownList ID="lstTagY" runat="server" Width="100" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:RadioButton ID="rbnIDY" runat="server" GroupName="rbnsY" Text="By ID: " />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtIDY" runat="server" Width="100" />
                                        </asp:TableCell></asp:TableRow></asp:Table></asp:Panel></td></tr><tr>
                        <td style="text-align: right" colspan="2">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>

    <asp:PlaceHolder runat="server" ID="phMain" />

    <div style="float: right; font-size: smaller; font-family: monospace; font-variant: small-caps;">
        Load time: <%= RenderTime.TotalSeconds %>sec. </div></asp:Content>