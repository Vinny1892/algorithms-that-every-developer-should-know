defmodule BinaryTree do
  defstruct root: %NodeBT{} , current: %NodeBT{}
  @moduledoc """
  Documentation for BinaryTree.
  """

  @doc """
  Create new empty binary tree and return.

  ## Examples

      iex> BinaryTree.new()
      %BinaryTree{}

  """

  def new() do
    %__MODULE__{}
  end

  def insert( %BinaryTree{}=tree , value) do
    insert(tree.root , tree , value)
  end

  def insert( %NodeBT{}= node , %BinaryTree{} = tree , value)  do
    IO.inspect(node)
    cond  do
      node == %NodeBT{} -> %__MODULE__{ root: NodeBT.new(value) , current: NodeBT.new(value) }
      node.value > value  &&  node.esq  === nil && value !== nil ->
        %__MODULE__{ tree | current: %NodeBT{ node | esq: NodeBT.new(value) } }
      node.value < value && node.dir  === nil && value !== nil->
        %__MODULE__{ tree | current: %NodeBT{ node | dir: NodeBT.new(value) } }
      node.value > value ->
          insert(node.dir ,value)
        node.value < value ->
          insert(node.esq,value)
    end
  end


end
