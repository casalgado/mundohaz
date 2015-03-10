$(document).ready(function(){"use strict";$("#add_variant_id").change(function(){var t=$(this).val(),e=_.find(window.variants,function(e){return e.id==t});$("#stock_details").html(variantStockTemplate({variant:e})),$("#stock_details").show(),$("button.add_variant").click(addVariantFromStockLocation)}),$("a.edit-item").click(toggleItemEdit),$("a.cancel-item").click(toggleItemEdit),$("a.split-item").click(startItemSplit),$("a.save-item").click(function(){var t=$(this),e=t.data("shipment-number"),n=t.data("variant-id"),a=parseInt(t.parents("tr").find("input.line_item_quantity").val());return toggleItemEdit(),adjustShipmentItems(e,n,a),!1}),$("a.delete-item").click(function(){if(confirm(Spree.translations.are_you_sure_delete)){var t=$(this),e=t.data("shipment-number"),n=t.data("variant-id");toggleItemEdit(),adjustShipmentItems(e,n,0)}return!1}),$("[data-hook=admin_shipment_form] a.ship").on("click",function(){var t=$(this),e=t.data("shipment-number"),n=Spree.url(Spree.routes.shipments_api+"/"+e+"/ship.json");$.ajax({type:"PUT",url:n,data:{token:Spree.api_key}}).done(function(){window.location.reload()}).error(function(t){console.log(t)})}),$("a.edit-method").click(toggleMethodEdit),$("a.cancel-method").click(toggleMethodEdit),$("[data-hook=admin_shipment_form] a.save-method").on("click",function(t){t.preventDefault();var e=$(this),n=e.data("shipment-number"),a=e.parents("tbody").find("select#selected_shipping_rate_id[data-shipment-number='"+n+"']").val(),i=e.parents("tbody").find("input[name='open_adjustment'][data-shipment-number='"+n+"']:checked").val(),r=Spree.url(Spree.routes.shipments_api+"/"+n+".json");$.ajax({type:"PUT",url:r,data:{shipment:{selected_shipping_rate_id:a,unlock:i},token:Spree.api_key}}).done(function(){window.location.reload()}).error(function(t){console.log(t)})});var t=function(t){t.preventDefault();var e=$(this);e.parents("tbody").find("tr.edit-tracking").toggle(),e.parents("tbody").find("tr.show-tracking").toggle()};$("a.edit-tracking").click(t),$("a.cancel-tracking").click(t),$("[data-hook=admin_shipment_form] a.save-tracking").on("click",function(t){t.preventDefault();var e=$(this),n=e.data("shipment-number"),a=e.parents("tbody").find("input#tracking").val(),i=Spree.url(Spree.routes.shipments_api+"/"+n+".json");$.ajax({type:"PUT",url:i,data:{shipment:{tracking:a},token:Spree.api_key}}).done(function(t){e.parents("tbody").find("tr.edit-tracking").toggle();var n=e.parents("tbody").find("tr.show-tracking");n.toggle(),n.find(".tracking-value").html($("<strong>").html("Tracking: ")).append(t.tracking)})})}),adjustShipmentItems=function(t,e,n){var a=_.findWhere(shipments,{number:t+""}),i=_.where(a.inventory_units,{variant_id:e}),r=Spree.routes.shipments_api+"/"+t,o=0;i.length<n?(r+="/add",o=n-i.length):i.length>n&&(r+="/remove",o=i.length-n),r+=".json",0!=o&&$.ajax({type:"PUT",url:Spree.url(r),data:{variant_id:e,quantity:o,token:Spree.api_key}}).done(function(){window.location.reload()}).fail(function(t){alert(t.responseJSON.message)})},toggleMethodEdit=function(){var t=$(this);return t.parents("tbody").find("tr.edit-method").toggle(),t.parents("tbody").find("tr.show-method").toggle(),!1},toggleItemEdit=function(){var t=$(this);return t.parent().find("a.edit-item").toggle(),t.parent().find("a.cancel-item").toggle(),t.parent().find("a.split-item").toggle(),t.parent().find("a.save-item").toggle(),t.parent().find("a.delete-item").toggle(),t.parents("tr").find("td.item-qty-show").toggle(),t.parents("tr").find("td.item-qty-edit").toggle(),!1},startItemSplit=function(t){t.preventDefault();var e=$(this);e.parent().find("a.edit-item").toggle(),e.parent().find("a.split-item").toggle(),e.parent().find("a.delete-item").toggle();var n=e.data("variant-id"),a={};$.ajax({type:"GET",async:!1,url:Spree.url(Spree.routes.variants_api),data:{q:{id_eq:n},token:Spree.api_key}}).success(function(t){a=t.variants[0]}).error(function(t){console.log(t)});var i=e.closest("tr").data("item-quantity"),r=Handlebars.compile($("#variant_split_template").text());e.closest("tr").after(r({variant:a,shipments:shipments,max_quantity:i})),$("a.cancel-split").click(cancelItemSplit),$("a.save-split").click(completeItemSplit),$("#item_stock_location").select2({width:"resolve",placeholder:Spree.translations.item_stock_placeholder})},completeItemSplit=function(t){if(t.preventDefault(),""===$("#item_stock_location").val())return alert("Please select the split destination."),!1;var e=$(this),n=e.closest("tr"),a=n.data("variant-id"),i=n.find("#item_quantity").val(),r=n.find("#item_stock_location").val(),o=e.closest("tbody").data("shipment-number"),s=n.find($("#item_stock_location").select2("data").element),d=s.data("shipment-number"),l=s.data("new-shipment");"new_shipment"!=r&&(void 0!=l?$.ajax({type:"POST",async:!1,url:Spree.url(Spree.routes.shipments_api+"/transfer_to_location"),data:{original_shipment_number:o,variant_id:a,quantity:i,stock_location_id:r,token:Spree.api_key}}).error(function(t){alert(t.responseJSON.message)}).done(function(){window.Spree.advanceOrder()}):$.ajax({type:"POST",async:!1,url:Spree.url(Spree.routes.shipments_api+"/transfer_to_shipment"),data:{original_shipment_number:o,target_shipment_number:d,variant_id:a,quantity:i,token:Spree.api_key}}).error(function(t){alert(t.responseJSON.message)}).done(function(){window.Spree.advanceOrder()}))},cancelItemSplit=function(t){t.preventDefault();var e=$(this),n=e.closest("tr").prev();e.closest("tr").remove(),n.find("a.edit-item").toggle(),n.find("a.split-item").toggle(),n.find("a.delete-item").toggle()},addVariantFromStockLocation=function(t){t.preventDefault(),$("#stock_details").hide();var e=$("input.variant_autocomplete").val(),n=$(this).data("stock-location-id"),a=$("input.quantity[data-stock-location-id='"+n+"']").val(),i=_.find(shipments,function(t){return t.stock_location_id==n&&("ready"==t.state||"pending"==t.state)});return void 0==i?$.ajax({type:"POST",url:Spree.url(Spree.routes.shipments_api+"?shipment[order_id]="+order_number),data:{variant_id:e,quantity:a,stock_location_id:n,token:Spree.api_key}}).done(function(){window.location.reload()}).error(function(t){console.log(t)}):adjustShipmentItems(i.number,e,a),1};