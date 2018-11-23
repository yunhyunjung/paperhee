<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html> 
<html>
<head>
    <meta charset="utf-8"/>
    
    <link rel="dns-prefetch" href="//fonts.googleapis.com" />
    <link rel="dns-prefetch" href="//themes.googleusercontent.com" />
    <link rel="dns-prefetch" href="https://www.google-analytics.com" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Product List</title>

    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Titillium+Web:400,300,700&amp;subset=latin,latin-ext" type="text/css" />
    <link rel="stylesheet" href="/resources/css/bootstrap-ui.css" type="text/css" />
    
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/vendor/jqgrid/css/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/vendor/jqgrid/css/ui.multiselect.css" />
	
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/vendor/bootstrap/css/bootstrap.css">
	
	<!-- <link rel="stylesheet" type="text/css" media="screen" href="../vendor/jqgrid/css/trirand/ui.jqgrid.css" /> -->
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/vendor/jqgrid/css/trirand/ui.jqgrid-bootstrap.css" />

    
        <!-- The $ library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="/resources/vendor/jquery/jquery.js"></script> 
    
    <!-- $ ui  -->
    <script type="text/ecmascript" src="/resources/vendor/jqgrid/js/jquery-ui.min.js"></script> 
    
    <!-- moment -->
    <script type="text/ecmascript" src="/resources/vendor/bootstrap-datepicker/js/moment.js"></script> 	
     	
  	<!-- bootstrap min -->
 	<script type="text/ecmascript" src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
 	
 	<!--  bootstrap datetimepicker -->
	<script type="text/ecmascript" src="/resources/vendor/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

 	<!-- $ grid -->
	<script type="text/ecmascript" src="/resources/vendor/jqgrid/js/trirand/jquery.jqGrid.min.js"></script> 
	
	<!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="/resources/vendor/jqgrid/js/trirand/i18n/grid.locale-kr.js"></script>
 
  	<script type="text/javascript" src="/resources/js/bootstrap-ui.js"></script>
  	
	<!-- js Zip -->
    <!-- <script type="text/ecmascript" src="../vendor/jszip/jszip.min.js"></script> -->
    <script type="text/javascript" language="javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    
	<script>
		$.jgrid.defaults.width = 1130;
		$.jgrid.defaults.responsive = true;
		$.jgrid.defaults.styleUI = 'Bootstrap';
	</script>

</head>
<body class="site has-navbar-fixed-top">

<header role="banner" id="top" class="site-header">
    <!-- Main navigation -->
    <nav class="navbar navbar-fixed-top navbar-primary">
        <div class="container">
            <!-- Brand and menu toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainMenu">
                    <span class="sr-only">Menu</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/orders/new" class="navbar-brand offset-right-large">
                    <span class="visible-xs visible-md visible-lg">Sales Management System</span>
                    <span class="visible-sm" aria-hidden="true">BUI</span>
                </a>
            </div>
            <!-- Collapsible menu -->
            <div class="collapse navbar-collapse" id="mainMenu">
                <ul class="nav navbar-nav">
                   <li class="active">
                        <a href="prod/prodlist.html">
                            <span class="glyphicon glyphicon-inbox offset-right" aria-hidden="true"></span>
                            <span class="hidden-sm">Products</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-align-left offset-right" aria-hidden="true"></span>
                            <span class="hidden-sm">Customer</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-align-left offset-right" aria-hidden="true"></span>
                            <span class="hidden-sm">Sales</span>
                        </a>
                    </li>
                </ul>
<!--                 <ul class="nav navbar-nav navbar-right">
                    <li class="navbar-icon">
                        <a href="#" target="_blank" title="Open in new tab">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                            <span class="visible-xs">Home</span>
                        </a>
                    </li>
                    <li class="navbar-icon">
                        <a href="#" title="Settings">
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            <span class="visible-xs">Settings</span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" title="My account">
                            <span class="glyphicon glyphicon-user offset-right" aria-hidden="true"></span>
                            <span class="visible-xs">My account</span>
                            <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">James Brown</li>
                            <li class="divider"></li>
                            <li>
                                <a href="/">
                                    <span class="glyphicon glyphicon-off offset-right icon-shift-down" aria-hidden="true"></span>
                                    Sign out
                                </a>
                            </li>
                        </ul>
                    </li>.dropdown
                </ul>.nav -->
            </div><!-- .collapsible -->
        </div><!-- .container -->
    </nav>
