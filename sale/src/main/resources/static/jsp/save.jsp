<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    
    <link rel="dns-prefetch" href="//fonts.googleapis.com" />
    <link rel="dns-prefetch" href="//themes.googleusercontent.com" />
    <link rel="dns-prefetch" href="https://www.google-analytics.com" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Product Info</title>

    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Titillium+Web:400,300,700&amp;subset=latin,latin-ext" type="text/css" />
    <link rel="stylesheet" href="../css/bootstrap-ui.css" type="text/css" />
    
    <link rel="stylesheet" type="text/css" media="screen" href="../vendor/jqgrid/css/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="../vendor/jqgrid/css/ui.multiselect.css" />
	
	<link rel="stylesheet" type="text/css" media="screen" href="../vendor/bootstrap/css/bootstrap.css">
	
	<link rel="stylesheet" type="text/css" media="screen" href="../vendor/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">

	<!-- <link rel="stylesheet" type="text/css" media="screen" href="../vendor/jqgrid/css/trirand/ui.jqgrid.css" /> -->
	<link rel="stylesheet" type="text/css" media="screen" href="../vendor/jqgrid/css/trirand/ui.jqgrid-bootstrap.css" />

    <!-- The $ library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="../vendor/jquery/jquery.js"></script> 
    
    <!-- $ ui  -->
    <script type="text/ecmascript" src="../vendor/jqgrid/js/jquery-ui.min.js"></script> 
    
    <!-- moment -->
    <script type="text/ecmascript" src="../vendor/bootstrap-datepicker/js/moment.js"></script> 	
     	
  	<!-- bootstrap min -->
 	<script type="text/ecmascript" src="../vendor/bootstrap/js/bootstrap.min.js"></script>
 	
 	<!--  bootstrap datetimepicker -->
	<script type="text/ecmascript" src="../vendor/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

 	<!-- $ grid -->
	<script type="text/ecmascript" src="../vendor/jqgrid/js/trirand/jquery.jqGrid.min.js"></script> 
	
	<!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="../vendor/jqgrid/js/trirand/i18n/grid.locale-kr.js"></script>
 
  	<script type="text/javascript" src="../js/bootstrap-ui.js"></script>
  	 	 	  	
<script type="text/javascript"> 
    

$(document).ready(function(){
	
	//저장
	$('#btn_save').on('click', function(e){
		fn_save();

	});
	
	//숫자만입력가능하게
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    
	    $(this).val($(this).val().replace( /\B(?=(\d{3})+(?!\d))/g, "," ));
	});
	

});   

function fn_checkVaildation(){
	
	var $form = $('#form');
	
	if (  $('#prodName').val() == "" ){
		alert("제품명을 입력하세요.");
		$('#prodName').focus();
		return false;
	}
	
	if (  $('#serialNo').val() == "" ){
		alert("시리얼번호를 입력하세요.");
		$('#serialNo').focus();
		return false;
	}	
	
	if (  $('#model').val() == "" ){
		alert("모델을 입력하세요.");
		$('#model').focus();
		return false;
	}	
	
	
	if (  $('#prodDate').val() == "" ){
		alert("제조일자를 입력하세요.");
		$('#prodDate').focus();
		return false;
	}	
	return true;

}


