// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require jquery_ujs
//= require turbolinks


$(document).ready(function() {

  $(function() {
      $('#side-menu').metisMenu();
  });

  //Loads the correct sidebar on window load,
  //collapses the sidebar on window resize.
  // Sets the min-height of #page-wrapper to window size
  $(function() {
      $(window).bind("load resize", function() {
          var topOffset = 50;
          var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
          if (width < 768) {
              $('div.navbar-collapse').addClass('collapse');
              topOffset = 100; // 2-row-menu
          } else {
              $('div.navbar-collapse').removeClass('collapse');
          }

          var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 2;
          height = height - topOffset;
          if (height < 1) height = 1;
          if (height > topOffset) {
              $("#page-wrapper").css("min-height", (height) + "px");
          }
      });

      var url = window.location;
      var element = $('ul.nav a').filter(function() {
          return this.href == url;
      }).addClass('active').parent().parent().addClass('in').parent();
      if (element.is('li')) {
          element.addClass('active');
      }
  });

  $("tbody").on("click", "#add", function (event) {
    event.preventDefault();
    $(this).closest("tbody").find("tr:last").clone().appendTo("tbody")
      .find("input:text").val("").end().find(':input')
      .attr('name', function(index, name) {
          return name.replace(/([0-9]+)/i, function(fullMatch, n) {
              return Number(n) + 1;
          });
    });
  });

  $("tbody").on("click", "#remove", function (event) {
    event.preventDefault();
    $(this).closest("tr").remove();
  });

});
