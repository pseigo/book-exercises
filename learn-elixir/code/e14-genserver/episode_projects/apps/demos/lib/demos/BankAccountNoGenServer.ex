defmodule BankAccountNoGenServer do
  defstruct balance: 0
  @moduledoc """
  For the `GenServer` demo. Showing a better solution than using `GenServer`.
  """

  def new(balance \\ 0) do
    %__MODULE__{balance: balance}
  end

  def deposit(account, amount) do
    %{account | balance: account.balance + amount}
  end

  def withdraw(account, amount) do
    %{account | balance: account.balance - amount}
  end

  def balance(account) do
    account.balance
  end
end
