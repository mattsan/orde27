defmodule Orde27 do
  use ExDoukaku.TestRunner

  @moduledoc """
  - [とあるカードゲーム 2018.10.6](http://nabetani.sakura.ne.jp/hena/orde27cardgame/)

  - [オフラインリアルタイムどう書く E27](https://yhpg.doorkeeper.jp/events/79705)
  """

  def split([n | ns]), do: split(ns, [[n]])

  def split([], acc), do: Enum.reverse(acc) |> Enum.map(&Enum.reverse/1)
  def split([n2 | rest], [[n1 | _] = a1 | acc]) when n2 == n1 + 1, do: split(rest, [[n2 | a1] | acc])
  def split([n | rest], acc), do: split(rest, [[n] | acc])

  def stories([card | cards]), do: stories(cards, [[card]])

  def stories([], acc) do
    acc
    |> Enum.reduce({[], []}, fn cards, {ss, rest} ->
      case cards do
        [card] ->
          {ss, [card | rest]}

        _ ->
          {[cards | ss], rest}
      end
    end)
  end

  def stories([[suit, lank] = card | rest], [a1 | acc]) do
    if Enum.member?(rest, [suit, lank + 1]) do
      stories(rest, [[card | a1] | acc])
    else
      stories(rest, [[card] | [a1 |acc]])
    end
  end

  def kinds(_cards) do
  end

  def solve(input) do
    cards =
      input
      |> String.split(",")
      |> Enum.map(&String.to_charlist/1)
      |> Enum.sort()

    inspect stories(cards)
  end

  c_styled_test_data """
  /*0*/ test( "A1,A2,A3,A4,B3,C3,D5,E5", "11" );
  /*1*/ test( "A1,B2,C3,D4,E5,F6,G7,A8", "-" );
  /*2*/ test( "A3,A5,A4,A6,A7,A1,A2,A8", "49" );
  /*3*/ test( "G2,G1,A1,F1,C1,E1,B1,D1", "26" );
  /*4*/ test( "E3,G3,D4,F3,D3,C3,B3,A3", "9" );
  /*5*/ test( "A1,C1,C2,E3,B1,B2,A2,D3", "9" );
  /*6*/ test( "D2,E2,C1,B2,C2,B1,A2,A1", "20" );
  /*7*/ test( "C2,B3,B4,A1,A2,B2,B1,C1", "11" );
  /*8*/ test( "D1,B1,D3,C3,D2,B2,C1,B3", "4" );
  /*9*/ test( "C1,F5,F6,B2,C2,D2,F4,C3", "-" );
  /*10*/ test( "D2,A2,C2,E2,F2,B2,C3,C1", "9" );
  /*11*/ test( "D6,E7,D8,F7,C7,G7,D7,D5", "-" );
  /*12*/ test( "B2,B3,B4,D5,D2,D4,D3,C3", "-" );
  /*13*/ test( "C3,D3,B2,B1,E4,E5,D4,C2", "4" );
  /*14*/ test( "D3,E4,E2,C1,F4,D2,E3,C2", "4" );
  /*15*/ test( "B4,C3,D5,C4,A4,C5,B5,B6", "4" );
  /*16*/ test( "E9,D8,D9,D7,F8,F9,E8,E7", "9" );
  /*17*/ test( "F9,C9,D7,D9,D8,E7,E9,F8", "-" );
  /*18*/ test( "D4,C5,B5,B6,D3,D2,D5,B7", "11" );
  /*19*/ test( "B8,D8,D7,A7,A8,D9,C8,A9", "9" );
  /*20*/ test( "F3,E3,F7,E5,E6,E4,E7,F6", "11" );
  /*21*/ test( "A9,G9,B8,A7,G7,C8,A8,G8", "9" );
  /*22*/ test( "G8,G2,G3,G9,G6,G4,G5,G7", "49" );
  /*23*/ test( "E9,E1,B9,D1,C9,G9,D9,F9", "26" );
  /*24*/ test( "B9,B7,G3,A7,G4,B1,B8,B2", "4" );
  /*25*/ test( "A1,B4,B3,A4,A2,B5,A3,A5", "20" );
  /*26*/ test( "B3,D3,F3,G2,C3,A3,E3,G3", "26" );
  /*27*/ test( "E8,D8,E7,D7,G8,G7,F7,F8", "18" );
  /*28*/ test( "D4,B3,E4,A3,C4,E3,D3,C3", "20" );
  /*29*/ test( "B7,B5,E4,B6,D4,A4,B4,C4", "20" );
  /*30*/ test( "B2,B1,B7,C8,F2,B9,B8,F1", "-" );
  /*31*/ test( "C4,C3,C5,E3,E1,E2,E4,C2", "18" );
  /*32*/ test( "G1,E1,D1,A1,F1,A2,B1,C1", "26" );
  /*33*/ test( "E4,C5,C4,B4,D4,D5,E5,F5", "18" );
  /*34*/ test( "D4,G4,A4,F4,C4,A3,E4,B4", "26" );
  /*35*/ test( "B3,A9,G4,F4,A8,B4,G8,A3", "-" );
  /*36*/ test( "B4,E3,F4,E4,G3,A4,G4,F3", "9" );
  /*37*/ test( "E4,B3,E3,C3,A3,G3,F3,A2", "4" );
  /*38*/ test( "C5,C4,C6,C8,C1,C2,C7,C3", "49" );
  /*39*/ test( "C4,D4,E4,F3,E3,F4,D3,G4", "20" );
  /*40*/ test( "F2,F6,F9,F7,F5,F3,F8,F4", "49" );
  /*41*/ test( "A9,A3,A8,A2,B9,B8,A7,A1", "9" );
  /*42*/ test( "G9,A8,G8,A6,A9,G6,G7,A7", "18" );
  /*43*/ test( "B8,C4,D5,D4,C8,D8,E8,B4", "11" );
  /*44*/ test( "B1,B2,F6,E4,C1,C2,F4,F5", "4" );
  /*45*/ test( "B4,B3,B5,B1,B7,B8,B6,B2", "49" );
  /*46*/ test( "G8,A8,G7,A7,F7,G6,A6,F8", "9" );
  /*47*/ test( "B7,E7,D7,G7,C7,A7,F7,E8", "11" );
  /*48*/ test( "F3,D7,B7,D3,C3,G3,E3,D9", "-" );
  /*49*/ test( "B3,A6,C5,A3,A4,A2,B5,A5", "-" );
  /*50*/ test( "A8,D6,B8,C8,D7,C7,D8,E8", "4" );
  /*51*/ test( "B4,D9,C4,E9,E2,G9,F9,D2", "11" );
  /*52*/ test( "B3,G9,A9,G1,A1,F1,F9,A3", "-" );
  /*53*/ test( "G1,B1,A2,G2,B2,A1,A4,A3", "11" );
  /*54*/ test( "A7,A6,C7,B7,B5,G5,A5,F5", "4" );
  /*55*/ test( "D1,D9,D4,E4,E8,B4,F8,F4", "-" );
  /*56*/ test( "B4,A8,C8,G8,B7,A3,B3,C7", "-" );
  /*57*/ test( "D3,G3,D7,F3,D9,B7,E3,C3", "-" );
  /*58*/ test( "B9,B1,F2,B7,B2,C8,F1,B8", "-" );
  /*59*/ test( "F6,E4,F4,F5,B1,B2,C1,C2", "4" );
  /*60*/ test( "A5,G5,B5,B4,G6,C4,G7,A6", "-" );
  /*61*/ test( "C4,G3,F4,B7,A1,G4,D4,D5", "-" );
  /*62*/ test( "D7,G2,A4,A3,A7,A5,A6,F7", "-" );
  /*63*/ test( "F7,E5,E4,E3,E7,F3,F6,E6", "11" );
  /*64*/ test( "C1,E9,D4,G5,A5,C5,C6,B5", "-" );
  /*65*/ test( "E4,B6,A4,B4,B7,B5,C4,D4", "20" );
  /*66*/ test( "G9,B4,D9,D2,E2,C4,F9,E9", "11" );
  /*67*/ test( "B9,B2,B7,B1,G3,A7,B8,G4", "4" );
  /*68*/ test( "B2,C1,E7,E6,A2,D2,C2,A1", "-" );
  /*69*/ test( "A4,B4,F4,G4,E3,G3,E4,F3", "9" );
  /*70*/ test( "A8,D8,D6,D7,C8,B8,E8,C7", "4" );
  """
end
