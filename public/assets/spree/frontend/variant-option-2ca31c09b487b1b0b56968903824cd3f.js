var ready=function(){$(".variant-option-values li a").each(function(){"Green"==$(this).attr("title")&&(this.style.setProperty("background-color","green","important"),$(this).empty()),"Red"==$(this).attr("title")&&(this.style.setProperty("background-color","red","important"),$(this).empty()),"Blue"==$(this).attr("title")&&(this.style.setProperty("background-color","blue","important"),$(this).empty()),$(this).hasClass("locked")&&(this.style.setProperty("background-color","white","important"),$(this).empty())}),$(".option-value").on("mousemove",function(){$(".variant-option-values li a").each(function(){"Green"==$(this).attr("title")&&(this.style.setProperty("background-color","green","important"),$(this).empty()),"Red"==$(this).attr("title")&&(this.style.setProperty("background-color","red","important"),$(this).empty()),"Blue"==$(this).attr("title")&&(this.style.setProperty("background-color","blue","important"),$(this).empty()),$(this).hasClass("unavailable")&&(this.style.setProperty("background-color","lightgray","important"),$(this).empty())})})};$(document).ready(ready),$(document).on("page:load",ready);