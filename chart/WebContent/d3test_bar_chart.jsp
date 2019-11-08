<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
Using d3-tip to add tooltips to a d3 bar chart.
<!DOCTYPE html>

<meta charset="utf-8">
<style>

body {
  font: 10px sans-serif;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.bar {
  fill: orange;
}

.bar:hover {
  fill: orangered ;
}

.x.axis path {
  display: none;
}

.d3-tip {
  line-height: 1;
  font-weight: bold;
  padding: 12px;
  background: rgba(0, 0, 0, 0.8);
  color: #fff;
  border-radius: 2px;
}

/* Creates a small triangle extender for the tooltip */
.d3-tip:after {
  box-sizing: border-box;
  display: inline;
  font-size: 10px;
  width: 100%;
  line-height: 1;
  color: rgba(0, 0, 0, 0.8);
  content: "\25BC";
  position: absolute;
  text-align: center;
}

/* Style northward tooltips differently */
.d3-tip.n:after {
  margin: -1px 0 0 0;
  top: 100%;
  left: 0;
}
</style>
<body>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
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

float num_sum = 0;
for(int i=0;i<26;i++)
	num_sum += num[i];
for(int i=0;i<26;i++)
	num[i] = (num[i]/num_sum);

File file2 = new File("C:\\Users\\92sha\\Desktop\\comento\\chart\\WebContent\\data123.txt");
BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file2));

if(file2.isFile() && file2.canWrite()){
	
	bufferedWriter.write("letter");
	bufferedWriter.write("\t");
	bufferedWriter.write("frequency");
	bufferedWriter.newLine();
	for(int i=0;i<26;i++){
    //쓰기
   	 	bufferedWriter.write(input[i]);
    //개행문자쓰기
    	bufferedWriter.write("\t");
    	String a = Float.toString(num[i]);
    	bufferedWriter.write(a);
    	bufferedWriter.newLine();
    
	}
    bufferedWriter.close();
}

%>

var margin = {top: 40, right: 20, bottom: 30, left: 40},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var formatPercent = d3.format(".0%");

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .tickFormat(formatPercent);


var tip = d3.tip()
  .attr('class', 'd3-tip')
  .offset([-10, 0])
  .html(function(d) {
    return "<strong>Frequency:</strong> <span style='color:red'>" + d.frequency + "</span>";
  })

var svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

svg.call(tip);

d3.tsv("data123.tsv", type, function(error, data) {
  x.domain(data.map(function(d) { return d.letter; }));
  y.domain([0, d3.max(data, function(d) { return d.frequency; })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Frequency");

  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.letter); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.frequency); })
      .attr("height", function(d) { return height - y(d.frequency); })
      .on('mouseover', tip.show)
      .on('mouseout', tip.hide)

});

function type(d) {
  d.frequency = +d.frequency;
  return d;
}

</script>