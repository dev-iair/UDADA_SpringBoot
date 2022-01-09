
 var rightNow = new Date().toLocaleString("ko-KR", {timeZone: "Asia/Seoul"});
 var today = rightNow.slice(0,10).replace(/-/g," - ");
 $("h5#today").text(" [ "+  today +" ] " );
 
 var nowDate=new Date();
 var ndYear=nowDate.getFullYear();
 var ndMonth=(nowDate.getMonth()+1);
 var ndDate=nowDate.getDate();
 var ndDay=nowDate.getDay();
 var nowWeek = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
 $("#nowDate").text(ndYear+"년 "+ ndMonth+"월 "+ ndDate+"일 "+nowWeek[ndDay]);
 
