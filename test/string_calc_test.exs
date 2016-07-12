defmodule StringCalcTest do
  use ExUnit.Case
  doctest StringCalc

  test "an empty string returns 0" do
    assert StringCalc.add("") == 0
  end

  test "a string with one number returns that number" do
    assert StringCalc.add("2") == 2
  end

  test "a string with two numbers returns their sum" do
    assert StringCalc.add("2,4") == 6
  end

  test "a string with an arbitrary amount of numbers is summed correctly" do
    assert StringCalc.add("2,4,6,22,100,1") == 135
  end

  test "a string with a new line separater is summed correctly" do
    assert StringCalc.add("1\n2,3") == 6
  end

  test "a new separater can be defined and the string is summed correctly" do
    assert StringCalc.add("//;\n1,2,3") == 6
  end
end
