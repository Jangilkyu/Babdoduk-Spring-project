
//가격을 천단위로 문자열 포매팅
function priceFormat(price){
	let price_string = String(price);
	return price_string.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
