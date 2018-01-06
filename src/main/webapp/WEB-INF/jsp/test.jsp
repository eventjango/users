<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
--%>

<%@ include file="common/layout.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<div>
    <input type="button" value="button" onclick="onClickButton();">
</div>

<script type="text/javascript">

    var onClickButton = function(){

        var params = {};
        params["1"] = "BTC";
        params["2"] = "LTC";


        $.ajax({
            type : "POST",
            url : "/test/filter",
            data : params,
            dataType : "json",
            success : function (data) {

                alert('success');
                alert(data.id + " , " + data.code);
            },
            error : function (data) {

                alert('error');
                alert(data.id);

            }
        });

      /* var array = JSON.parse('{}');
       array["id"] = "may";


       $.ajax({

           type: "POST",
           url : "/test/array",
           data : JSON.stringify(array),
           contentType : "application/json; charset:utf-8",
           dataType : "json",

           success : function (data) {

               alert(data);
           },

           error : function (data) {

           }

       })*/
    }

</script>

</body>
</html>