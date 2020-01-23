/*
Use this bit of code in any html page where you want to integrate with the Maker Hub digital signage messaging system.
In this implementation, it listens to the doorbell channel, 
but this could be changed to listen to other channels, 
or have a more generic implementation

// run through javascript obfuscator: 
*/
    

    /*

  $(".doorbellcontainer").aioAlert({
    group : "MakerHubEvents",
    feedname : "backdoorbell",
    fontcolor : "black",
    textOverride : "DOORBELL",
    bordercolor : "#F0004E",
    bgcolor1 : "red",
    bgcolor2 : "yellow"
  });
    */
    


(function ( $ ) {
 
    $.fn.aioAlert = function( options ) {


        this.hide();

        var thisthis = this;

        var username = "gumakerhub";
        var password = "";
        var mqtt_server = "wss://io.adafruit.com";
 
        // This is the easiest way to have default options.
        var settings = $.extend({
            // These are the defaults.
            fontcolor: "black",
            bordercolor: "black",
            bgcolor1 : "red",
            bgcolor2: "yellow"
        }, options );
        // Greenify the collection based on the settings variable.
        var topic = username + "/feeds/"+ settings.group.toLowerCase()+"."+settings.feedname.toLowerCase();
        var mqtt_options = { username: username, password: password };
        this.css({
          color: settings.fontcolor,
          width: "60%",
          height: "60%",
          position: "absolute",
          left: "50%",
          top: "50%",
          border: "5px solid "+ settings.bordercolor,
          "border-radius" : "25%",
          transform: "translate(-50%, -50%)",
          "background-color": settings.bgcolor1,
          "font-size": "5em",

        });


        var post_message = function(message){
          var messagediv = $("<div class='message'>"+message+"</div>");
          thisthis.html(messagediv);
          $(messagediv).css({
            position: "relative",
            left: "50%",
            "text-align": "center",
            top: "50%",
            transform: "translate(-50%, -50%)",          
          });          

          if(settings.startpost){
            settings.startpost(thisthis, message, messagediv);

          }
          var endpost = function(){
            if(settings.endpost){
              settings.endpost(thisthis, message, messagediv);
            }
          }

          var count = 10;
          var blink = function(){
            $(thisthis).fadeIn(500);
            $(thisthis).fadeOut(500);
            count--
            if(count > 0){
              blink();
            }else{
              endpost();

            }
          }
          blink();
        }

        var client = mqtt.connect(mqtt_server, mqtt_options);
        client.on("connect", function() {
          // need to SUBSCRIBE to the topic
          client.subscribe(topic, function(err) {
            console.log("subscribed "+ topic);
            if (!err) {
              //client.publish(to_audience_topic, "Hello mqtt");
            }
          });
        });

        client.on("message", function(sent_topic, payload) {
          console.log("message");
          console.log(sent_topic);
          if (topic == sent_topic) {
            if(settings.textOverride){
              payload = settings.textOverride;
            }
            post_message(payload);
          }
          //console.log(payload);
        });

        if (client && client.connected) {
        } else {
          console.log("not connected");
        }



/*
        if(settings.textOverride){
          payload = settings.textOverride;
        }
        post_message(payload);
*/
        return this;
 
    };
 
}( jQuery ));

