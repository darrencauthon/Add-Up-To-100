### The problem

Write a program that outputs all possibilities to put + or - or nothing between the numbers 1, 2, ..., 9 (in this order) such that the result is always 100. For example: 1 + 2 + 34 – 5 + 67 – 8 + 9 = 100.

### From

https://blog.svpino.com/2015/05/07/five-programming-problems-every-software-engineer-should-be-able-to-solve-in-less-than-1-hour

### My Code

```ruby
def next_options_for number, statement = nil
  next_number = number + 1
  statement   = number unless statement
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

results = next_options_for 1
7.times { results = results.map { |o| next_options_for o[:next_number], o[:statement] }.flatten }
results.select { |x| x[:value] == 100 }
       .map    { |x| x[:statement] }
```

### My Results

#### 11 results, all equal 100

123 + 45 - 67 + 8 - 9

123 + 4 - 5 + 67 - 89

123 - 45 - 67 + 89

123 - 4 - 5 - 6 - 7 + 8 - 9

12 + 3 + 4 + 5 - 6 - 7 + 89

12 + 3 - 4 + 5 + 67 + 8 + 9

12 - 3 - 4 + 5 - 6 + 7 + 89

1 + 23 - 4 + 56 + 7 + 8 + 9

1 + 23 - 4 + 5 + 6 + 78 - 9

1 + 2 + 34 - 5 + 67 - 8 + 9

1 + 2 + 3 - 4 + 5 + 6 + 78 + 9
