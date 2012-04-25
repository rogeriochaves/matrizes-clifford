# encoding: utf-8
def somar(a, b)
	c = []
	for i in 0...(a.size)
		c << []
		for p in 0...(a[0].size)
			c[i] << a[i][p] + b[i][p]
		end
	end
	c
end

def subtrair(a, b)
	c = []
	for i in 0...(a.size)
		c << []
		for p in 0...(a[0].size)
			c[i] << a[i][p] - b[i][p]
		end
	end
	c
end

def multiplicar_por_escalar(a, e)
	c = []
	for i in 0...(a.size)
		c << []
		for p in 0...(a[0].size)
			c[i] << a[i][p] * e
		end
	end
	c
end

def multiplicar_matrizes(a, b)
	c = []
	for i in 0...(a.size)
		c << []
		for p in 0...(a.size)
			r = 0
			for k in 0...(a[0].size)
				r += a[i][k] * b[k][p]
			end
			c[i] << r
		end
	end
	c
end

def fat(n)
	for i in 1...n
		n *= i
	end
	n
end

def permutacao(n)
	base = (1..n).to_a
	max = fat(n)
	r = []
	limites = []
	for i in 0...n
        limites[i] = [fat(n - 1 - i), 1].max
    end

	for i in 0...max
		r << []
	end

	indice = 0
	linha = 0

	for col in 0...n
		for i in 0...(max / limites[col])
			anteriores = []
			for y in 0...col
				anteriores.push(r[linha][y])
			end
			for k in 0...(limites[col])
				atual = r[linha]
				if atual.include?(base[indice])
					begin
						indice = (indice == (n - 1) ? 0 : indice + 1)
					end while atual.include?(base[indice])
				end
				r[linha][col] = base[indice]
				linha += 1
			end
			if limites[col] > 1
				(n - col - 1).times do
					begin 
						indice += 1
						indice = indice - n if indice >= n
					end while anteriores.include?(base[indice])
				end
			else
				indice += 1
				indice = indice - n if indice >= n
			end
			
		end
		linha = 0
	end
	r
end

def determinante(matriz)
	d = 0
	colunas = matriz[0].size
	permuta = permutacao(colunas)
	for k in 0...permuta.size
		aux = (-1) ** k
		for i in 0...colunas
			aux *= matriz[i][permuta[k][i] - 1]
		end
		d += aux
	end
	return d
end

def matriz_cofatorial(matriz)
	colunas = matriz.size
	cof = []
	for k in 0...colunas
		cof << []
		for i in 0...colunas
			aux = []
			for l in 0...colunas
				aux << [] if l != k
				for j in 0...colunas
					if l != k and i != j
						pos = l > k ? l - 1 : l
						aux[pos] << matriz[l][j]
					end
				end
			end
			cof[k][i] = determinante(aux) * (-1) ** (k + i)
		end
	end
	return cof
end

begin
	begin
		op = 0
		while op < 1 or op > 6
			puts "=======================\nEscolha uma opção: \n 1- Somar Matrizes \n 2- Subtrair Matrizes \n 3- Multiplicar por um Escalar \n 4- Multiplicar Matrizes \n 5- Encontrar a Determinante \n 6- Encontrar a matriz cofatorial\n 7- Sair\n=======================\n"
			op = gets.to_i
		end

		puts "Insira a matriz A: (ex: [1,2][3,4] ) \n"
		a = eval("["+gets.gsub('][', '],[')+"]")
		raise "erro" if a.size == 0

		if op == 1 or op == 2 or op == 4
			puts "Insira a matriz B: (ex: [1,2][3,4] ) \n"
			b = eval("["+gets.gsub('][', '],[')+"]")
			raise "erro" if b.size == 0
		elsif op == 3
			puts "Insira o número escalar"
			e = gets.to_i
		end

		if op == 1 or op == 2
			if a[0].size != b[0].size or a.size != b.size
				puts "O número de colunas de A deve ser igual ao número de linhas de B"
				raise "erro"
			end
		end

		if op == 4 and a[0].size != b.size
			puts "O número de colunas de A deve ser igual ao número de linhas de B"
			raise "erro"
		end

		if op == 1
			puts "Resultado de A + B"
			puts somar(a,b).inspect
		end
		if op == 2
			puts "Resultado de A + B"
			puts subtrair(a,b).inspect
		end
		if op == 3
			puts "Resultado de A * #{e}"
			puts multiplicar_por_escalar(a,e).inspect
		end
		if op == 4
			puts "Resultado de A * B"
			puts multiplicar_matrizes(a,b).inspect
		end
		if op == 5
			puts "Determinante de A"
			puts determinante(a)
		end
		if op == 6
			puts "Matriz Cofatorial de A"
			puts matriz_cofatorial(a).inspect
		end
		break if op == 7
	rescue
		puts "Erro na leitura da matriz"
	end
	gets
end while true