</header>

    <main role="main" class="site-content">
        <section class="section-header section-header-condensed">
        <div class="container">
            <h1 class="section-header-title">
                <span class="glyphicon glyphicon-inbox offset-right icon-shift-down text-muted" aria-hidden="true"></span>
                제품 정보
            </h1>
            <nav>
                <ul class="nav nav-tabs nav-tabs-header">
<!--
                    <li class="active">
                        <a href="/orders/new">
                            <span class="glyphicon glyphicon-star offset-right" aria-hidden="true"></span>
                            <span class="hidden-xs"></span>
                        </a>
                    </li>
                     <li>
                        <a href="/orders/delivered">
                            <span class="glyphicon glyphicon-ok-sign offset-right" aria-hidden="true"></span>
                            <span class="hidden-xs">Delivered</span>
                        </a>
                    </li>
                    <li>
                        <a href="/orders/canceled">
                            <span class="glyphicon glyphicon-remove-sign offset-right" aria-hidden="true"></span>
                            <span class="hidden-xs">Canceled</span>
                        </a>
                    </li> -->
                </ul>
            </nav>
        </div><!-- .container -->
    	</section>

	<div class="section-content">
	
		<div class="container">
			<!-- 검색조건 -->
			<div class="panel panel-default">
			    <div class="panel-heading panel-heading-extended">
						<form class="form-filter" name="searchForm" id="searchForm" action="">
						    <div class="row">
						        <div class="col-sm-2">
						           	<div class="form-group">
						                <label>제품코드</label>
						                <input type="text" class="form-control" id="prodCode" name="prodCode" value=""/>
						            </div>
						        </div>
						        <div class="col-sm-2">
						           	<div class="form-group">
						                <label>제품명</label>
						                <input type="text" class="form-control" id="prodName" name="prodName" value=""/>
						            </div>
						        </div>
						        <div class="col-sm-2">
						           	<div class="form-group">
						                <label>시리얼번호</label>
						                <input type="text" class="form-control" id="serialNo" name="serialNo" value=""/>
						            </div> 
						        </div> 
						        <div class="col-sm-2">
						           	<div class="form-group">
						                <label>모델</label>
						                <input type="text" class="form-control" id="model" name="model" value=""/>
						            </div> 
						        </div>
						        <div class="col-sm-2">
						           	<div class="form-group">
						                <label>제조사</label>
						                <input type="text" class="form-control" id="manufacturer" name="manufacturer" value=""/>
						            </div> 
						        </div> 
						        <div class="col-sm-2">
						            <div class="form-actions">
						                <button type="button" class="btn btn-default" id="btn_search">검색</button>
						            </div>
						        </div> 
						    </div><!-- .row -->
						</form> 
			    </div>
<!-- 			    <div class="panel-body">
			    	제품을 관리합니다.
			    </div> -->
			</div>
				
			<fieldset class="offset-bottom">
 				<table id="jqGrid"></table>
 				<div id="jqGridPager"></div>
 			</fieldset>

			<div class="form-group offset-right" style="float:right">
				<a href="/view">
					<input type="button" class="btn btn-primary btn-raised" value="제품등록" /> 
				</a>
					<input type="button" class="btn btn-success btn-raised" value="EXCEL" id="btn_export"/> 
					<input type="button" class="btn btn-accent btn-raised" value="제품삭제" id="btn_delete"/> 
				
			</div>
			
		</div><!-- //container End -->
	</div>
</main>


