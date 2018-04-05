defmodule Calculus.Differential do
  @moduledoc """
  Implementations of the fundamental definitions, concepts, rules, and identities used in differential calculus.
  """

  @doc """
  Differentiates a term using the power rule.

  Returns the differentiated term in the format:

    `{coefficient, variable, exponent}`

  The derivative of a constant term is 0.

  The term  must be in the form ax^n. The `variable` must have a derivative of
  1, as it is not actually differentiated, as opposed to the chain rule which
  DOES differentiate the expression.

  ## Parameters

  - `coefficient` - Coefficient of the function; a real number
  - `variable` - Variable of the function; a binary
  - `exponent` - Exponent on the variable; a real number

  ## Examples

      # 3x^2
      iex> Calculus.Differential.power_rule(3, "x", 2)
      {6, "x", 1}

      # 3, or 3(x)^0
      iex> Calculus.Differential.power_rule(3, "x", 0)
      0

      # -3
  """
  def power_rule(coefficient, variable \\ "x", exponent) when is_number(coefficient) and is_binary(variable) and is_number(exponent) do
    if (exponent == 0) do
      0
    else
      {coefficient * exponent, variable, exponent - 1}
    end
  end

  @doc """
  Differentiates a composite function using the chain rule.

  Returns the differentiated composite function in the format:

    `{num_coef, poly_coef, inside_fun, exponent}`

  `poly_coef` and `inside_fun` are lists of individual terms:

    `{number, [<term1>, <term2>, ...], [<term1>, <term2>, ...], number}`

  Each `<term>` is in the form:

    `{coefficient, variable, exponent}`

  ## Parameters

  - `coefficient` - Coefficient of the function; a real number
  - `inside_fun` - Inside function; a `List` of terms in the form `{coefficient, variable, exponent}`
  - `exponent` - Exponent on the variable; a real number

  ## Examples

      # (2x^2 - 3x + 1)^11   ->   11(4x - 3)(2x^2 - 3x + 1)^10
      iex> Calculus.Differential.chain_rule(
      ...> 11, [{2, "x", 2}, {-3, "x", 1}, {1, "x", 0}], 11)
      {
        11,
        [{4, "x", 1}, {-3, "x", 0}],
        [{2, "x", 2}, {-3, "x", 1}, {1, "x", 0}],
        10
      }

      # 3x^2 - 4   ->   6x - 4
      iex> Calculus.Differential.chain_rule(1, [{3, "x", 2}, {-4, "x", 1}], 1)
      {1, [{6, "x", 1}, {-4, "x", 0}], [{3, "x", 2}, {-4, "x", 1}], 0}
  """
  def chain_rule(coefficient, inside_fun, exponent) when is_number(coefficient) and is_list(inside_fun) and is_number(exponent) do
    # NOTE: If exponent == 1, the resulting poly_coef will always equal 1. Therefore,
    #       this calculation can be discarded, but information will be lost.
    poly_coef = inside_fun
                |> Enum.map(fn({coef, var, exp}) -> power_rule(coef, var, exp) end)
                |> Enum.reject(fn(term) -> term == 0 end)

    {exponent, poly_coef, inside_fun, exponent - 1}
  end
end
