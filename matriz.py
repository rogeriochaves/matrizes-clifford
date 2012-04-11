# encoding: utf-8
def somar(a, b):
	c = []
	for i in range(len(a)):
		c.append([])
		for p in range(len(a[0])):
			c[i].append(a[i][p] + b[i][p])
	return c

def subtrair(a, b):
	c = []
	for i in range(len(a)):
		c.append([])
		for p in range(len(a[0])):
			c[i].append(a[i][p] - b[i][p])
	return c

def multiplicar_por_escalar(a, e):
	c = []
	for i in range(len(a)):
		c.append([])
		for p in range(len(a[0])):
			c[i].append(a[i][p] * e)
	return c

def multiplicar_matrizes(a, b):
	c = []
	for i in range(len(a)):
		c.append([])
		for p in range(len(a)):
			r = 0
			for k in range(len(a[0])):
				r += a[i][k] * b[k][p]
			c[i].append(r)
	return c

print "Soma de matrizes:"
print(somar( [[1, 2], [3, 4]], [[5, 6], [7,8]] ));

print "Subração de matrizes:"
print(subtrair( [[1, 2], [3, 4]], [[5, 6], [7,8]] ));

print "Multiplicação por escalar:"
print(multiplicar_por_escalar( [[1, 2, 3]], 3 ));

print "Multiplicação de matrizes:"
print(multiplicar_matrizes( [[1, 2, 3]], [[4], [5], [6]] ));