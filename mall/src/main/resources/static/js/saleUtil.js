
//원가와 세일가격을 받아 할인율을 계산해주는 함수
function setSalerate(origin, sale, saletag){
	let gap = origin - sale;
	let salerate = gap / origin * 100;
	salerate = Math.floor(salerate);
	
	saletag.innerHTML = '-' + salerate + '% ';
}


//세일 종료일에 맞춰 타이머를 생성해주는 함수
function setTimer(endTime, timer){
	let end = new Date(endTime);
	
	let second = 1000;
	let minute = second * 60;
	let hour = minute * 60;
	let day = hour * 24;
	let t;
	
	function countdown(){
		let now = new Date();
		let remain = end - now;
		
		if(remain < 0){
			clearInterval(t);
			timer.innerHTML = '세일 종료';
			
			return;
		}
		
		let days = Math.floor(remain / day);
		let hours = Math.floor((remain % day)/ hour);
		let minutes = Math.floor((remain % hour) / minute);
		let seconds = Math.floor((remain % minute) / second);
		
		timer.innerHTML = days + '일 ';
		timer.innerHTML += hours + '시간 ';
		timer.innerHTML += minutes + '분 ';
		timer.innerHTML += seconds + '초 ';
		
	}
	
	t = setInterval(countdown, 1000);
}


let originList = document.getElementsByClassName('sale-origin-price');
let saleList = document.getElementsByClassName('sale-price');
let saletagList = document.getElementsByClassName('sale-rate');

for(var i = 0; i < originList.length; i++){
	setSalerate(originList[i].getAttribute('value'), 
				saleList[i].getAttribute('value'),
				saletagList[i]);
}


let timerList = document.getElementsByClassName("sale-timer");
let endDateList = document.getElementsByClassName("sale-endDate");

for(var i = 0; i < timerList.length; i++){
	setTimer(endDateList[i].getAttribute('value'), timerList[i]);
}
