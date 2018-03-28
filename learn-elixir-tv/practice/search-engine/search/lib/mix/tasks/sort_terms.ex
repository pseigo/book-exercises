defmodule Mix.Tasks.SortTerms do
  @shortdoc "Sort test data for the exercise"

  @moduledoc """
  Sorts and prints the exercise's given search term data.

    mix sort_terms
  """

  use Mix.Task

  def run(_args) do
    term = "albert camus"

    data = [
      {"albert camus quotes", [631, 939, 997, 678, 864, 689, 445, 770, 750, 616]},
      {"albert camus the stranger", [806, 621, 487, 909, 580, 550, 700, 898, 735, 576]},
      {"albert camus books", [1340, 1104, 968, 866, 930, 511, 654, 902, 758, 860]},
      {"albert camus the plague", [724, 535, 746, 871, 484, 851, 662, 547, 423, 617]},
      {"albert camus biography", [925, 946, 882, 536, 535, 995, 647, 501, 692, 982]},
      {"albert camus sisyphus", [452, 943, 645, 604, 821, 483, 435, 963, 908, 911]},
      {"albert camus philosophy", [928, 860, 799, 842, 995, 969, 472, 638, 681, 969]},
      {"albert camus nobel prize", [881, 766, 989, 775, 716, 846, 879, 682, 942, 862]},
      {"albert camus photos", [143, 318, 128, 221, 80, 203, 400, 758, 1598, 2304]},
      {"albert camus the outsider", [678, 888, 421, 869, 411, 593, 619, 874, 453, 696]}
    ]

    sorted = Search.Analyzer.sort_related_terms(data)

    Search.Printer.print_search_terms(term, sorted)
  end
end
