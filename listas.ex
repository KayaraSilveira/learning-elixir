defmodule Lista1 do

  def osQuatroSaoIguais(a, b, c, d) do
    a == b && b == c && c == d
  end

  def osTresSaoIguais(a, b, c) do
    a == b && a == c
  end

  def quantosSaoIguais(a, b, c) do
    if a == b && a == c do
      3
    else
      if a == b || a == c || b == c do
        2
      else
        0
      end
    end
  end

  def todosDiferentes(a, b, c) do
    a != b && a != c && b != c
  end

  def quantosSaoIguais2(a, b, c) do
    if Lista1.todosDiferentes(a, b, c) do
      0
    else
      if Lista1.osTresSaoIguais(a, b, c) do
        3
      else
        2
      end
    end
  end

  def elevadoDois(a) do
    a * a
  end

  def elevadoQuatro(a) do
    Lista1.elevadoDois(a) * Lista1.elevadoDois(a)
  end

  def vendas(a) do
    a * 2
  end

  def vendaTotal(a) do
    if a == 0 do
      0
      else
        Lista1.vendas(a) + Lista1.vendaTotal(a - 1)
    end
  end

end

defmodule Lista2 do

  def maxi(a, b) do
    if a > b do
      a
    else
      b
    end
  end

  def maiorVenda(n) do
    if n == 0 do
      Lista1.vendas(1)
    else
      Lista2.maxi(Lista1.vendas(n), Lista2.maiorVenda(n - 1))
    end
  end

  def maxVenda(n) do
    if Lista2.maiorVenda(n) == Lista1.vendas(n) do
      n
    else
      Lista2.maxVenda(n - 1)
    end
  end

  def zeroVendas(n) do
    if n == 0 do
      -1
    else
      if Lista1.vendas(n) == 0 do
        n
      else
        Lista2.zeroVendas(n - 1)
      end
    end
  end

  def achaSemana(s, n) do
    if n == 0 do
      -1
    else
      if Lista1.vendas(n) == s do
        n
      else
        Lista2.achaSemana(s, n - 1)
      end
    end
  end

  def zeroVendas2(n) do
    Lista2.achaSemana(0, n)
  end

  def maiorVenda2(m, n) do
    if n == m do
      Lista1.vendas(m)
    else
      Lista2.maxi(Lista1.vendas(n), Lista2.maiorVenda(n - 1))
    end
  end

  def maxVenda2(m, n) do
    if Lista2.maiorVenda(m, n) == Lista1.vendas(n) do
      n
    else
      Lista2.maxVenda2(m, n - 1)
    end
  end

  def zeroVendas2(m, n) do
    if n == m do
      -1
    else
      if Lista1.vendas(n) == 0 do
        n
      else
        Lista2.zeroVendas2(m, n - 1)
      end
    end
  end

  def achaSemana2(s, m, n) do
    if n == m do
      -1
    else
      if Lista1.vendas(n) == s do
        n
      else
        Lista2.achaSemana2(s, m, n - 1)
      end
    end
  end

  def fatorial(n) do
    if n == 1 do
      1
    else
      n * Lista2.fatorial(n - 1)
    end
  end

  def produto(m, n) do
    if n == m do
      m
    else
      n * Lista2.produto(m, n - 1)
    end
  end

  def fib(n) do
    if n == 0 do
      0
    else
      if n == 1 do
        1
      else
        Lista2.fib(n - 1) + Lista2.fib(n - 2)
      end
    end
  end

end

defmodule Lista3 do

  def somaTuplas({a, b}, {c, d}) do
    a + b + c + d
  end

  def shift({a, b}, c) do
    {a, {b, c}}
  end

  def minEmax(a, b, c) do
    min = min(a, min(b, c))
    max = max(a, max(b, c))
    {min, max}
  end

  def zeroVendas(n) do
    if n == 0 do
      {false, -1}
    else
      if Lista1.vendas(n) == 0 do
        {true, n}
      else
        Lista3.zeroVendas(n - 1)
      end
    end
  end

  # ESTA PRÓXIMA NAO ENTENDI SE DEVERIA SER DESSA FORMA
  def retornaTitulo({titulo, _autor, _isbn}) do
    titulo
  end
  def retornaAutor({_titulo, autor, _isbn}) do
    autor
  end
  def retornaIsbn({_titulo, _autor, isbn}) do
    isbn
  end

end

defmodule Lista4 do

  def dobraLista([]), do: []
  def dobraLista([x | xs]), do: [x * 2 | Lista4.dobraLista(xs)]

  def tamanho([]), do: 0
  def tamanho([_x | xs]), do: 1 + Lista4.tamanho(xs)

  def produtoLista([]), do: 1
  def produtoLista([x | xs]), do: x * Lista4.produtoLista(xs)

  def andLista([]), do: true
  def andLista([x | xs]), do: x && Lista4.andLista(xs)

  def concatLista([]), do: []
  def concatLista([x | xs]), do: x ++ Lista4.concatLista(xs)

  def inverteLista([]), do: []
  def inverteLista([x | xs]), do: Lista4.inverteLista(xs) ++ [x]

end
