$(function() {

	$.extend($.jgrid.defaults, {
				datatype: 'json',
				jsonReader : {
					repeatitems:false,
					total: function(result) {
						//Total number of pages
						return Math.ceil(result.total / result.max);
					},
					records: function(result) {
						//Total number of records
						return result.total;
					}
				},
//				prmNames: {
//					page: "page.page",
//					rows: "page.size",
//					sort: "page.sort",
//					order: "page.sort.dir"
//				},
//				sortname: 'title',
//				sortorder: 'asc',
				height: 'auto',
				viewrecords: true,
				rowList: [10, 20, 50, 100],
				altRows: true,
				loadError: function(xhr, status, error) {
					alert(error);
				}
			});

	$.extend($.jgrid.edit, {
				closeAfterEdit: true,
				closeAfterAdd: true,
				ajaxEditOptions: { contentType: "application/json" },
				mtype: 'PUT',
				serializeEditData: function(data) {
					delete data.oper;
					return JSON.stringify(data);
				}
			});
	$.extend($.jgrid.del, {
				mtype: 'DELETE',
				serializeDelData: function() {
					return "";
				}
			});

	var editOptions = {
		onclickSubmit: function(params, postdata) {
			//params.url = URL + '/' + postdata.id;
			params.url = 'prod/save';
		}
	};
	var addOptions = {mtype: "POST"};
	var delOptions = {
		onclickSubmit: function(params, postdata) {
			params.url = URL + '/' + postdata;
		}
	};

	var URL = 'prod/list';
	var options = {
		url: URL,
		editurl: 'prod/save',
		colModel:[
			{
				name:'GROUP_ID',
				label: 'GROUP_ID',
				index: 'GROUP_ID',
				//formatter:'integer',
				width: 100,
				editable: true,
				editoptions: {disabled: true, size:5}
			},
			{
				name:'GROUP_NM',
				label: 'GROUP_NM',
				index: 'GROUP_NM',
				width: 200,
				editable: true,
				editrules: {required: true}
			},
			{
				name:'GROUP_FULL_NM',
				label: 'GROUP_FULL_NM',
				index: 'GROUP_FULL_NM',
				width: 200,
				editable: true,
				editrules: {required: true}
			},
			{
				name:'ORDER_NO',
				label: 'ORDER_NO',
				index: 'ORDER_NO',
				//hidden: true,
				editable: true,
				//edittype: 'select',
				//editrules: {edithidden:true},
				//editoptions: {
				//	value: {'PAPERBACK': 'paperback', 'HARDCOVER': 'hardcover', 'DUST_JACKET': 'dust jacket'}
				//}
			},
			{
				name:'GROUP_STATUS_CD',
				label: 'GROUP_STATUS_CD year',
				index: 'GROUP_STATUS_CD',
				width: 80,
				align: 'center',
				editable: true,
				editrules: {required: true, integer: true},
				editoptions: {size:5, maxlength: 4}
			},
			{
				name:'GROUP_TYPE_ID',
				label: 'GROUP_TYPE_ID',
				index: 'GROUP_TYPE_ID',
				//formatter: 'checkbox',
				width: 46,
				align: 'center',
				editable: true,
				//edittype: 'checkbox',
				//editoptions: {value:"true:false"}
			},
			{
				name:'GROUP_TYPE_CD',
				label: 'GROUP_TYPE_CD',
				index: 'GROUP_TYPE_CD',
				hidden: true,
				editable: true,
				//edittype: 'textarea',
				//editrules: {edithidden:true}
			}
		],
		caption: "Products",
		pager : '#jqGridPager',
		height: 'auto',
		ondblClickRow: function(id) {
			jQuery(this).jqGrid('editGridRow', id, editOptions);
		}
	};

	$("#jqGrid")
			.jqGrid(options)
			.navGrid('#jqGridPager',
			{}, //options
			//editOptions,
			//addOptions,
			//delOptions,
			{} // search options
	);

});
