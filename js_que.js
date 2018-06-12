Web Intervew

React vs Angular

two way binding
redux architecture
bind, call, apply
prototype (How inheritence works)
callbacks
Promise?

Javascript scope - hoisted

var text  = "outside"
function logIt(){
	console.log(text);
	var text = 'inside';
}

logIt();

var Counter = function(){
	this.c  = 0
	var add1 = function(){
		console.log(this.c)
		this.c++;
		return this.c;
	}

	this.addN = function(n){
		for(var i = 0; i < n; i++){
			add1();
		}
		return this.c;
	}
}

var x = new Counter()
console.log(x.addN(1))










var now = () => new Date().getTime()
var start = now();
function test(){
	if(true){
	setTimeout(() => console.log(now() - start), 2000);
	setTimeout(() => console.log(now() - start), 1000);
	var start = now();	
	}
}


typed script
es6
