// allcharts.js
// jpb, 2014-02-10
// rework to load multiple D3.js charts on the page

 console.log("allcharts.js loaded");

//  CROSS SHOP DATA HERE

    // grab the shop data
    var d3shopdata = JSON.parse(shopdata); 
    var d3dmmdata = JSON.parse(dmmdata);
    // jpb, 2014-03-18 added search data for word cloud
    var d3searchdata = JSON.parse(searchdata);
    // jpb, debug only below
    // console.log(d3dmmdata);
   
   // set up boundaries for bar chart
    
        var valueLabelWidth = 40;   // space reserved for value labels (right)
        var barHeight = 20;         // height of one bar
        var barLabelWidth = 120;    // space reserved for bar labels
        var barLabelPadding = 5;    // padding between bar and bar labels (left)
        var gridLabelHeight = 18;   // space reserved for gridline labels
        var gridChartOffset = 3;    // space between start of grid and first bar
        var maxBarWidth = 420;      // width of the bar with the max value
    
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
        
            var chart = d3.select('#crossshopchart').append("svg")
                .attr('width', maxBarWidth + barLabelWidth + valueLabelWidth)
                .attr('height', gridLabelHeight + gridChartOffset + d3shopdata.length * barHeight);
            
            // grid line labels
            var gridContainer = chart.append('g')
                .attr('transform','translate(' + barLabelWidth + ',' + gridLabelHeight + ')');
            gridContainer.selectAll("text").data(x.ticks(10)).enter().append("text")
                .attr("x",x)
                .attr("dy",-3)
                .attr("text-anchor","middle")
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
                .text(barLabel);

            // bars
            var barsContainer = chart.append('g')
                .attr('transform', 'translate(' + barLabelWidth + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
            barsContainer.selectAll("rect").data(d3shopdata).enter().append("rect")
                .attr('y', y)
                .attr('height', yScale.rangeBand())
                .attr('width', function(d) { return x(barValue(d)); })
                .attr('stroke', 'white')
                .attr('fill', 'steelblue');
            
            // bar value labels
            barsContainer.selectAll("text").data(d3shopdata).enter().append("text")
                .attr("x", function(d) { return x(barValue(d)); })
                .attr("y", yText)
                .attr("dx", 3) // padding-left
                .attr("dy", ".35em") // vertical-align: middle
                .attr("text-anchor", "start") // text-align: right
                .attr("fill", "black")
                .attr("stroke", "none")
                .text(function(d) { return d3.round(barValue(d), 2); });

            // start line
            barsContainer.append("line")
                .attr("y1", -gridChartOffset)
                .attr("y2", yScale.rangeExtent()[1] + gridChartOffset)
                .style("stroke", "#000");

// END OF CROSS SHOP CHART

//
// START OF DMM CHART - UPPER RIGHT

  
        var margin = {top: 20, right: 40, bottom: 70, left: 40},
        width = 550- margin.left - margin.right,
        height = 250 - margin.top - margin.bottom;

      
        var parseDate = d3.time.format("%Y-%m-%d").parse;
        // var formatDate = d3.time.format("%b-%Y").parse;
        
        // for color
        var color = d3.scale.category10();

        // set the ranges
        var x = d3.time.scale().range([0, width]);
        var y = d3.scale.linear().range([height, 0]);
        
                // define the axes
        var xAxis = d3.svg.axis().scale(x)
            .orient("bottom")
            .tickFormat(d3.time.format("%b %Y"));

        var yAxis = d3.svg.axis().scale(y)
            .orient("left");

        // define the line
        var line = d3.svg.line()
           // .interpolate("basis")
            .x(function(d) { 
                    // jpb, debug below
                    // console.log(d.date); 
                    return x(d.date); })
            .y(function(d) { 
                    // jpb, debug below
                    // console.log(d.dmm); 
                    return y(d.dmm); });

// Adds the chart in the upper left on row 1
    
        var chart1 = d3.select("#dmm")
            .append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


        // add color
        color.domain(d3.keys(d3dmmdata[0].fields).filter (
               function(key) { return key == "clientmodel"; }
               ));
        
        // coerce data into the right formats
        
        d3dmmdata = d3dmmdata.map( function(d) {
            return {
                clientmodel: d.fields.clientmodel,
                date: parseDate(d.fields.yearmonth),
                dmm : +d.fields.dmm };
        });
        
        // nest the data on clientmodel since we want to draw one line per model
        
        d3dmmdata = d3.nest().key(function(d) {return d.clientmodel; }).entries(d3dmmdata);
        


      x.domain([d3.min(d3dmmdata,function(d) { return d3.min(d.values, function (d) { return d.date;});  }),
                d3.max(d3dmmdata,function(d) {return d3.max(d.values, function (d) {return d.date;}); })]);
                
        // y.domain([0,d3.max(d3dmmdata, function(d) { return d3.max(d.values, function (d) {return d.dmm; }); })]);
        y.domain([0,100]);
         
            

        chart1.append("g")         // Add the X Axis
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis)
                .selectAll("text")
                .style("text-anchor","end")
                .attr("dx", "-.8em")
                .attr("dy", ".15em")
                .attr("transform", function(d) { return "rotate(-65)"});
 

        chart1.append("g")         // Add the Y Axis
            .attr("class", "y axis")
            .call(yAxis);
        
         
        var clientmodels = chart1.selectAll(".clientmodel").data(d3dmmdata,function(d) { return d.key })
                .enter().append("g")
                .attr("class", "clientmodel");
        
        clientmodels.append("path")
            .attr("class","line")
            .attr("fill","none")
            .attr("stroke","#ccc")
            .attr("d", function(d) {
                // jpb, debug only below
                // console.log(d); 
                return line(d.values); })
            .style("stroke", function(d) {return color(d.key); });
            

    // jpb, added the legend
    var legend = clientmodels.selectAll('g')
        .data(d3dmmdata)
        .enter()
        .append('g')
            .attr('class','legend');
            
            console.log('at legend');
            
        legend.append('rect')
            .attr('x',width-20)
            .attr('y',function(d,i){return i * 20;})
            .attr('width',10)
            .attr('height',10)
            .style('fill', function(d) { console.log(d.key); return color(d.key);
            });
            
        legend.append('text')
            .attr('x',width-8)
            .attr('y',function(d,i){return(i*20) + 9;})
            .text(function(d){ return d.key; });


