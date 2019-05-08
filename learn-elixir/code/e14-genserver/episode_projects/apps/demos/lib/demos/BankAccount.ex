defmodule BankAccount do
  use GenServer
  @moduledoc """
  For the `GenServer` demo.
  """

  # 'client' functions
  def start(initial_balance \\ 0) when is_number(initial_balance) do
    {:ok, account} = GenServer.start(__MODULE__, initial_balance)
    account
  end

  def deposit(account, amount) when is_pid(account) and is_number(amount) do
    GenServer.cast(account, {:deposit, amount})
  end

  def withdraw(account, amount) when is_pid(account) and is_number(amount) do
    GenServer.cast(account, {:withdraw, amount})
  end

  def balance(account) when is_pid(account) do
    GenServer.call(account, :balance)
  end

  # GenServer callbacks -- 'server' functions
  def init(balance) do
    {:ok, balance}
  end

  def handle_cast({:deposit, amount}, balance) do
    {:noreply, balance + amount}
  end

  def handle_cast({:withdraw, amount}, balance) do
    {:noreply, balance - amount}
  end

  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end
end
