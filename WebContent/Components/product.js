$(document).ready(function() {  
	
	if ($("#alertSuccess").text().trim() == "")  {   
		$("#alertSuccess").hide(); 
		}  
	$("#alertError").hide(); 
		}); 
 
// SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) {  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 

 
 // Form validation-------------------  
var status = validateProductForm(); 

if (status != true)  {   
	$("#alertError").text(status);   
	$("#alertError").show(); 
	return; 
	 
}

var type = ($("#hidProductIDSave").val() == "") ? "POST" : "PUT"; 

$.ajax(  
		{   
			url : "ProductsAPI",   
			type : type,   
			data : $("#formProduct").serialize(),   
			dataType : "text",   
			complete : function(response, status)   {    
				
				onItemSaveComplete(response.responseText, status);   
			}  
		
		}); 
//$("#formItem").submit();
}); 


 
 // If valid------------------------  

$(document).on("click", ".btnRemove", function(event) {  
	$.ajax(  {  
	url : "ProductsAPI",   type : "DELETE",   data : "productID=" + $(this).data("productID"),   
	dataType : "text",   complete : function(response, status)   {   
		onItemDeleteComplete(response.responseText, status);   
		
	}  
	
	}); 
	
}); 



 
// UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) {     
	$("#hidProductIDSave").val($(this).closest("tr").find('#productID').val());     
	$("#productCode").val($(this).closest("tr").find('td:eq(0)').text());     
	$("#productName").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#productPrice").val($(this).closest("tr").find('td:eq(2)').text());
	$("#researcherName").val($(this).closest("tr").find('td:eq(3)').text());    
	$("#productDesc").val($(this).closest("tr").find('td:eq(4)').text());
	
}); 
 
// CLIENT-MODEL================================================================
function validateProductForm() {  // CODE  
	if ($("#productCode").val().trim() == "")  {  
		return "Insert product Code.";
		} 

 
 // NAME  
if ($("#productName").val().trim() == "")  {  
	return "Insert Product Name.";  
	}
if ($("#productPrice").val().trim() == "")  {   
	return "Insert P Price."; 
	} 

// is numerical value  
var tmpPrice = $("#productPrice").val().trim();  
if (!$.isNumeric(tmpPrice))  {   
	return "Insert a numerical value for Item Price.";  
	} 

// convert to decimal price  
$("#productPrice").val(parseFloat(tmpPrice).toFixed(2)); 

// DESCRIPTION------------------------  
if ($("#ResearcherName").val().trim() == "")  {   
	return "Insert Researcher Name."; 
	}
if ($("#productDesc").val().trim() == "")  {   
	return "Insert Product Description."; 
	} 

return true; 

} 

function onProductSaveComplete(response, status) {  
	if (status == "success")  {   
		var resultSet = JSON.parse(response); 

if (resultSet.status.trim() == "success")   {    
	$("#alertSuccess").text("Successfully saved.");    
	$("#alertSuccess").show(); 

 $("#divItemsGrid").html(resultSet.data);  
 } else if (resultSet.status.trim() == "error")   {
	 $("#alertError").text(resultSet.data);    
	 $("#alertError").show();   
	 } 

} else if (status == "error")  { 
	$("#alertError").text("Error while saving.");   
	$("#alertError").show(); 
	} 
else  {   
		$("#alertError").text("Unknown error while saving..");   
		$("#alertError").show();  } 


$("#hidProductIDSave").val("");  $("formProduct")[0].reset(); 
} 