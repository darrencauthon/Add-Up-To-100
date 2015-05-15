module AddUpTo100

  def self.ways
    next_options_for 1
    #["1 + 2 + 34 - 5 + 67 - 8 + 9"]
    next_options_for(1).map do |option|
      next_options_for(option)
    end.flatten.map { |x| x[:string] }
  end

  def self.next_options_for number_or_hash
    if number_or_hash.is_a?(Hash)
      hash = number_or_hash
      number = hash[:next_number]
      next_number = number + 1
      results = [
                  "#{hash[:string]}#{next_number}",
                  "#{hash[:string]} + #{next_number}",
                  "#{hash[:string]} - #{next_number}",
                ].map do |x|
                  {
                    number:      number,
                    next_number: next_number,
                    string:      x,
                    value:       eval(x),
                  }
                end
    else
      number = number_or_hash

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

end
