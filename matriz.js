var somar = function(a, b){
	var c = [];
	for(i = 0, max = a.length; i < max; i++){
		c.push([]);
		for(p = 0, maxp = a[0].length; p < maxp; p++){
			c[i].push(a[i][p] + b[i][p]);
		}
	}
	return c;
}
var subtrair = function(a, b){
	var c = [];
	for(i = 0, max = a.length; i < max; i++){
		c.push([]);
		for(p = 0, maxp = a[0].length; p < maxp; p++){
			c[i].push(a[i][p] - b[i][p]);
		}
	}
	return c;
}
var multiplicar_por_escalar = function(a, e){
	var c = [];
	for(i = 0, max = a.length; i < max; i++){
		c.push([]);
		for(p = 0, maxp = a[0].length; p < maxp; p++){
			c[i].push(a[i][p] * e);
		}
	}
	return c;
}

var multiplicar_matrizes = function(a, b){
	var c = [], r = 0;
	for(i = 0, max = a.length; i < max; i++){
		c.push([]);
		for(p = 0, maxp = a.length; p < maxp; p++){
			r = 0;
			for(k = 0, maxk = a[0].length; k < maxk; k++){
				r += a[i][k] * b[k][p];
			}
			c[i].push(r);
		}
	}
	return c;
}

console.log("Soma de matrizes:");
console.log(somar( [[1, 2], [3, 4]], [[5, 6], [7,8]] ));

console.log("Subtração de matrizes:");
console.log(subtrair( [[1, 2], [3, 4]], [[5, 6], [7,8]] ));

console.log("Multiplicação por escalar:");
console.log(multiplicar_por_escalar( [[1, 2, 3]], 3 ));

console.log("Multiplicação de matrizes:");
console.log(multiplicar_matrizes( [[1, 2, 3]], [[4], [5], [6]] ));