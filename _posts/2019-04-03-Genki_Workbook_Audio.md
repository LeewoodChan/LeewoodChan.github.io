---
layout: post
title: Genki Workbook Audio
comments: true
# other options
permalink: "/genki_WK_audio/"
---
<style>

    .list-group{
        max-height: 300px;
        overflow:scroll;
        -webkit-overflow-scrolling: touch;
    }
</style>


<!--script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script-->

<script type="text/javascript">//<![CDATA[
    $(function(){

    document.getElementById("nextAudio").onclick = function() {
        forward();
    }
    document.getElementById("backAudio").onclick = function() {
        backward();
    }

    $(document).ready(function(){
            $(".song").first(0).addClass("active");

            var startUrl = $(".song").first(0).attr('source');
            console.log(startUrl);
            $("#mp3_src").attr("src", startUrl);
            var audio = $("audio-player");
            $('audio').get(0).load();
            updateCurrentPlay();

        $('[source]').on('click', function(){
            change( $(this).attr('source')  );
            $(this).addClass("active");
            updateCurrentPlay();
            //var currentPlay = $("#currentPlay");
            //currentPlay.text($(this).text());
            //console.log(currentPlay.text());
            //console.log($(this).text());
        });

          $('#audio-player').on('ended', function() {

            //alert("done");
            forward();
            // enable button/link
          });


    });

    function change(sourceUrl) {
            var audio = $("audio-player");

            $("#mp3_src").attr("src", sourceUrl);
            $(".song").removeClass("active");
            /****************/
            $('audio').get(0).pause();
            $('audio').get(0).load();//suspends and restores all audio element
            $('audio').get(0).play();
    }


    var updateCurrentPlay = function(){
        var currentPlay = $("#currentPlay");
        var current = $(".active").text();
        console.log("current:" + current);
        currentPlay.text(current);
    }

    var forward = function(){
        //alert("forward");
        var current = $(".active").next();
        var currentText = current.text();
        var currentUrl;
        if(currentText === ""){
            //current = $(".song").first(0).text();
            currentUrl = $(".song").first(0).attr('source');
            current =$(".song").first(0);
        }else{
            currentUrl = $(".active").next().attr('source');
        }
        //var sourceUrl = current.text();
        console.log(currentUrl);
        change(currentUrl);
        current.addClass('active');
        updateCurrentPlay();


    }
    var backward = function(){

        var current = $(".active").prev();
        var currentText = current.text();
        var currentUrl;
        //var sourceUrl = current.text();
        if(currentText ===""){
            //current = $(".song").last(0).text();
            currentUrl = $(".song").last(0).attr('source');
            current =$(".song").last(0);

        }else{
            currentUrl = $(".active").prev().attr('source');
        }
        console.log(currentUrl);
        change(currentUrl);
        current.addClass('active');
        updateCurrentPlay();

    }


    });//]]>
</script>

<div class="container border px-0 border-warning bg-dark" id="audiowrap">
    <div class="row mx-0" id="audio0">
        <audio class="m-0 col-sm-12 border p-0" preload id="audio-player" controls="controls">
            <source id="mp3_src"  type="audio/mp3">
            Your browser does not support HTML5 Audio!
        </audio>
    </div>
    <div class="row border border-warning mx-0">
        <button type="button" name="button" class="btn btn-dark col" id="backAudio">
            <i class="fas fa-fast-backward" style="color:white"></i>
        </button>
        <a class="col-8 text-center text-white" id="currentPlay">Now playing.......</a>
        <button type="button" name="button" class="btn btn-dark col" id="nextAudio">
            <i class="fas fa-fast-forward" style="color:white"></i>
        </button>

    </div>

    <div class="panel panel-primary" id="result_panel">
        <div class="panel-body">
            <div class="list-group">
                {% for item in site.data.audio %}
                    <a href="#" source="{{ item.link }}" class="song list-group-item list-group-item-action py-1">{{ item.name }}</a>
                <!--button type="button" source="{{ item.link }}" class="song list-group-item list-group-item-action">{{ item.name }}</button-->
                {% endfor %}
            </div>
        </div>
    </div>


</div>
