// circletest.js
// jpb, 2014-03-31
// rework to load single D3.js circle chart on page
//  used to generate static image for download

//  console.log("dmmcharts.js loaded");

//  DMM DATA HERE

    // grab the dmm data
   // var d3dmmdata = JSON.parse(dmmdata);
    // jpb, debug only below
    // console.log(d3dmmdata);
   

//
// START OF CIRCLE (DONUT) CHART

var theCircleRadii = [73,52,50] 

var width = 240;
var height = 320;

// for arc
var arcPercentage = 90;  // NOTE:  THIS WOULD BE DYNAMICALLY FED IN
var pi = Math.PI;
var prevMonthChange = -3.1; // NOTE:  THIS WOULD BE DYNAMICALLY FED IN
var arcAngle = (arcPercentage * (360/100)) * (pi/180);



var svgContainer = d3.select("#circlechart").append("svg")
            .attr("width",width)
            .attr("height",height);


var circles = svgContainer.selectAll("circle")
     .data(theCircleRadii)
     .enter()
     .append("circle");

var circleAttributes = circles
     .attr("cx",width/2)
     .attr("cy",height/2.8)
     .attr("r",function(d) {return d;})
   //  .style("fill","#1B0046")
     .style("fill",function(d) {
	var returnColor;
        if (d==73) { returnColor = "#581781";}
        else if (d == 52) { returnColor = "#FFFFFF";}
	else if (d == 50) { returnColor = "#1B0046";}
	return returnColor;
     });


// now add a green arc
var arc = d3.svg.arc()
     .outerRadius(73)
     .innerRadius(53)
    // .startAngle(45* (pi/180))
     .startAngle(0)
		// I think we need to convert percentage to degrees
     // for example, 100% is 360 degrees.  
     // rads = deg * (pi / 180)
     

     .endAngle(arcAngle)  // just radians NOTE:  we need to pass the data here;

svgContainer.append("path")
     .attr("d",arc)
     .style("fill","#149194")
     .attr("transform","translate(" + width/2.0 + "," + height/2.8 +")");

// add some text here

var text = svgContainer.append('text').text(arcPercentage.toString() + "%") 
     .attr("x",width/2.9)
     .attr("y",height/2.6) 
     .attr("font-family","sans-serif")
     .attr("font-size","36px")
     .attr("fill","white");


// add the rectangle at the bottom
// note this will be dynamic too, based on change from previous month

var prevMonthRectangle = svgContainer.append("rect")
     .attr("x",width/8)
     .attr("y",height/1.5)
     .attr("width",180)
     .attr("height",40)
     .attr("fill","#A60028");

// and add text in the box
// TO-DO:  eliminate hard coding of sizing x and y position
var textmonth = svgContainer.append('text').text(prevMonthChange.toString() + "%")
     .attr("x",width/4.0)
     .attr("y",height/1.34)
     .attr("font-family","sans-serif")
     .attr("font-size","18px")
     .attr("fill","white");

// DEFINE THE ARROW MAKRKER
// define marker

svgContainer.append("defs").append("marker")
    .attr("id","arrowhead")
    .attr("refX",5)
    .attr("refY",2)
    .attr("markerWidth",6)
    .attr("markerHeight",4)
    .attr("orient","auto")
    .attr("fill","white")
     .append("path")
      .attr("d","M 0,0 V 4 L6,2 Z");

"M0,-5L10,0L0,0"

// draw the line
svgContainer.append("line")
     .attr("x1",width/5)
     .attr("x2",width/5)
     .attr("y1",height/1.45)
     .attr("y2",height/1.29)
     .style("stroke","white")
     .style("stroke-width",2)
     .attr("marker-end","url(\#arrowhead)")





// 581781
// green 149194

// var circle = svgContainer.append("circle")
//            .attr("cx",width/2)
//             .attr("cy",height/2.8)
//            .attr("r",60)
//            .style("fill","#1B0046");



