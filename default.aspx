<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web" %> 
<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeBehind="Default.aspx.cs" %>
    <!-- Helper inline code -->
    <script runat="server">

        int iCode = 200;
        string sText = "Lucky punch";
        string sNumberSource = "";
        double iRnd = Math.Round(DateTime.Now.TimeOfDay.TotalMilliseconds % 20);
        string sIcon = "/favicon.ico";
        string forceCode = HttpContext.Current.Request.QueryString["forceCode"];  
        string forceText = HttpContext.Current.Request.QueryString["forceText"]; 

        public int build() {
            if (forceCode != null) {
                sNumberSource = "Parameter Forced";
                if (forceCode == "to") {      //Time out
                    iCode = 200;
                    sText = "NETWORK SLOW TODAY";
                    System.Threading.Thread.Sleep(1000);
                } 
                else {
                    iCode = Int32.Parse(forceCode);
                    if (forceCode != "") 
                        sText = forceText;
                    else
                        sText = "Uups - unlucky";
                }
            } else {
                sNumberSource = "Randomized - " + iRnd;
                if (iRnd == 0) {
                    iCode = 400;
                    sText = "Uups - unlucky";
                }
                if (iRnd == 1) {
                    iCode = 401;
                    sText = "Uups - unlucky";
                }
                if (iRnd == 2) {
                    iCode = 403;
                    sText = "Uups - unlucky";
                }
                if (iRnd > 16) {
                    iCode = 200;
                    sText = "NETWORK SLOW TODAY";
                    System.Threading.Thread.Sleep(1000);
                }
                if (iRnd == 9) {
                    iCode = 500;
                    sText = "Uups - unlucky";
                }
            }
            Response.StatusCode = iCode; 
            return iCode;
        }

    public string generate() {
        //if (iCode != 200) {
        //    throw new HttpException(iCode, sText);
        // }
        return "";
    }

    </script>

    <!-- Page begin -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <link rel="icon" type="image/x-icon" href="/favicon.ico" />
        <link rel="stylesheet" href="styles.css">
        <title>
            Act up App
        </title>
    </head>

    <body>
        <div>
            <h1>Act up App</h1><br>
            This app generates errors, Either from a ForcedCode on the query string or from a Random number<br>
        </div>

        <div
            ><br>
            Return code : <%=build()%> <%=sText%><br>
            Source      : <%=sNumberSource%><br>
            <br><br>
            <a href="\">Run again with random error</a><br>
            <a href="\?forceCode=400">Force Return code 400</a><br>
            <a href="\?forceCode=401">Force Return code 401</a><br>
            <a href="\?forceCode=403">Force Return code 403</a><br>
            <a href="\?forceCode=500">Force Return code 500</a><br>
            <a href="\?forceCode=to">Force Slow Network</a><br>

            <script type="text/javascript">
                console.log("Source : <%=sNumberSource%>");
                console.log("Code : <%=iCode%> Is about to be fired");
                console.log("Return text : <%=sText%>");
            </script>

            <%=generate()%>
        </div>
    </body>
</html>