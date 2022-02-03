// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import * as bootstrap from "bootstrap"
import "./src/jquery.js"
import "jquery-ui"


$('select.select-currency').on('focus', function(){
  var selected = this.selectedOptions[0].value
  localStorage.setItem("current", selected)
});

$('select.select-currency').on('click', function(){
  var selected = this.selectedOptions[0].value
  const url=`${window.location.href}.js`;
  $.ajax({
    type: "GET",
    url: url,
    data: { from_currency: localStorage.getItem("current"), to_currency: selected }
  })
});
