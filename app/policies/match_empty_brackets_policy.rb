class MatchEmptyBracketsPolicy
  def initialize(string)
  	@string = string
  end

  def apply?
  	return false if @string.nil?
  	brackets = %w{ {} [] () }
  	brackets.any? { |bracket| @string.include?(bracket) }
  end
end