# Exercícios sobre Listas II
defmodule Lista1 do

  # 1
  def membro(_elemento, []) do
    false
  end
  def membro(elemento, [x | xs]) do
    if elemento == x do
      true
    else
      Lista1.membro(elemento, xs)
    end
  end

  # 2
  def membroNum(_elemento, []) do
    0
  end
  def membroNum(elemento, [x | xs]) do
    count = if elemento == x do
        1
    else
        0
   end
    count + Lista1.membroNum(elemento, xs)
  end

  # 3
  def membro2(elemento, lista), do: Lista1.membroNum(elemento, lista) != 0

  # 4 os elementos acabam todos na lista pq ele vai cortando os anteriores
  def unico([]), do: []
  def unico([x | xs]) do
    if Lista1.membroNum(x, xs) == 0 do
      [x | Lista1.unico(xs)]
    else
      Lista1.unico(xs)
    end
  end

  # 5
  def menores(_elemento, []), do: []
  def menores(elemento, [x | xs]) do
    if x < elemento do
      [x | Lista1.menores(elemento, xs)]
    else
      Lista1.menores(elemento, xs)
    end
  end

  def maiores(_elemento, []), do: []
  def maiores(elemento, [x | xs]) do
    if x >= elemento do
      [x | Lista1.maiores(elemento, xs)]
    else
      Lista1.maiores(elemento, xs)
    end
  end

  def quickSort([]), do: []
  def quickSort([x | xs]) do
    menoresLista = Lista1.menores(x, xs)
    maioresLista  = Lista1.maiores(x, xs)
    Lista1.quickSort(menoresLista) ++ [x] ++ Lista1.quickSort(maioresLista)
  end


end

# Exercícios sobre Listas III
defmodule Lista2 do

  # 1
  def pegaPosicao(_posicao, []), do: []
  def pegaPosicao(1, [x | _xs]), do: x
  def pegaPosicao(posicao, [_x | xs]), do: Lista2.pegaPosicao(posicao - 1, xs)

  # 2
  def pega(_posicao, []), do: []
  def pega(0, _lista), do: []
  def pega(posicao, [x | xs]), do: [x | Lista2.pega(posicao - 1, xs)]

  # 3
  def retira(_posicao, []), do: []
  def retira(0, lista), do: lista
  def retira(posicao, [_x | xs]), do: Lista2.retira(posicao - 1, xs)

  # 4
  def somaLista([]), do: 0
  def somaLista([x | xs]), do: x + Lista2.somaLista(xs)

  def tamanhoLista([]), do: 0
  def tamanhoLista([_x | xs]), do: 1 + Lista2.tamanhoLista(xs)

  def mediaLista([]), do: 0
  def mediaLista(xs), do: Lista2.somaLista(xs) / Lista2.tamanhoLista(xs)

  # 5
  def pegaMaior([x]), do: x
  def pegaMaior([x | xs]) do
    if x > Lista2.pegaMaior(xs) do
      x
    else
      Lista2.pegaMaior(xs)
    end
  end

  def retiraElemento(_elemento, []), do: []
  def retiraElemento(elemento, [x | xs]) do
    if elemento == x do
      Lista2.retiraElemento(elemento, xs)
    else
      [x | Lista2.retiraElemento(elemento, xs)]
    end
  end

  def pegaMaiores(_n, []), do: []
  def pegaMaiores(0, _lista), do: []
  def pegaMaiores(n, lista) do
    [Lista2.pegaMaior(lista) | Lista2.pegaMaiores(n - 1, Lista2.retiraElemento(Lista2.pegaMaior(lista), lista))]
  end

  # 6
  def contaMaiores(_elemento, []), do: 0
  def contaMaiores(elemento, [x | xs]) do
    if x > elemento do
      1 + Lista2.contaMaiores(elemento, xs)
    else
      Lista2.contaMaiores(elemento, xs)
    end
  end

  # 7
  def intercala([], lista2), do: lista2
  def intercala(lista1, []), do: lista1
  def intercala([x | xs], [y | ys]), do: [x, y | Lista2.intercala(xs, ys)]

  # 8
  def dupli([]), do: []
  def dupli([x | xs]), do: [x] ++ [x] ++ Lista2.dupli(xs)

  # 9
  def repliN(0, _elemento), do: []
  def repliN(n, elemento), do: [elemento] ++ Lista2.repliN(n - 1, elemento)

  def repli(_n, []), do: []
  def repli(n, [x | xs]), do: Lista2.repliN(n, x) ++ Lista2.repli(n, xs)

  # 10
  def dropEveryN(_n, _count, []), do: []
  def dropEveryN(n, 1, [_x | xs]), do: Lista2.dropEveryN(n, n, xs)
  def dropEveryN(n, count, [x | xs]), do: [x] ++ Lista2.dropEveryN(n, count - 1, xs)

  def dropEvery(n, lista), do: Lista2.dropEveryN(n, n, lista)

  # 11 Nao funcionou
  def split(_n, []), do: []
  def split(0, lista), do: [lista]
  def split(n, [x | xs]), do: [x] ++ Lista2.split(n - 1, xs)


end

# Exercícios sobre tuplas
defmodule Lista3 do

  # 1
  def somaQuadrupla({a, b, c, d}) do
    a + b + c + d
  end

  # 2
  def somaTuplas({a, b}, {c, d}) do
    a + b + c + d
  end

  # 3
  def zipp([], _lista2), do: []
  def zipp(_lista1, []), do: []
  def zipp([x | xs], [y | ys]), do: [{x, y}] ++ Lista3.zipp(xs, ys)

  # 4
  def zipp3([], _lista2, _lista3), do: []
  def zipp3(_lista1, [], _lista3), do: []
  def zipp3(_lista1, _lista2, []), do: []
  def zipp3([x | xs], [y | ys], [z | zs]), do: [{x, y, z}] ++ Lista3.zipp3(xs, ys, zs)

  # 5
  def unzipEsq([]), do: []
  def unzipEsq([{x, _} | xs]), do: [x | Lista3.unzipEsq(xs)]

  def unzipDir([]), do: []
  def unzipDir([{_, y} | ys]), do: [y | Lista3.unzipDir(ys)]

  def unzipp(lista), do: {Lista3.unzipEsq(lista), Lista3.unzipDir(lista)}


end