// END OF CROSS SHOP   

// NOW ADD THE SEARCH INFO

    // jpb, 3/19, set the width and height
    var searchwidth = 180;
    var searchheight = 100;

        d3searchdata = d3searchdata.map(function(d) {
            return {
                searchkeyword: d.fields.searchkeyword,
                pageviews: + d.fields.searchkw_pageviews
            };
            
            });


        var wordFreqArray;
        wordFreqArray = new Array();
        for(var k=d3searchdata.length-1;k>=0;k--){
            wordFreqArray[k] = d3searchdata[k].searchkeyword;
        };

        console.log(wordFreqArray);
         var fill = d3.scale.category10;

        d3.layout.cloud().size([searchwidth,searchheight])

            .words(wordFreqArray.map(function(d) {
            
            return {text: d, size: 5 + Math.random() * 10};
            }))
            .padding(2)
            .rotate(function() { return ~~(Math.random() * 2) * 0; })
            .font("Impact")
           .fontSize(function(d) { console.log(d.size); return d.size; })
            .on("end", draw)
            .start();
    
   
  
  
    
      function draw(words) {
            d3.select("#searchchart").append("svg")
            .attr("width", 180)
            .attr("height", 100)
        .append("g")
        .attr("transform", "translate(60,50)")
        .selectAll("text")
        .data(words)
      .enter().append("text")
        .style("font-size", function(d) { return d.size + "px"; })
        .style("font-family", "Arial")
        .style("fill", function(d, i) { return fill(i); })
        .attr("text-anchor", "middle")
        .attr("transform", function(d) {
          return "translate(" + [d.x/1.2, d.y/1.2] + ")rotate(" + d.rotate + ")";
        })
        .text(function(d) { return d.text; });
  }
         
         


console.log("end of allcharts.js");
