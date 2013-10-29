module ApplicationHelper
  def self.caps words
    if words
      array = words.split.map do |word|
        if word 
          word.capitalize
        end
      end
      array.join ' '
    end 

  end
end

