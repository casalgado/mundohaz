(function(){jQuery(function(){var t;return t=$("#stock_movement_stock_item_id"),t.select2({placeholder:"Find a stock item",ajax:{url:Spree.url(Spree.routes.stock_items_api(t.data("stock-location-id"))),data:function(t,e){return{q:{variant_product_name_cont:t},per_page:50,page:e,token:Spree.api_key}},results:function(t,e){var a;return a=50*e<t.count,{results:t.stock_items,more:a}}},formatResult:function(t){return variantTemplate({variant:t.variant})},formatSelection:function(t){return t.variant.name+" ("+t.variant.options_text+")"}})})}).call(this);