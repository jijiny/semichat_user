<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="/WEB-INF/views/graph/statisticsHeader.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	
	var ticks = new Array();
	var s1 = new Array();
	    
	<c:forEach var="item" items="${chart}">
		ticks.push("${item.key }");
		s1.push("${item.value }");
	</c:forEach>   
    
    $("#chartdiv").jqplot([s1],{
    	title:"최근 5개월 월별 메시지 전송 통계"
    	,animate : !$.jqplot.use_excanvas
//     	, seriesDefaults:{
//             renderer:jQuery.jqplot.BarRenderer
//           , rendererOptions:{
//               varyBarColor:true
//           }
//       }
    	,axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            }
        },
       	highlighter : {show : false}
    });
});
</script>
<style type="text/css">
#month {
   background-color: #4ea1d3;
   border-color: #4ea1d3;
   color: white;
}
</style>

<!-- 통계 -->
<div class="container">

<div id="chartdiv" style="height:500px; margin:10%;">
</div>

</div> <!-- container -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>