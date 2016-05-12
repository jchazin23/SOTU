var w = 500,
	h = 500;

var colorscale = d3.scale.category10();

//Legend titles
var LegendOptions = ['George Washington','Thomas Jefferson','Franklin D. Roosevelt','William J. Clinton','George W. Bush','Barack Obama'];

//Data
var d = [
		  [
			{axis:"Ideal",value:0.09},
			{axis:"Love",value:0.54},
			{axis:"Practicality",value:0.36},
			{axis:"Harmony",value:0.52},
			{axis:"Liberty",value:0.14},
			{axis:"Structure",value:0.32},
			{axis:"Stability",value:0.32},
			{axis:"Closeness",value:0.22},
			{axis:"Excitement",value:0.09},
			{axis:"Challenge",value:0.92},
			{axis:"Curiosity",value:0.12},
			{axis:"Self-expression",value:0.12}
		  ],[
			{axis:"Ideal",value:0.06},
			{axis:"Love",value:0.58},
			{axis:"Practicality",value:0.38},
			{axis:"Harmony",value:0.63},
			{axis:"Liberty",value:0.13},
			{axis:"Structure",value:0.2},
			{axis:"Stability",value:0.26},
			{axis:"Closeness",value:0.2},
			{axis:"Excitement",value:0.06},
			{axis:"Challenge",value:0.88},
			{axis:"Curiosity",value:0.07},
			{axis:"Self-expression",value:0.06}
		  ],[
			{axis:"Ideal",value:0.25},
			{axis:"Love",value:0.79},
			{axis:"Practicality",value:0.66},
			{axis:"Harmony",value:0.72},
			{axis:"Liberty",value:0.35},
			{axis:"Structure",value:0.68},
			{axis:"Stability",value:0.56},
			{axis:"Closeness",value:0.55},
			{axis:"Excitement",value:0.31},
			{axis:"Challenge",value:0.88},
			{axis:"Curiosity",value:0.24},
			{axis:"Self-expression",value:0.19}
		  ],[
			{axis:"Ideal",value:0.05},
			{axis:"Love",value:0.81},
			{axis:"Practicality",value:0.75},
			{axis:"Harmony",value:0.69},
			{axis:"Liberty",value:0.34},
			{axis:"Structure",value:0.23},
			{axis:"Stability",value:0.26},
			{axis:"Closeness",value:0.37},
			{axis:"Excitement",value:0.22},
			{axis:"Challenge",value:0.21},
			{axis:"Curiosity",value:0.08},
			{axis:"Self-expression",value:0.14}
		  ],[
			{axis:"Ideal",value:0.55},
			{axis:"Love",value:0.84},
			{axis:"Practicality",value:0.72},
			{axis:"Harmony",value:0.71},
			{axis:"Liberty",value:0.56},
			{axis:"Structure",value:0.8},
			{axis:"Stability",value:0.75},
			{axis:"Closeness",value:0.78},
			{axis:"Excitement",value:0.58},
			{axis:"Challenge",value:0.92},
			{axis:"Curiosity",value:0.43},
			{axis:"Self-expression",value:0.36}
		  ],[
			{axis:"Ideal",value:0.06},
			{axis:"Love",value:0.83},
			{axis:"Practicality",value:0.8},
			{axis:"Harmony",value:0.68},
			{axis:"Liberty",value:0.38},
			{axis:"Structure",value:0.26},
			{axis:"Stability",value:0.3},
			{axis:"Closeness",value:0.29},
			{axis:"Excitement",value:0.26},
			{axis:"Challenge",value:0.38},
			{axis:"Curiosity",value:0.13},
			{axis:"Self-expression",value:0.22}

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
	.attr("x", w - 5)
	.attr("y", 10)
	.attr("font-size", "14px")
	.attr("fill", "#404040")
	.text("President");
		
//Initiate Legend	
var legend = svg.append("g")
	.attr("class", "legend")
	.attr("height", 100)
	.attr("width", 200)
	.attr('transform', 'translate(160,20)') 
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