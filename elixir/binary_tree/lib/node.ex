defmodule NodeBT do
  defstruct value: nil , esq: nil , dir: nil

  def new(value) do
    %__MODULE__{ value: value}
  end
end