function fn_save(){
	
	if(fn_checkVaildation()){
		
		
		//숫자만입력가능하게
		$("input:text[numberOnly]").each(function() {
		    $(this).val($(this).val().replace(/\,/g,''));  //콤마제거
		     
		});
		
		var formData = JSON.stringify($('#form').serializeObject());
		
  		$.ajax({
		    url: '/prod/saveProd',
		    async: true,  
		    type: 'POST',  
		    data: formData,
		    dataType: 'json',  
		    contentType: "application/json",
		    success: function(result) {
		    	alert("저장되었습니다.");
		    	
		    } // 요청 완료 시
/* 		    error: function(jqXHR) {
		    	alert("falid");
		    	
		    }, // 요청 실패.
		    complete: function(jqXHR) {} // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출 */
		});  
	} //end of if
	
}

    
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
                    <span class="visible-xs visible-md visible-lg">Bootstrap UI Demo</span>
                    <span class="visible-sm" aria-hidden="true">BUI</span>
                </a>
            </div>
            <!-- Collapsible menu -->
            <div class="collapse navbar-collapse" id="mainMenu">
                <ul class="nav navbar-nav">
                   <li class="active">
                        <a href="prod/prodlist.html">
                            <span class="glyphicon glyphicon-inbox offset-right" aria-hidden="true"></span>
                            <span class="hidden-sm">Orders</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-align-left offset-right" aria-hidden="true"></span>
                            <span class="hidden-sm">Pages</span>
                        </a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
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
                    </li><!-- .dropdown -->
                </ul><!-- .nav -->
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
                    <li class="active">
                        <a href="/orders/new">
                            <span class="glyphicon glyphicon-star offset-right" aria-hidden="true"></span>
                            <span class="hidden-xs">New</span>
                        </a>
                    </li>
                    <li>
                        <a href="/orders/delivered">
                            <span class="glyphicon glyphicon-ok-sign offset-right" aria-hidden="true"></span>
                            <span class="hidden-xs">저장</span>
                        </a>
                    </li>
                    <li>
                        <a href="/orders/canceled">
                            <span class="glyphicon glyphicon-remove-sign offset-right" aria-hidden="true"></span>
                            <span class="hidden-xs">취소</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div><!-- .container -->
    	</section>

			<div class="section-content">
				<div class="container">
					<div class="row">
					<div class="col-md-10 col-md-offset-1">
					<form id="form" name="saveForm" action="">
						<fieldset class="offset-bottom">
							<legend>제품등록</legend>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="prodCode" class="required">제품코드</label> 
										<input type="text" id="prodCode" name="prodCode" class="form-control" value="${param.prodCode}" disabled="disabled"/>
									</div>
									<div class="form-group">
										<label for="prodName" class="required">제품명</label> 
										<input type="text" id="prodName" name="prodName" class="form-control" value="" maxlength="15"/>
									</div>
									<div class="form-group">
										<label for="manufacturer" class="required">제조사</label> 
										<input type="text" id="manufacturer" name="manufacturer" class="form-control" value="" maxlength="15"/>
									</div>
									<div class="form-group">
										<label for="serialNo" class="required">시리얼번호</label> 
										<input type="text" id="serialNo" name="serialNo" class="form-control" value="" maxlength="15"/>
									</div> 
									<div class="form-group">
										<label for="model" class="required">모델</label> 
										<input type="text" id="model" name="model" class="form-control" value="" maxlength="15"/>
									</div>  
									<div class="form-group">
										<label for="price" class="required">가격</label> 
										<input type="text" id="price" name="price" class="form-control" value="0" maxlength="10"  style="text-align: right" numberOnly/>
									</div> 
									<div class="form-group">
										<label for="unitPrice" class="">단가</label> 
										<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="0" maxlength="10" style="text-align: right" numberOnly/>
									</div> 
									<div class="form-group">
										<label for="prodDate" class="">제조일자</label> 
									    <div class="input-group date" data-onload-datetimepicker='{"locale": "kr", "format": "YYYY-M-D"}'>
									        <input type="text" class="form-control" id="prodDate" name="prodDate" value="" />
									        <span class="input-group-addon">
									            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
									        </span>
									    </div>
									</div>


									<div class="form-group">
										<label for="etc">기타</label> 
										<textarea id="etc" name="etc" class="form-control" rows="3"></textarea>										
									</div> 
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="prodName" class="">After Service</label> 
										<input type="text" id="afService" name="afService" class="form-control" value="" maxlength="15"/>
									</div>
									<div class="form-group">
										<label for="serialNo">Weight(g)</label> 
										<input type="text" id="weight" name="weight" class="form-control" value="0" maxlength="15"/>
										<label for="model">Height(cm)</label> 
										<input type="text" id="height" name="height" class="form-control" value="0" maxlength="15"/>
									</div> 
									<div class="form-group">
										<label for="model">Input</label> 
										<input type="text" id="input" name="input" class="form-control" value="" maxlength="15"/>
										<label for="model">Output</label> 
										<input type="text" id="output" name="output" class="form-control" value="" maxlength="15"/>
									</div>  
									<div class="form-group">
										<label for="price">Interface</label> 
										<input type="text" id="interface" name="interface" class="form-control" value="" maxlength="15"/>
									</div> 
									<div class="form-group">
										<label for="unitPrice">부가기능</label> 
										<input type="text" id="addOns" name="addOns" class="form-control" value="" maxlength="15"/>
									</div> 
								</div>
							</div>
							<!-- .row -->
						</fieldset>
						<div class="form-group offset-right" style="float:right">
							<input type="button" class="btn btn-primary btn-raised" value="저장" id="btn_save"/> 
							<a href="/prod/list.html">
							<input type="button" class="btn btn-danger btn-raised" value="Cancel"  id="btn_reset"/>
							</a>
						</div>
					</form>
				</div>
			</div>
			<!-- .row -->
		</div>
	</div>
</main>

</body>
</html>
