<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="JobSelect.ascx.cs" Inherits="Nightly.JobSelect" ClassName="JobSelect" %>

<table>
    <tr>
        <td>
            <asp:Panel ID="p1" runat="server" BorderWidth="1" Width="200">
                <asp:Label ID="l1" runat="server" Font-Bold="true" ForeColor="Black">Select job for X axis:</asp:Label>

                <asp:Table runat="server" ID="tblX" Width="200">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:RadioButton ID="rbnTagX" runat="server" GroupName="rbnsX" Text="By Tag: " />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="lstTagX" runat="server" Width="100">
                                <asp:ListItem Text="Latest" Selected="False" Value="-1" />
                                <asp:ListItem Text="Penultimate" Selected="False" Value="-2" />
                            </asp:DropDownList>
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
    </tr>

    <tr>
        <td>
            <asp:Panel runat="server" Height="15" />
        </td>
    </tr>

    <tr>
        <td>
            <asp:Panel ID="p2" runat="server" BorderWidth="1" Width="200">
                <asp:Label ID="l2" runat="server" Font-Bold="true" ForeColor="Black">Select job for Y axis:</asp:Label>

                <asp:Table runat="server" ID="tblY" Width="200">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:RadioButton ID="rbnTagY" runat="server" GroupName="rbnsY" Text="By Tag: " />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="lstTagY" runat="server" Width="100">
                                <asp:ListItem Text="Latest" Selected="False" Value="-1" />
                                <asp:ListItem Text="Penultimate" Selected="False" Value="-2" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:RadioButton ID="rbnIDY" runat="server" GroupName="rbnsY" Text="By ID: " />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtIDY" runat="server" Width="100"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
        </td>
    </tr>

    <tr>
        <td>
            <asp:Panel runat="server" Height="15" />
        </td>
    </tr>

    <tr>
        <td style="text-align: right">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" />
        </td>
    </tr>
</table>
