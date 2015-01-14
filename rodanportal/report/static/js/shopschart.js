// shopscharts.js
// jpb, 2014-02-10
// rework to use single chart for crossshops
// working with scaled down chart

 console.log("shopscharts.js loaded");

//  CROSS SHOP DATA HERE

    // grab the shop data
    var d3shopdata = JSON.parse(shopdata); 


   
   // set up boundaries for bar chart
    
        var valueLabelWidth = 40;   // space reserved for value labels (right)
        var barHeight = 15;         // height of one bar
        var barLabelWidth = 155;    // space reserved for bar labels
        var barLabelPadding = 5;    // padding between bar and bar labels (left)
        var gridLabelHeight = 20;   // space reserved for gridline labels
        var gridChartOffset = 3;    // space between start of grid and first bar
        var maxBarWidth = 170;      // width of the bar with the max value
        
        // jpb, added to limit chart viewing area 
        var svgWidth = 350;
        var svgHeight = 140;
    
    // accessor functions to return data
        var barLabel = function(d) { return d.fields.crossmodel; };
        var barValue = function(d) { 
            // jpb, DEBUG ONLY HERE
            // console.log(d.fields.shops);
            // jpb, END OF DEBUG
            return parseFloat(d.fields.shops); };
 

            // scales here
        
            var yScale = d3.scale.ordinal().domain(d3.range(0,d3shopdata.length)).rangeBands([0,d3shopdata.length * barHeight]);
            var y = function(d,i) { return yScale(i); };
            
            var yText = function(d,i) { return y(d,i) + yScale.rangeBand() / 2; };
            var x = d3.scale.linear().domain([0, d3.max(d3shopdata,barValue)]).range([0,maxBarWidth]);
            
            // svg container element
        
            var chart = d3.select('#crosschart').append("svg")
                // jpb, changed the svg width and height to limit to viewport
                // .attr('width', maxBarWidth + barLabelWidth + valueLabelWidth)
                // .attr('height', gridLabelHeight + gridChartOffset + d3shopdata.length * barHeight);
            
                .attr('width',svgWidth)
                .attr('height',svgHeight);
                
        

            // grid line labels
            var gridContainer = chart.append('g')
                .attr('transform','translate(' + barLabelWidth + ',' + gridLabelHeight + ')');
            gridContainer.selectAll("text").data(x.ticks(10)).enter().append("text")
                .attr("x",x)
                .attr("dy",-3)
                .attr("text-anchor","middle")
                .style("font-family","sans-serif")
                .style("font-size","10px")
                .text(String);
            
            // vertical grid lines
            
            gridContainer.selectAll("line").data(x.ticks(10)).enter().append("line")
                .attr("x1", x)
                .attr("x2", x)
                .attr("y1", 0)
                .attr("y2", yScale.rangeExtent()[1] + gridChartOffset)
                .style("stroke", "#ccc");

            // bar labels
            var labelsContainer = chart.append('g')
                .attr('transform', 'translate(' + (barLabelWidth - barLabelPadding) + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
            labelsContainer.selectAll('text').data(d3shopdata).enter().append('text')
                .attr('y', yText)
                .attr('stroke', 'none')
                .attr('fill', 'black')
                .attr("dy", ".35em") // vertical-align: middle
                .attr('text-anchor', 'end')
                .style("font-family","sans-serif")
                .style("font-size","10px")
                .text(barLabel);

            // bars
            var barsContainer = chart.append('g')
                .attr('transform', 'translate(' + barLabelWidth + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
            barsContainer.selectAll("rect").data(d3shopdata).enter().append("rect")
                .attr('y', y)
                .attr('height', yScale.rangeBand())
                .attr('width', function(d) { return x(barValue(d)); })
                .attr('stroke', 'white')
                .attr('fill', '#00a8e0');
            
            // bar value labels
            barsContainer.selectAll("text").data(d3shopdata).enter().append("text")
                .attr("x", function(d) { return x(barValue(d)); })
                .attr("y", yText)
                .attr("dx", 3) // padding-left
                .attr("dy", ".35em") // vertical-align: middle
                .attr("text-anchor", "start") // text-align: right
                .attr("fill", "black")
                .attr("stroke", "none")
                .style("font-family","sans-serif")
                .style("font-size","10px")
                .text(function(d) { return d3.round(barValue(d), 2); });

            // start line
            barsContainer.append("line")
                .attr("y1", -gridChartOffset)
                .attr("y2", yScale.rangeExtent()[1] + gridChartOffset)
                .style("stroke", "#000");

// END OF CROSS SHOP CHART

//


console.log("end of shopscharts.js");
