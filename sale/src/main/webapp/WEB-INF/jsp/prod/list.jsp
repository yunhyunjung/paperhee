<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>

<script>
	$.jgrid.defaults.width = 1130;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
	
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
 				<!-- <div id="jqGridPager"></div> -->

				<!-- //데이터가 없을 경우 메세지를 띄울 태그 -->
				<div id="NoData"></div>
				
				<!-- // 그리드에 적용되있는 페이징 태그 -->
				<div id="pager"></div>     
				
				<!-- // 새롭게 구현할 커스텀 페이징 태그 -->
				<div id="paginate"></div>

 			</fieldset>

			<div class="form-group offset-right" style="float:right">
				<a href="/prod/view">
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
/*      	pager: '#jqGridPager',
        rownumbers: true, // show row numbers
        rownumWidth: 35, // the width of the row numbers columns
        rowNum: 10,
		rowList: [10,20,50],  */
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
    	},
    	loadComplete : function(data){  
			
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
		    	
/* 		    	// 그리드 데이터 총 갯수
		        var allRowsInGrid = jQuery('#jqGrid').jqGrid('getGridParam','records');
	            
				// 데이터가 없을 경우 (먼저 태그 초기화 한 후에 적용)
				$("#NoData").html("");
				if(allRowsInGrid==0){
					$("#NoData").html("<br>데이터가 없습니다.<br>");
				}
				// 처음 currentPage는 널값으로 세팅 (=1)
				initPage("jqGrid",allRowsInGrid,""); */
				
				
		    }, // 요청 완료 시
		    error: function(result) {

		    }, // 요청 실패.
		    complete: function(jqXHR) {} // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		});  
    }
    
    //상세조회
    function fn_view(prodCode){
    	var url = "/prod/view?prodCode="+prodCode;
    	$(location).attr('href', url);
    }
    
  //그리드 페이징 
    function initPage(gridId,totalSize,currentPage){
	  
	   alert(totalSize);
    	
    	// 변수로 그리드아이디, 총 데이터 수, 현재 페이지를 받는다
    	if(currentPage==""){
    		var currentPage = $('#'+gridId).getGridParam('page');
    	}
    	// 한 페이지에 보여줄 페이지 수 (ex:1 2 3 4 5)
    	var pageCount = 10;
    	// 그리드 데이터 전체의 페이지 수
    	var totalPage = Math.ceil(totalSize/$('#'+gridId).getGridParam('rowNum'));
    	// 전체 페이지 수를 한화면에 보여줄 페이지로 나눈다.
    	var totalPageList = Math.ceil(totalPage/pageCount);
    	// 페이지 리스트가 몇번째 리스트인지
    	var pageList=Math.ceil(currentPage/pageCount);
    	
    	alert("currentPage="+currentPage+"/ totalPage="+totalSize);
    	alert("pageCount="+pageCount+"/ pageList="+pageList);
    	
    	// 페이지 리스트가 1보다 작으면 1로 초기화
    	if(pageList<1) pageList=1;
    	// 페이지 리스트가 총 페이지 리스트보다 커지면 총 페이지 리스트로 설정
    	if(pageList>totalPageList) pageList = totalPageList;
    	// 시작 페이지
    	var startPageList=((pageList-1)*pageCount)+1;
    	// 끝 페이지
    	var endPageList=startPageList+pageCount-1;
    	
    	//alert("startPageList="+startPageList+"/ endPageList="+endPageList);
    	
    	// 시작 페이지와 끝페이지가 1보다 작으면 1로 설정
    	// 끝 페이지가 마지막 페이지보다 클 경우 마지막 페이지값으로 설정
    	if(startPageList<1) startPageList=1;
    	if(endPageList>totalPage) endPageList=totalPage;
    	if(endPageList<1) endPageList=1;
    	
    	// 페이징 DIV에 넣어줄 태그 생성변수 
    	var pageInner="";
    	
    	// 페이지 리스트가 1이나 데이터가 없을 경우 (링크 빼고 흐린 이미지로 변경)
    	if(pageList<2){
    		
    		pageInner+="[처음]";
    		pageInner+="[이전]";
    		
    	}
    	// 이전 페이지 리스트가 있을 경우 (링크넣고 뚜렷한 이미지로 변경)
    	if(pageList>1){
    		
    		pageInner+="<a class='first' href='javascript:firstPage()'>[처음]</a>";
    		pageInner+="<a class='pre' href='javascript:prePage("+totalSize+")'>[이전]</a>";
    		
    	}
    	// 페이지 숫자를 찍으며 태그생성 (현재페이지는 강조태그) 
    	for(var i=startPageList; i<=endPageList; i++){
    		if(i==currentPage){
    			pageInner = pageInner +"<a href='javascript:goPage("+(i)+")' id='"+(i)+"'><strong>"+(i)+"</strong></a> ";
    		}else{
    			pageInner = pageInner +"<a href='javascript:goPage("+(i)+")' id='"+(i)+"'>"+(i)+"</a> ";
    		}
    		
    	}
    	//alert("총페이지 갯수"+totalPageList);
    	//alert("현재페이지리스트 번호"+pageList);
    	
    	// 다음 페이지 리스트가 있을 경우
    	if(totalPageList>pageList){
    		
    		pageInner+="<a class='next' href='javascript:nextPage("+totalSize+")'>[다음]</a>";
    		pageInner+="<a class='last' href='javascript:lastPage("+totalPage+")'>[마지막]</a>";
    	}
    	// 현재 페이지리스트가 마지막 페이지 리스트일 경우
    	if(totalPageList==pageList){
    		
    		pageInner+="[다음]";
    		pageInner+="[마지막]";
    	}   
    	//alert(pageInner);
    	// 페이징할 DIV태그에 우선 내용을 비우고 페이징 태그삽입
    	$("#paginate").html("");
    	$("#paginate").append(pageInner);
    	
    }

    // 그리드 첫페이지로 이동 
    function firstPage(){
    		
    		$("#jqGrid").jqGrid('setGridParam', {
    							page:1
    						}).trigger("reloadGrid");
    		
    }
    // 그리드 이전페이지 이동 
    function prePage(totalSize){
    		
    		var currentPage = $('#jqGrid').getGridParam('page');
    		var pageCount = 10;
    		
    		currentPage-=pageCount;
    		pageList=Math.ceil(currentPage/pageCount);
    		currentPage=(pageList-1)*pageCount+pageCount;
    		
    		initPage("jqGrid",totalSize,currentPage);
    		
    		$("#jqGrid").jqGrid('setGridParam', {
    							page:currentPage
    						}).trigger("reloadGrid");
    		
    }
    // 그리드 다음페이지 이동 	
    function nextPage(totalSize){
    		
    		var currentPage = $('#jqGrid').getGridParam('page');
    		var pageCount = 10;
    		
    		currentPage+=pageCount;
    		pageList=Math.ceil(currentPage/pageCount);
    		currentPage=(pageList-1)*pageCount+1;
    		
    		initPage("jqGrid",totalSize,currentPage);
    		
    		$("#jqGrid").jqGrid('setGridParam', {
    							page:currentPage
    						}).trigger("reloadGrid");
    }
    // 그리드 마지막페이지 이동 
    function lastPage(totalSize){
    		
    		$("#jqGrid").jqGrid('setGridParam', {
    							page:totalSize
    						}).trigger("reloadGrid");
    }
    // 그리드 페이지 이동 
    function goPage(num){
    		
    		$("#jqGrid").jqGrid('setGridParam', {
    							page:num
    						}).trigger("reloadGrid");
    		
    }
</script>

</body>
</html>