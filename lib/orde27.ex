defmodule Orde27 do
  use ExDoukaku.TestRunner

  @moduledoc """


  - [オフラインリアルタイムどう書く E27](https://yhpg.doorkeeper.jp/events/79705)
  """

  def solve(input) do
    input |> String.downcase()
  end

  c_styled_test_data """
  /* 0 */ test("ABC", "abc");
  """
end
