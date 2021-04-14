function categoryChange(e) {
  let _product = ['상품 품질불량', '상품 조회', '상품 행사문의', '상품 기타사항'];
  let _delivery = ['오배송', '교환/환불', '배송누락', '배송 기타사항'];
  let target = document.getElementById("good");

  if(e.value == "product") var d = _product;
  else if(e.value == "delivery") var d = _delivery;
    
  target.options.length = 0;
 
	  for (x in d) {
	    var opt = document.createElement("option");
	    opt.value = d[x];
	    opt.innerHTML = d[x];
	    target.appendChild(opt);
	  } 
  }
    let good;
    let value1;
    
    document.getElementById("value1").onclick = function(){
        value1 = document.getElementById("value1").value;
        document.inquiry_form.cs_category_one.value = value1;
    }
    
    document.getElementById("good").onclick = function(){
         good = document.getElementById("good").value;
         document.inquiry_form.cs_category_two.value = good;
    }