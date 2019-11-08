<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title>D3: A simple packed Bubble Chart</title>
		<script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>

		<style type="text/css">
			/* No style rules here yet */		
		</style>
</head>
<body>
<script type="text/javascript"></script>
<script>

<%
char []input = {'A','B','C','D','E','F','G','H','I','J','K','L',
 			'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
 float []num = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

//파일 객체 생성
File file = new File("C:\\Users\\92sha\\Desktop\\comento\\chart\\WebContent\\d3test2.html");

//입력 스트림 생성
FileReader filereader = new FileReader(file);
int singleCh = 0;
while((singleCh = filereader.read()) != -1){
    System.out.print((char)singleCh);
    	if((char)singleCh == 'A' || (char)singleCh == 'a')
    		num[0] += 1;
    	else if((char)singleCh == 'B' || (char)singleCh == 'b')
    		num[1] += 1;
    	else if((char)singleCh == 'C' || (char)singleCh == 'c')
    		num[2] += 1;
    	else if((char)singleCh == 'D' || (char)singleCh == 'd')
    		num[3] += 1;
    	else if((char)singleCh == 'E' || (char)singleCh == 'e')
    		num[4] += 1;
    	else if((char)singleCh == 'F' || (char)singleCh == 'f')
    		num[5] += 1;
    	else if((char)singleCh == 'G' || (char)singleCh == 'g')
    		num[6] += 1;
    	else if((char)singleCh == 'H' || (char)singleCh == 'h')
    		num[7] += 1;
    	else if((char)singleCh == 'I' || (char)singleCh == 'i')
    		num[8] += 1;
    	else if((char)singleCh == 'J' || (char)singleCh == 'j')
    		num[9] += 1;
    	else if((char)singleCh == 'K' || (char)singleCh == 'k')
    		num[10] += 1;
    	else if((char)singleCh == 'L' || (char)singleCh == 'l')
    		num[11] += 1;
    	else if((char)singleCh == 'M' || (char)singleCh == 'm')
    		num[12] += 1;
    	else if((char)singleCh == 'N' || (char)singleCh == 'n')
    		num[13] += 1;
    	else if((char)singleCh == 'O' || (char)singleCh == 'o')
    		num[14] += 1;
    	else if((char)singleCh == 'P' || (char)singleCh == 'p')
    		num[15] += 1;
    	else if((char)singleCh == 'Q' || (char)singleCh == 'q')
    		num[16] += 1;
    	else if((char)singleCh == 'R' || (char)singleCh == 'r')
    		num[17] += 1;
    	else if((char)singleCh == 'S' || (char)singleCh == 's')
    		num[18] += 1;
    	else if((char)singleCh == 'T' || (char)singleCh == 't')
    		num[19] += 1;
    	else if((char)singleCh == 'U' || (char)singleCh == 'u')
    		num[20] += 1;
    	else if((char)singleCh == 'V' || (char)singleCh == 'v')
    		num[21] += 1;
    	else if((char)singleCh == 'W' || (char)singleCh == 'w')
    		num[22] += 1;
    	else if((char)singleCh == 'X' || (char)singleCh == 'x')
    		num[23] += 1;
    	else if((char)singleCh == 'Y' || (char)singleCh == 'y')
    		num[24] += 1;
    	else if((char)singleCh == 'Z' || (char)singleCh == 'z')
    		num[25] += 1;
    
}
filereader.close();

%>

dataset = {
        "children": [{"Name":"A","Count":<%= num[0] %>},
            {"Name":"B","Count":<%= num[1] %>},
            {"Name":"C","Count":<%= num[2] %>},
            {"Name":"D","Count":<%= num[3] %>},
            {"Name":"E","Count":<%= num[4] %>},
            {"Name":"F","Count":<%= num[5] %>},
            {"Name":"G","Count":<%= num[6] %>},
            {"Name":"H","Count":<%= num[7] %>},
            {"Name":"I","Count":<%= num[8] %>},
            {"Name":"J","Count":<%= num[9] %>},
            {"Name":"K","Count":<%= num[10] %>},
            {"Name":"L","Count":<%= num[11] %>},
            {"Name":"M","Count":<%= num[12] %>},
            {"Name":"N","Count":<%= num[13] %>},
            {"Name":"O","Count":<%= num[14] %>},
            {"Name":"P","Count":<%= num[15] %>},
            {"Name":"Q","Count":<%= num[16] %>},
            {"Name":"R","Count":<%= num[17] %>},
            {"Name":"S","Count":<%= num[18] %>},
            {"Name":"T","Count":<%= num[19] %>},
            {"Name":"U","Count":<%= num[20] %>},
            {"Name":"V","Count":<%= num[21] %>},
            {"Name":"W","Count":<%= num[22] %>},
            {"Name":"X","Count":<%= num[23] %>},
            {"Name":"Y","Count":<%= num[24] %>},
            {"Name":"Z","Count":<%= num[25] %>},
            ]
    };

    var diameter = 600;
    var color = d3.scaleOrdinal(d3.schemeCategory20);

    var bubble = d3.pack(dataset)
        .size([diameter, diameter])
        .padding(1.5);

    var svg = d3.select("body")
        .append("svg")
        .attr("width", diameter)
        .attr("height", diameter)
        .attr("class", "bubble");

    var nodes = d3.hierarchy(dataset)
        .sum(function(d) { return d.Count; });

    var node = svg.selectAll(".node")
        .data(bubble(nodes).descendants())
        .enter()
        .filter(function(d){
            return  !d.children
        })
        .append("g")
        .attr("class", "node")
        .attr("transform", function(d) {
            return "translate(" + d.x + "," + d.y + ")";
        });

    node.append("title")
        .text(function(d) {
            return d.Name + ": " + d.Count;
        });

    node.append("circle")
        .attr("r", function(d) {
            return d.r;
        })
        .style("fill", function(d,i) {
            return color(i);
        });

    node.append("text")
        .attr("dy", ".2em")
        .style("text-anchor", "middle")
        .text(function(d) {
            return d.data.Name.substring(0, d.r / 3);
        })
        .attr("font-family", "sans-serif")
        .attr("font-size", function(d){
            return d.r/5;
        })
        .attr("fill", "white");

    node.append("text")
        .attr("dy", "1.3em")
        .style("text-anchor", "middle")
        .text(function(d) {
            return d.data.Count;
        })
        .attr("font-family",  "Gill Sans", "Gill Sans MT")
        .attr("font-size", function(d){
            return d.r/5;
        })
        .attr("fill", "white");

    d3.select(self.frameElement)
        .style("height", diameter + "px");




</script>

</body>
</html>