module AddUpTo100

  def self.ways
    results = next_options_for(1)
    7.times { results = results.map { |o| next_options_for o[:next_number], o[:statement] }.flatten }
    results.select { |x| x[:value] == 100 }
           .map    { |x| x[:statement] }
  end

  def self.next_options_for number, statement = nil
    next_number = number + 1
    statement = number unless statement
    [
      "#{statement}#{next_number}",
      "#{statement} + #{next_number}",
      "#{statement} - #{next_number}",
    ].map do |x|
      {
        number:      number,
        next_number: next_number,
        statement:   x,
        value:       eval(x),
      }
    end
  end

end
