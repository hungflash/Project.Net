<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAttendstudent.aspx.cs" Inherits="Assignement.ViewAttendstudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link rel="stylesheet" type="text/css" href="StyleSheet1.css">
    <style type="text/css">
        .auto-style1 {
            width: 92px;
        }
        .auto-style2 {
            width: 92%;
        }
        .auto-style3 {
            width: 58%;
        }
        .auto-style4 {
            width: 187px;
        }
        .auto-style5 {
            height: 185px;
            width: 117%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>FPT University Academic Portal</h2>
       
        </div>
             <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                        <a href="#">
                            <span id="ctl00_lblLogIn" class="label label-success">
                                <asp:Label ID="Label1" runat="server" Text="UserName"></asp:Label>
                            </span>
                        </a> 
                 | <a href="login.aspx" class="label label-success">logout</a> |
                <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                    </div>
            <ol class="breadcrumb">
                        <li>
                            <span id="ctl00_lblNavigation"><b>&nbsp;</b></span></li>
                    </ol>
        <h2>View attendenace for <asp:Label ID="Label2" runat="server" Text="UserName" ></asp:Label> </h2>

        <td><h3>Select a campus/program, term, course ...</h3>
 

    
    
<table summary="Select a course" class="auto-style2">
<thead>
    <tr>
        <th scope="col">Campus/program</th>
        <th scope="col" class="auto-style1"></th>
        <th scope="col" class="auto-style4">&nbsp;</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td valign="top">
            <div id="ctl00_mainContent_divCampus">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <b>FU-HL</b>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </td>
<td valign="top" class="auto-style1">
    <div id="ctl00_mainContent_divTerm">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True">
                              <Columns>
                                    <asp:HyperLinkField DataNavigateUrlFields="AccountName,TermID,Title" 
                        DataNavigateUrlFormatString="ViewAttendstudent.aspx?Student={0}&term={1}" NavigateUrl="ViewAttendstudent.aspx?Student={0}"  DataTextField="Title" HeaderText="TERM" />
                              <%--?AccountName={0}&Title={1}--%>
                              </Columns>
                        </asp:GridView>
    </div>
</td>
<td valign="top" class="auto-style4">
    <div id="ctl00_mainContent_divCourse">
        <table class="auto-style3">
            <tbody>
                <tr>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Width="162px">
                              <Columns>
                                    <asp:HyperLinkField DataNavigateUrlFields="AccountName,TermID,Title,CourseID,CourseCode,ClassName,StartDate" 
                        DataNavigateUrlFormatString="ViewAttendstudent.aspx?Student={0}&term={1}&Course={3}"  DataTextField="CourseCode"  HeaderText="COURSE" />
                              <%--?AccountName={0}&Title={1}--%>
                                  <%--(CourseCode)(ClassName,StartDate)--%>
                              </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</td>

<td valign="top">
    <h3>
        ... then see report<br>
        <table class="auto-style5">
        <tbody>
                  <asp:GridView ID="GridView3" runat="server" Height="245px" Width="566px" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       <EditRowStyle BackColor="#999999" />
                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                       <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        </tbody>
    </table>
             
       

              <%--  <Columns>
                    <asp:BoundField HeaderText="NO." />
                    <asp:BoundField HeaderText="DATE" />
                    <asp:BoundField HeaderText="SLOT" />
                    <asp:BoundField HeaderText="ROOM" />
                    <asp:BoundField HeaderText="LECTURE" />
                    <asp:BoundField HeaderText="CLASSNAME" />
                    <asp:BoundField HeaderText="ATTENDANCE STATUS" />
                    <asp:BoundField HeaderText="LECTURE'S COMMENT" />
                </Columns>--%>
        <br>
    </h3>
    
          
 </td>
</tr></tbody>
</table>
 </td>
    </form>
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
</body>
</html>