<script type="text/javascript"> 
    
    var lastsel3;
    $("#jqGrid").jqGrid({
    	//url :  "/prod/list",
    	//datatype: "json",
    	datatype: "local",
    	height: 350,
       	colNames:['제품코드','제품명','순번','시리얼번호', '모델', '제조사','가격', '일자', '편집'],
       	colModel:[
       		{
       			 name:'prodCode',     
       	         index:'prodCode',    
       	         width:120,  
       	         align: "center"
       	    },
    		{
       	    	name:'prodName',
       	    	index:'prodName',
       	    	width:150, 
       	    },
       	    {
       	    	name:'seq',
       	    	index:'seq',
       	    	width:50, 
       	    	sorttype:"integer",
       	    	hidden: true
       	    },
       		{
       	    	name:'serialNo',
       	    	index:'serialNo',
       	    	width:150
       	    },
       		{
       	    	name:'model',
       	    	index:'model',
       	    	width:150
       	    },
       	    {
       	    	name:'manufacturer',
       	    	index:'manufacturer',
       	    	width:150
       	    }, 		
       		{
       	    	name:'price',
       	    	index:'price',
       	    	width:150,
                formatter: 'integer',
                align: "right",
                formatoptions: { defaultValue: '0', thousandsSeparator: ',' },
                sorttype: "integer"
       	    }, 	
       		{
       	    	name:'prodDate',
       	    	index:'prodDate',
       	    	align: "center",
       	    	width:100
       	    },
       		{
       	    	name:'moreInfo',
       	    	index:'',
       	    	width:50,
       	    	align: "center",
       	    	formatter : function(cellValue, option){
       	    		return '<a href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>'
       	    	}
       	    }
       	],
     	pager: '#jqGridPager',
        rownumbers: true, // show row numbers
        rownumWidth: 35, // the width of the row numbers columns
        rowNum: 10,
		rowList: [10,20,50], 
        hoverrows: true,
        multiSort: true,
        multiselect: true ,
    	onSelectRow: function(id){
    		
    	},
    	onCellSelect : function(rowid, index, contents, event){
    		var cm = $(this).jqGrid('getGridParam', 'colModel');
    		if(cm[index].name =='moreInfo'){
    			var prodCode = $(this).jqGrid('getCell', rowid, 'prodCode')
    			fn_view(prodCode);
    		}
    	}
    });

    
    $(document).ready(function(){
    	
    	fn_select();
    	
    	//삭제버튼클릭
    	$('#btn_delete').on('click', function(e){
    		
    		var selectedDatas = [];
    		var selectedRowIds = $("#jqGrid").jqGrid('getGridParam', 'selarrrow');
    		
    		if ( selectedRowIds.length < 1 ){
    			alert("삭제대상을 선택하십시오.");
    			return false;
    		}
    		
    		$(selectedRowIds).each(function(e){
    			var $this = this;
    			var rowData = $('#jqGrid').jqGrid('getRowData', $this);
    			selectedDatas.push(rowData);
    		});
    		
    		var paramData = JSON.stringify(selectedDatas);
    		
      		$.ajax({
    		    url: '/prod/deleteProd',
    		    async: true,  
    		    type: 'POST',  
    		    data: paramData,
    		    dataType: 'json',  
    		    contentType: "application/json",
    		    success: function(result) {
    		    	alert("삭제되었습니다.");
    		    	fn_select();
    		    }  
    		});  
    	});
    	
    	//엑셀다운로드
		$("#btn_export").on("click", function(){
			
			$("#jqGrid").jqGrid("exportToExcel",{
				includeLabels : true,
				includeGroupHeader : true,
				includeFooter: true,
				fileName : "productList.xlsx",
				maxlength : 40 // maxlength for visible string data 
			})
		});
    	
    	
    	//검색버튼클릭
		$("#btn_search").on("click", function(){
			fn_select();
		});		
		

    }); 
    
    
    //조회
    function fn_select(){
    	
		$('#jqGrid').jqGrid('clearGridData');
		
		//searchForm
		var formData = JSON.stringify($('#searchForm').serializeObject());
		
  		$.ajax({
		    url: '/prod/list',
		    async: true, 
		    type: 'POST',  
		    data: formData,
		    dataType: 'json',  
		    contentType: "application/json",
		    beforeSend: function(jqXHR) {}, // 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
		    success: function(result) {
		    	 
		    	var data = result.rows;
		    	$(data).each(function(e){
		    		var row = this;
		    		//console.log(row);
		    		$("#jqGrid").jqGrid('addRowData',row.prodCode,row);
		    	});
		    }, // 요청 완료 시
		    error: function(result) {

		    }, // 요청 실패.
		    complete: function(jqXHR) {} // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		});  
    }
    
    //상세조회
    function fn_view(prodCode){
    	
    	var url = "/view?prodCode="+prodCode;
    	$(location).attr('href', url);
  
    }
</script>

</body>
</html>