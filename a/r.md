```js
// vaild 함수
let  valid = {
    // init 함수 
    init : function (){
        let _this = this;
	    $('#ship1').on('click',function(){
            _this.ship1();
	    });

	    $('#ship2').on('click',function(){
			_this.ship2();
	    })
		$('#payment').on('click',function(){
			_this.payment();		
		})
    },

valid.init();
```


 