<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
  	 	 	  	
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
		    	 
		        $('#prodCode').val(result.prodCode);
		    	alert("저장되었습니다.");
		    	
		    } 
		});  
	} //end of if
	
}

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
                   <!--  <li class="active">
                        <a href="/orders/new">
                            <span class="glyphicon glyphicon-star offset-right" aria-hidden="true"></span>
                            <span class="hidden-xs">초기화</span>
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
                    </li> -->
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
										<input type="text" id="prodCode" name="prodCode" class="form-control" value="${prodVO.prodCode !=null ? prodVO.prodCode : param.prodCode}" readonly="readonly"/>
									</div>
									<div class="form-group">
										<label for="prodName" class="required">제품명</label> 
										<input type="text" id="prodName" name="prodName" class="form-control" value="${prodVO.prodName}" maxlength="15"/>
									</div>
									<div class="form-group">
										<label for="manufacturer" class="required">제조사</label> 
										<input type="text" id="manufacturer" name="manufacturer" class="form-control" value="${prodVO.manufacturer}" maxlength="15"/>
									</div>
									<div class="form-group">
										<label for="serialNo" class="required">시리얼번호</label> 
										<input type="text" id="serialNo" name="serialNo" class="form-control" value="${prodVO.serialNo}" maxlength="15"/>
									</div> 
									<div class="form-group">
										<label for="model" class="required">모델</label> 
										<input type="text" id="model" name="model" class="form-control" value="${prodVO.model}" maxlength="15"/>
									</div>  
									<div class="form-group">
										<label for="price" class="required">가격</label> 
										<input type="text" id="price" name="price" class="form-control" value="${prodVO.price != null ? prodVO.price : 0 }" maxlength="15" style="text-align: right" numberOnly>
									</div> 
									<div class="form-group">
										<label for="unitPrice" class="">단가</label> 
										<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="${prodVO.unitPrice != null ? prodVO.unitPrice : 0}"  maxlength="15" style="text-align: right" numberOnly/>
									</div> 
									<div class="form-group">
										<label for="prodDate" class="">제조일자</label> 
									    <div class="input-group date" data-onload-datetimepicker='{"locale": "kr", "format": "YYYY-M-D"}'>
									        <input type="text" class="form-control" id="prodDate" name="prodDate" value="${prodVO.prodDate}" />
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
										<input type="text" id="afService" name="afService" class="form-control" value="${prodVO.prodDate}" maxlength="15"/>
									</div>
									<div class="form-group">
										<label for="serialNo">Weight(g)</label> 
										<input type="text" id="weight" name="weight" class="form-control" value="${prodVO.weight != null ? prodVO.weight : 0 }" maxlength="15" style="text-align: right"/>
										<label for="model">Height(cm)</label> 
										<input type="text" id="height" name="height" class="form-control" value="${prodVO.height != null ? prodVO.height : 0}" maxlength="15" style="text-align: right"/>
									</div> 
									<div class="form-group">
										<label for="model">Input</label> 
										<input type="text" id="input" name="input" class="form-control" value="${prodVO.input}" maxlength="15"/>
										<label for="model">Output</label> 
										<input type="text" id="output" name="output" class="form-control" value="${prodVO.output}" maxlength="15"/>
									</div>  
									<div class="form-group">
										<label for="price">Interface</label> 
										<input type="text" id="interface" name="interface" class="form-control" value="" maxlength="15"/>
									</div> 
									<div class="form-group">
										<label for="unitPrice">부가기능</label> 
										<input type="text" id="addOns" name="addOns" class="form-control" value="${prodVO.addOns}" maxlength="15"/>
									</div> 
								</div>
							</div>
							<!-- .row -->
						</fieldset>
						<div class="form-group offset-right" style="float:right">
							<input type="button" class="btn btn-default btn-raised" value="초기화" id="btn_reset"/> 
							<input type="button" class="btn btn-primary btn-raised" value="저장" id="btn_save"/> 
							<a href="/prod">
							<input type="button" class="btn btn-danger btn-raised" value="취소"  id="btn_reset"/>
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
 