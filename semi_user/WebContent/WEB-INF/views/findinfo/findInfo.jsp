<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/layout/header_pop.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
	
	//��� ��� ȣ�� �޼���
	function warningModal(content) {
		$(".modal-contents").text(content);
		$("#defaultModal").modal('show');
	}
	
	//���� ��� ȣ�� �޼���
	function successModal(content) {
		$(".modal-contents").text(content);
		$("#successModal").modal('show');
	}
	
	//���̵� ã�� ��ư Ŭ��
	$("#idFind").click(function() {
		
         var divEmail = $('#divEmail');
         var divPhone = $('#divPhone');

         //�̸��� �˻�
         if($('#counselorEmail').val()==""){
             warningModal("�̸����� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
              
             divEmail.removeClass("has-success");
             divEmail.addClass("has-error");
             $('#counselorEmail').focus();
             return false;
         }
         //�޴��� ��ȣ �˻�
         else if($('#counselorPhoneNumber').val()==""){
             warningModal("�޴��� ��ȣ�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
              
             divPhone.removeClass("has-success");
             divPhone.addClass("has-error");
             $('#counselorPhoneNumber').focus();
             return false;
         }
		// �Ѵ� �Է��� ���
         else{
			var counselorEmail = $("#counselorEmail").val();
			var counselorPhoneNumber = $("#counselorPhoneNumber").val();
	      	  $.ajax({
	        	  type: 'get',
	           	url: '/findinfo/findid', 
	           	data: {counselorEmail: counselorEmail,
	        		   counselorPhoneNumber : counselorPhoneNumber
	           	},
	           	dataType: "json",
	           	success: function(data) {
// 	         	  console.log(data.result + "�Դϴٶ���"); 
	        	   
	        		  // ����
	              	if(data.result == 1) {
	            		  successModal("���̵� ã�� ����! ������ Ȯ���� �ּ���!");
	        	 	    return false;
	              
	            	  }
	            	  // 0 : ����
	            	  else {
	            		  warningModal("��ϵ� ���̵� �����ϴ�!");
		        		  return false;
	             	 }
	           	}
	       	 });
       	  }
		});
	
	//��й�ȣ ã�� ��ư Ŭ��
	$("#pwFind").click(function() {
		
         var divName = $('#divName');
         var divId = $('#divId');
          
         //�̸� �˻�
         if($('#counselorName').val()==""){
             warningModal("�̸��� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
              
             divName.removeClass("has-success");
             divName.addClass("has-error");
             $('#counselorName').focus();
             return false;
         }
         
         //���̵� �˻�
         else if($('#counselorId').val()==""){
             warningModal("���̵� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
              
             divPhone.removeClass("has-success");
             divPhone.addClass("has-error");
             $('#counselorId').focus();
             return false;
         }
         
		// �Ѵ� �Է��� ���
         else{
			var counselorName = $("#counselorName").val();
			var counselorId = $("#counselorId").val();
	      	  $.ajax({
	        	  type: 'get',
	           	url: '/findinfo/findpw', 
	           	data: {counselorName: counselorName,
	           		counselorId : counselorId
	           	},
	           	dataType: "json",
	           	success: function(data) {
	         	  console.log(data.result + "�Դϴٶ���"); 
	        	   
	        		  // ����
	              	if(data.result == 1) {
	            		  successModal("�ӽ� ��й�ȣ�� ���� �Ǿ����ϴ�! ������ Ȯ���� �ּ���!");
	        	 	    return false;
	              
	            	  }

					// ����
	            	  else {
	            		  warningModal("��ϵ� ��й�ȣ�� �����ϴ�!");
		        		  return false;
	             	 }
	           	}
	       	 });
       	  }
		});
		
	//��� ��ư Ŭ���� �˾�â ������
	$("#findCancal").click(function(){
		
		window.close();
	})
	
	
	});
</script>

<!-- ��� ���â -->
<div class="modal fade" id="successModal">
	<div class="modal-dialog">
		<div class="modal-content panel-success">
			<div class="modal-header panel-heading">
				<h4 class="modal-title">���̵� ã�� ����!</h4>
			</div>
			<div class="modal-body">
				<p class="modal-contents"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ȯ��</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--// ��� ���â -->

<!-- ���� ���â -->
<div class="modal fade" id="defaultModal">
	<div class="modal-dialog">
		<div class="modal-content panel-danger">
			<div class="modal-header panel-heading">
				<h4 class="modal-title">���� �޽���</h4>
			</div>
			<div class="modal-body">
				<p class="modal-contents"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ȯ��</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--// ���� ���â -->


<!-- Page Content -->
	<div class="container" style="margin-bottom : 10%;">
		<!-- ���̵� ã�� -->
		<div  style="margin : 20%;">
			<h3>���̵� ã��</h3>
				<div class="form-group" id = "divEmail">
					<label for="counselorEmail">�̸���</label> <input type="email"
						class="form-control" id="counselorEmail" name = "counselorEmail"
						placeholder="�̸����� �Է��ϼ���">
				</div>
				<div class="form-group" id = "divPhone">
					<label for="counselorPhoneNumber">��ȭ��ȣ</label> <input type="text"
						class="form-control" id="counselorPhoneNumber" name = "counselorPhoneNumber"
						placeholder="010-1234-5678">
				</div>
				<button type="submit" id = "idFind" class="btn btn-default" style="background-color:#ccc; float:right;">ã��</button>
		</div>
		<!-- ��� ã�� -->
		<div style="margin : 20%;">
			<h3>��й�ȣ ã��</h3>
				<div class="form-group" id = "divName">
					<label for="counselorName">�̸�</label> <input type="text"
						class="form-control" id="counselorName" name = "counselorName"
						placeholder="������ �Է��ϼ���">
				</div>
				<div class="form-group" id = "divId">
					<label for="counselorId">���̵�</label> <input
						type="text" class="form-control" id="counselorId" name = "counselorId"
						placeholder="���̵�">
				</div>
				<button type="submit" id = "pwFind" class="btn btn-default" style="background-color:#ccc; float:right;">ã��</button>
		</div>
		
		<!-- ��� ��ư -->
		<div style="text-align:center;">
			<button id = "findCancal" class="btn btn-danger" style="background-color:#ccc;">���</button>
		</div>
	</div>
	<!-- /.container -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
