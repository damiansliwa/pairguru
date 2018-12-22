class TitleBracketsValidator < ActiveModel::Validator
  attr_accessor :title

  def initialize(record)
  	@record = record
  end

  def validate(record)
  	if (!match_brackets(record.title)) 
      record.errors.add(:title, "has invalid title")
    end
  end
  
  private

  def match_brackets(title)
    title =~ /\{*}/
  end
end