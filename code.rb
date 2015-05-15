module AddUpTo100

  def self.ways
    next_options_for 1
    next_options_for(1)
      .map { |o| next_options_for o }.flatten
      .map { |o| next_options_for o }.flatten
      .map { |o| next_options_for o }.flatten
      .map { |o| next_options_for o }.flatten
      .map { |o| next_options_for o }.flatten
      .map { |o| next_options_for o }.flatten
      .map { |o| next_options_for o }.flatten
      .select { |x| x[:value] == 100 }
      .map { |x| x[:string] }
  end

  def self.next_options_for number_or_hash
    if number_or_hash.is_a?(Hash)
      options_for_a_hash number_or_hash
    else
      options_for_a_number number_or_hash
    end
  end

  def self.options_for_a_number number
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

  def self.options_for_a_hash hash
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
  end

end
