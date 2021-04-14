
let date = new Date();
let fDate = new Date();
fDate.setMonth(fDate.getMonth() + 1);

document.getElementById('startDate').value = date.toISOString().slice(0, 10);
document.getElementById('startDate').min = date.toISOString().slice(0, 10);
document.getElementById('endDate').value = fDate.toISOString().slice(0, 10);
document.getElementById('endDate').min= date.toISOString().slice(0, 10);

document.getElementById('startTime').value = date.toString().slice(16, 21);

function upAmount(obj){
		let id = obj.id;
		id = id.substring(id.indexOf('-')+1, id.length);
		let num = document.getElementById('amount-'+id);
		let price = document.getElementById('price-'+id);
		if(num.value < 100){
			num.value = Number(num.value) + 1;
			let str = '<fmt:formatNumber value="';
			str.append(num.value);
			str.append('" pattern="##,###"/>');
			price.innerHTML = str;
		}
	}