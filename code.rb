module AddUpTo100

  def self.ways
    (1..9).to_a
          .map do |n|
            {
              num:  n,
              next: n == 9 ? nil : n + 1,
            }
          end
  end

end
