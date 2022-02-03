// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import * as bootstrap from "bootstrap"
import "./src/jquery.js"
import "jquery-ui"


$(document).on('focus', 'select.select-currency', function(){
  var selected = this.selectedOptions[0].value
  localStorage.setItem("current", selected)
});

$(document).on('change', 'select.select-currency', function(){
  var selected = this.selectedOptions[0].value
  const url=`${window.location.href}.js`;
  $.ajax({
    type: "GET",
    url: url,
    data: { from_currency: localStorage.getItem("current"), to_currency: selected }
  })
});
