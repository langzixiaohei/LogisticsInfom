<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${pageContext.request.contextPath }/HOUTAI/js/jquery-1.12.4.js"></script>
	<script src="${pageContext.request.contextPath }/HOUTAI/js/echarts.js"></script>
	
  </head>
  
  <body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <input type="hidden" id="gongsi" name="gongsi" value="${requestScope.gongsi }"> 
    <input type="hidden" id="yuangong" name="yuangong" value="${requestScope.yuangong }"> 
    <div  id="main" style="width: 600px;height:400px;margin-left: 100px;margin-top: 60px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
			 // 指定图表的配置项和数据
			 var a=$("#gongsi").val();
			 var b=$("#yuangong").val();
     var  option = {
    title : {
        text: '物流公司实时财务显示',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: ['公司收入','员工工资']
    },
    series : [
        {
            name: '薪资占比',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:a, name:'公司收入'},
                {value:b, name:'员工工资'}
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};
          myChart.setOption(option);
    </script>
    </body>
</html>
