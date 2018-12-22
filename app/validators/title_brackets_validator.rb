class TitleBracketsValidator < ActiveModel::Validator
  attr_accessor :title

  def initialize(record)
  	@record = record
  end

  def validate(record)
  	if (!has_closing_brackets?(record.title))
      record.errors.add(:title, "has invalid title")
    elsif (!match_brackets(record.title)) 
      record.errors.add(:title, "has invalid title")
    end
  end
  
  private

  def match_brackets(title)
    title =~ /\[*]|{*}|\(*\)/
  end

  def has_closing_brackets?(title)
    pair_brackets = {
      '(' => ')',
      '[' => ']',
      '{' => '}'
    }

    opening_brackets = pair_brackets.keys
    opening_brackets.each do |bracket|
      if (!title.include?(bracket) && !title.include?(pair_brackets[bracket]))
        next
      end
      if title.include?(pair_brackets[bracket]) && !title.include?(bracket)
        return false
      end
      if title.include?(bracket) && title.include?(pair_brackets[bracket])
        return false if title.index(bracket) > title.index(pair_brackets[bracket])
      end
      if title.count(bracket) < title.count(pair_brackets[bracket])
        return false
      end
      return false if title.count(bracket) > title.count(pair_brackets[bracket])
    end
  end
end