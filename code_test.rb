require_relative 'code'
require 'minitest/autorun'
require 'minitest/spec'

describe "find all possible ways to come up with 100 with 1-9, +'s, and -'s" do

  let(:results) { AddUpTo100.ways }

  it "should return the first example" do
    results.include?("1 + 2 + 34 - 5 + 67 - 8 + 9").must_equal true
  end

  describe "having run the results and believing that I found the solution" do

    let(:accurate_results) do
      [
        "123 + 45 - 67 + 8 - 9",
        "123 + 4 - 5 + 67 - 89",
        "123 - 45 - 67 + 89",
        "123 - 4 - 5 - 6 - 7 + 8 - 9",
        "12 + 3 + 4 + 5 - 6 - 7 + 89",
        "12 + 3 - 4 + 5 + 67 + 8 + 9",
        "12 - 3 - 4 + 5 - 6 + 7 + 89",
        "1 + 23 - 4 + 56 + 7 + 8 + 9",
        "1 + 23 - 4 + 5 + 6 + 78 - 9",
        "1 + 2 + 34 - 5 + 67 - 8 + 9",
        "1 + 2 + 3 - 4 + 5 + 6 + 78 + 9",
      ]
    end

    it "should maintain the results that I think are correct" do
      results.count.must_equal accurate_results.count
      results.each { |r| accurate_results.include?(r).must_equal true }
    end

  end

end
