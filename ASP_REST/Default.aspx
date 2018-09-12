<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP_REST._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <button onclick="doWork(); return false;" class="btn btn-primary">Do Work</button>
        <input type="text" id="squareValue" />
        <button onclick="doSquare(); return false;" class="btn btn-primary">Do Work</button>
        <br />
        <br />
        <input type="text" id="addValue1" />
        <input type="text" id="addValue2" />
        <button onclick="doAddValues(); return false;" class="btn btn-primary">Do Add Values</button>
    </div>
    <script type="text/javascript">
        function doWork(parameters) {
            console.info("Hello");

            $.ajax({
                url: "Services/Service1.svc/DoWork",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    console.info(result);
                }
            });
        }

        function doSquare() {
            var value = $("#squareValue").val();
            $.ajax({
                url: "Services/Service1.svc/DoSquare",
                type: "POST",
                data: JSON.stringify(value),
                dataType: "json",
                contentType: "application/json",
                success: function (result) {
                    console.info(result);
                }
            });
        }

        function doAddValues() {
            var value = {
                "Value1": $("#addValue1").val(),
                "Value2": $("#addValue2").val()

            };
            $.ajax({
                url: "Services/Service1.svc/DoAddValues",
                type: "POST",
                data: JSON.stringify(value),
                dataType: "json",
                contentType: "application/json",
                success: function(result) {
                    console.info(result);
                }
            });
        }

    </script>
</asp:Content>
