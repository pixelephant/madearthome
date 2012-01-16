$("document").ready(function(){

		$(".ui-menu-item").live('click', function(){
			var category_id = $("#product_category_id_field option").val();
//			alert(category_id);
			$.post("/admin_ajax/getcategoryproperties",{
    		category_id : category_id
    	},function(resp){
				if(resp.error == "none"){
					$.each(resp.prop_ids, function(i, item){
						console.log(item);
					});
				}

    	}, "json");
		});

});
