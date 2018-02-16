
$(document).ready(function(){
  eventbriteAPI();
})

var eventbriteAPI = function(){

  var api = "https://www.eventbriteapi.com/v3/events/search/?token=VPI2P2UJ4YNNNYI4FLGI&location.latitude=36.974117&location.longitude=-122.030792&location.within=25mi&categories=102&subcategories=2003,2004,2005,2006,2007";
  var eventName
  var eventDescription
  var eventURL
  var eventLogo
  var eventItem = ""

  $.getJSON(api, function(data){
    if (data.events.length) {
      $('.event-title').text("Check out these tech events around the Santa Cruz area!");
      data.events.forEach(function(e){
        eventName = e.name.text;
        eventLogo = e.logo.url;
        eventURL = e.url;

        eventItem = eventItem + "<div class='card mb-4 box-shadow event-item'>"
                                + "<img src=" + eventLogo + " height= '200', width= '100%'>"
                                + "<div class='card-body'>"
                                  + "<p class='card-text'>"
                                  + "<span><a  class='event-text' href=" + eventURL + "></span>" + eventName + "</a>"
                                  + "</p>"
                                + "</div>"
                              + "</div>";

        $('.events-container').html(eventItem);
      })
    } else {
      $('.event-title').text("Sorry there are no upcoming events in the Santa Cruz area.")
    }
  })
}
