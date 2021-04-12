<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherAttendent.aspx.cs" Inherits="Assignement.TeacherAttendent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="StyleSheet1.css">
</head>
<body>
    <form id="form1" runat="server">
        <h1>Take Attendance</h1>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Hello!! Welcome "></asp:Label><br/>
            <br/>
        </div>
        <div>
                <div>
            <h2>FPT University Academic Portal</h2>
       
        </div>
             <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                        <a href="#">
                            <span id="ctl00_lblLogIn" class="label label-success">
                                <asp:Label ID="Label2" runat="server" Text="UserName"></asp:Label>
                            </span>
                        </a> 
                 | <a href="login.aspx" class="label label-success">logout</a> |
                <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                    </div>
        
        </div>   
        <div>
            </br>
            </br>
            </br>
            <div>
         Class:    <asp:DropDownList ID="drClass" runat="server" OnSelectedIndexChanged="drClass_SelectedIndexChanged" AutoPostBack="true" Height="16px" Width="98px"></asp:DropDownList>
            </div>
             <br/>
            <div>SLOT : <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList></div>
            <div>
                Mark Attendance for : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px" >
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </div><br/>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Height="264px" Width="567px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField HeaderText="ID" />
            <asp:BoundField HeaderText="Roll Number" DataField="RollNo"/>
            <asp:BoundField HeaderText="Student Name"  DataField="LastName"/>
            <asp:BoundField HeaderText="Class" DataField="ClassName" />
            <asp:TemplateField HeaderText="Mark Attendance" >
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Text="Present"   GroupName="s"  OnCheckedChanged="RadioButton1_CheckedChanged "/>
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Absent"  GroupName="s" OnCheckedChanged="RadioButton1_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
             <br/>
             <br/>

        </div>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <div>
        </div>
        <tr style="border-bottom: 0 none">
                            <td>
                                <br>

                                <table width="100%" style="border: 1px solid transparent;" id="cssTable">

                                    <tbody><tr>
                                        <td>
                                            <div id="ctl00_divSupport">
                                                <br>
                                                <b>Mọi góp ý, thắc mắc xin liên hệ: </b><span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>: Email: <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
        Điện thoại: <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(024)7308.13.13 </span>
                                                <br>

                                            </div>

                                            
                                            
                                              
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="text-align: center">
                                                © Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>&nbsp;|&nbsp;
        <a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>&nbsp;|&nbsp; <a href="http://library.fpt.edu.vn" target="_blank">library</a>&nbsp;|&nbsp; <a href="http://library.books24x7.com" target="_blank">books24x7</a>
                                                <span id="ctl00_lblHelpdesk"></span>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody></table>

                            </td>
                        </tr>
    </form>
</body>
</html>
