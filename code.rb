module AddUpTo100

  def self.ways
    next_options_for 1
    #["1 + 2 + 34 - 5 + 67 - 8 + 9"]
  end

  def self.next_options_for number
    next_number = number + 1
    [
      "#{number}#{next_number}",
      "#{number} + #{next_number}",
      "#{number} - #{next_number}",
    ].map do |x|
      {
        number:      number,
        next_number: next_number,
        string:      x,
        value:       eval(x),
      }
    end
  end

end
