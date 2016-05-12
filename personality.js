var w = 500,
	h = 500;

var colorscale = d3.scale.category10();

//Legend titles
var LegendOptions = ['George Washington','Thomas Jefferson','Franklin D. Roosevelt','William J. Clinton','George W. Bush','Barack Obama'];

//Data
var d = [
		  [
			{axis:"Agreeableness",value:0.05},
			{axis:"Openness",value:0.99},
			{axis:"Conscientiousness",value:0.81},
			{axis:"Introversion/Extraversion",value:0.13},
			{axis:"Emotional Range",value:0.17}
		  ],[
			{axis:"Agreeableness",value:0.17},
			{axis:"Openness",value:0.99},
			{axis:"Conscientiousness",value:0.79},
			{axis:"Introversion/Extraversion",value:0.21},
			{axis:"Emotional Range",value:0.17}
		  ],[
			{axis:"Agreeableness",value:0.21},
			{axis:"Openness",value:0.97},
			{axis:"Conscientiousness",value:0.62},
			{axis:"Introversion/Extraversion",value:0.26},
			{axis:"Emotional Range",value:0.35}
		  ],[
			{axis:"Agreeableness",value:0.91},
			{axis:"Openness",value:0.71},
			{axis:"Conscientiousness",value:0.68},
			{axis:"Introversion/Extraversion",value:0.63},
			{axis:"Emotional Range",value:0.36}
		  ],[
			{axis:"Agreeableness",value:0.67},
			{axis:"Openness",value:0.87},
			{axis:"Conscientiousness",value:0.63},
			{axis:"Introversion/Extraversion",value:0.67},
			{axis:"Emotional Range",value:0.36}
		  ],[
			{axis:"Agreeableness",value:0.85},
			{axis:"Openness",value:0.7},
			{axis:"Conscientiousness",value:0.54},
			{axis:"Introversion/Extraversion",value:0.48},
			{axis:"Emotional Range",value:0.44}
		  ]
		];

//Options for the Radar chart, other than default
var mycfg = {
  w: w,
  h: h,
  maxValue: 0.6,
  levels: 6,
  ExtraWidthX: 300
}

//Call function to draw the Radar chart
//Will expect that data is in %'s
RadarChart.draw("#chart", d, mycfg);

////////////////////////////////////////////
/////////// Initiate legend ////////////////
////////////////////////////////////////////

var svg = d3.select('#body')
	.selectAll('svg')
	.append('svg')
	.attr("width", w+300)
	.attr("height", h)

//Create the title for the legend
var text = svg.append("text")
	.attr("class", "title")
	.attr('transform', 'translate(90,0)') 
	.attr("x", w - 70)
	.attr("y", 10)
	.attr("font-size", "14px")
	.attr("fill", "#404040")
	.text("President");
		
//Initiate Legend	
var legend = svg.append("g")
	.attr("class", "legend")
	.attr("height", 100)
	.attr("width", 200)
	.attr('transform', 'translate(90,20)') 
	;
	//Create colour squares
	legend.selectAll('rect')
	  .data(LegendOptions)
	  .enter()
	  .append("rect")
	  .attr("x", w - 65)
	  .attr("y", function(d, i){ return i * 20;})
	  .attr("width", 10)
	  .attr("height", 10)
	  .style("fill", function(d, i){ return colorscale(i);})
	  ;
	//Create text next to squares
	legend.selectAll('text')
	  .data(LegendOptions)
	  .enter()
	  .append("text")
	  .attr("x", w - 52)
	  .attr("y", function(d, i){ return i * 20 + 9;})
	  .attr("font-size", "11px")
	  .attr("fill", "#737373")
	  .text(function(d) { return d; })
	  ;	