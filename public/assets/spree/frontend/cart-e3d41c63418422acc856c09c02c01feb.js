(function(){Spree.ready(function(t){return t("form#update-cart").is("*")&&t("form#update-cart a.delete").show().one("click",function(){return t(this).parents(".line-item").first().find("input.line_item_quantity").val(0),t(this).parents("form").first().submit(),!1}),t("form#update-cart").submit(function(){return t("form#update-cart #update-button").attr("disabled",!0)})}),Spree.fetch_cart=function(){return $.ajax({url:Spree.pathFor("cart_link"),success:function(t){return $("#link-to-cart").html(t)}})}}).call(this);