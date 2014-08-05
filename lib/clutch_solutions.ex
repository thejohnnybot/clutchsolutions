defmodule ClutchSolutions do

  @doc """
  Fizzbuzz problem solution
  if n is a multiple of 5 output Fizz
  if n is a multiple of 7 output Buzz

  iex> ClutchSolutions.fizzbuzz 100
  """

  def fizzbuzz(0) do
    IO.puts "Done"
  end

  def fizzbuzz(n) do
    cond do
      rem(n, 5) == 0 ->
        IO.puts "Fizz"
        fizzbuzz(n - 1)
      rem(n, 7) == 0 ->
        IO.puts "Buzz"
        fizzbuzz(n - 1)
      n ->
        IO.puts Integer.to_string(n)
        fizzbuzz(n - 1)
    end
  end

  @doc """
  inputed number is raised to the power of itself
  its resulting numbers are then summed

  went down to erlang for math.pow

  iex> ClutchSolutions.pow_self 4
  256

  iex> ClutchSolutions.sum_of_result 4
  13
  """
  def pow_self(n) do
    :math.pow(n, n) |> trunc
  end

  def sum_of_result(n) do
    number_string = pow_self(n) |> Integer.to_string
    string_array = String.split number_string, "", trim: true
    int_array = Enum.map string_array, &(String.to_integer(&1))
    Enum.reduce int_array, 0, &+/2
  end


  @doc """
  Use common dict /usr/share/dict/words or another file
  Find and print the first 20 words that are anagrams of each other

  iex> ClutchSolutions.anagrams
  """
  def anagrams(file \\ "/usr/share/dict/words") do
    File.stream!(file)
    |> Enum.map(&String.strip/1)
    |> Enum.reduce(%{}, fn word, words ->
      Map.update(words, Enum.sort(String.graphemes(word)),
        [word], &[word | &1])
    end)
    |> Enum.map(&elem(&1, 1))
    |> Enum.slice 1..20
  end
  

  @doc """
  Use common dict /use/share/dict/words for another file

  Find the first 20 palindromes of more than 3 characters

  iex> ClutchSolutions.palindromes
  """
  def palindromes(file \\ "/usr/share/dict/words") do
    words = File.stream!(file)
    reverse_words = File.stream!(file)
    |> Enum.map(&String.strip/1)
    |> Enum.filter(&Enum.count(String.graphemes(&1)) > 2)
    |> Enum.map &String.reverse/1
  end

end
