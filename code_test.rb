require_relative 'code'
require 'minitest/autorun'
require 'minitest/spec'

describe "find all possible ways to come up with 100 with 1-9, +'s, and -'s" do

  let(:results) { AddUpTo100.ways }

  it "should return the first example" do
    results.include?("1 + 2 + 34 - 5 + 67 - 8 + 9").must_equal true
  end

end
