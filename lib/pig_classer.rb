class PigClasser

  def self.translate(input)
    input = input.split(" ")
    output = []
    fixed_words = []

    input.each do |word|        # translating to pig latin
      if word[0] =~ /[aeiou]/
        output << "#{word}ay"
      elsif word[0..2] !~ /[aeiou]/ || word[1..2] == "qu"
        output << "#{word[3..-1]}#{word[0..2]}ay"
      elsif word[1] !~ /[aeiou]/ || word[0..1] == "qu"
        output << "#{word[2..-1]}#{word[0..1]}ay"
      else
        output << "#{word[1..-1]}#{word[0]}ay"
      end

      fixed_words = []          # fixing the cases
      output.each do |word|
        if word != word.downcase
          fixed_words << word.capitalize
        else
          fixed_words << word
        end
      end
    end

    p fixed_words.join(" ")

  end

end
