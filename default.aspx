<%@ Import Namespace="System" %>
    <%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeBehind="Default.aspx.cs" %>
        <!-- Helper inline code -->
        <script runat="server">

            int iCode = 200;
            string sText = "Lucky punch";
            double iRnd = Math.Round(DateTime.Now.TimeOfDay.TotalMilliseconds % 20);
            string sIcon = "/favicon.ico";

            public int build() {

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
        <!DOCTYPE html
            PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                This app generates random errors<br>
            </div>
            <!-- Data on db and server -->
            <div>
                random code : <%=iRnd%><br>
                Return code : <%=build()%> <%=sText%><br><br>

                <script type="text/javascript">
                    console.log("Code : <%=iCode%> Is about to be fired");
                    console.log("Return text : <%=sText%>");
                </script>

                <%=generate()%>
            </div>

        </body>

        </html>