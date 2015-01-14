
    // grab the dmm data
    var d3searchdata = JSON.parse(searchdata);
    // jpb, debug only below
    // console.log(d3searchdata);


    // jpb, 3/19, set the width and height
    var width = 180;
    var height = 100;

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

        d3.layout.cloud().size([180,100])

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
         
