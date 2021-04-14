
const track = document.querySelector('.track');
const slides = Array.from(track.children);
const leftBtn = document.querySelector('.arrow-left');
const rightBtn = document.querySelector('.arrow-right');
const dotIndicator = document.querySelector('.dot-indicator');
const dots = Array.from(dotIndicator.children);
const slideSize = slides[0].getBoundingClientRect();
const slideWidth = slideSize.width;

const slidePosition = (slide, index) => {
	slide.style.left = `${slideWidth * index}px`;
}
slides.forEach(slidePosition)

const slideToMove = (track, currentSlide, targetSlide) => {
	track.style.transform = `translateX(-${targetSlide.style.left})`;
	currentSlide.classList.remove('active');
	targetSlide.classList.add('active');
}


function updateDots(current, target){
	current.classList.remove('active');
	target.classList.add('active');
}

rightBtn.addEventListener('click', (e) => {
	let currentSlide = track.querySelector('.active')
	let currentDot = dotIndicator.querySelector('.active');
	let nextSlide;
	let nextDot;
	let nextIndex;
	if(currentSlide.nextElementSibling == null){
		nextSlide = slides[0];
		nextDot = dots[0];
		nextIndex = 0;
	}
	else{
		nextSlide = currentSlide.nextElementSibling;
		nextDot = currentDot.nextElementSibling;
		nextIndex = slides.findIndex(slide => slide === nextSlide)
	}

	slideToMove(track, currentSlide, nextSlide);
	updateDots(currentDot, nextDot);
	btnShowHide(nextIndex, leftBtn, rightBtn, slides);
	if(e.detail > 1) return;
});


leftBtn.addEventListener('click', (e) => {
	let currentSlide = track.querySelector('.active')
	let currentDot = dotIndicator.querySelector('.active');
	let prevSlide;
	let prevDot;
	let prevIndex;
	if(currentSlide.previousElementSibling == null){
		prevSlide = slides[3];
		prevDot = dots[3];
		prevIndex = 3;
	}
	else{
		prevSlide = currentSlide.previousElementSibling;
		prevDot = currentDot.previousElementSibling;
		prevIndex = slides.findIndex(slide => slide === prevSlide)
	}
	

	slideToMove(track, currentSlide, prevSlide);
	updateDots(currentDot, prevDot);
	btnShowHide(prevIndex, leftBtn, rightBtn, slides)
	if(e.detail > 1) return;
});


dotIndicator.addEventListener('click', (e) => {
	var targetDot = e.target.closest('.dot');
	if(!targetDot) return;
	
	var currentSlide = track.querySelector('.active');
	var currentDot = dotIndicator.querySelector('.active');
	var targetIndex = dots.findIndex(dot => dot === targetDot)
	var targetSlide = slides[targetIndex];

	slideToMove(track, currentSlide, targetSlide)
	updateDots(currentDot, targetDot);
	btnShowHide(targetIndex, leftBtn, rightBtn, slides)
	if(e.detail > 1) return;
});