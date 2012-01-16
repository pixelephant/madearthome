$("document").ready(function(){

		$(".ui-menu-item").live('click', function(){
			var category_id = $("#product_category_id_field option").val();

			$.post("/admin_ajax/getcategoryproperties",{
    		category_id : category_id
    	},function(resp){
				if(resp.error == "none"){
//					$("#product_property_ids_field  .ra-multiselect-left  .ra-multiselect-collection").html("");
					var html = "";
					$.each(resp.prop_ids, function(i, item){
						console.log(item);
						console.log(resp.prop_names[i]);
						html += createOption(item, resp.prop_names[i]);
					});
					$("#product_property_ids_field  .ra-multiselect-left  .ra-multiselect-collection").html(html);
				}
    	}, "json");
		});

});

function createOption(value, text){
	return '<option value="' + value + '">' + text + '</option>';
}
