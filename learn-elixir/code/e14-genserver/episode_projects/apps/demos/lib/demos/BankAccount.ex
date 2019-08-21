defmodule BankAccount do
  use GenServer
  @moduledoc """
  For the `GenServer` demo.

  From the [docs](https://hexdocs.pm/elixir/GenServer.html#module-client-server-apis):

    "In practice, it is common to have both server and client functions in the
    same module. If the server and/or client implementations are growing
    complex, you may want to have them in different modules."
  """

  # Client functions
  def start(initial_balance \\ 0) when is_number(initial_balance) do
    {:ok, pid} = GenServer.start(__MODULE__, initial_balance)
    pid
  end

  def deposit(pid, amount) when is_pid(pid) and is_number(amount) do
    GenServer.cast(pid, {:deposit, amount})
  end

  def withdraw(pid, amount) when is_pid(pid) and is_number(amount) do
    GenServer.cast(pid, {:withdraw, amount})
  end

  def balance(pid) when is_pid(pid) do
    GenServer.call(pid, :balance)
  end

  # GenServer callbacks
  @impl true
  def init(balance) do
    {:ok, balance}
  end

  @impl true
  def handle_cast({:deposit, amount}, balance) do
    {:noreply, balance + amount}
  end

  @impl true
  def handle_cast({:withdraw, amount}, balance) do
    {:noreply, balance - amount}
  end

  @impl true
  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end
end
