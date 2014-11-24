class PigClasser

  def self.translate(input)
    output = []
    case_fixed = []

    input.split(" ").each do |word|

      if word.match(/[,.!?]/)
        punctuation = word[-1]
        no_punct_word = word[0..-2]
      else
        punctuation = false
        no_punct_word = word
      end

      if starts_with_vowel(no_punct_word)
        translated_word = "#{no_punct_word}ay"
      elsif first_three_consonants(no_punct_word) || contains_qu(no_punct_word)
        translated_word = "#{no_punct_word[3..-1]}#{no_punct_word[0..2]}ay"
      elsif first_two_consonants(no_punct_word) || first_two_qu(no_punct_word)
        translated_word = "#{no_punct_word[2..-1]}#{no_punct_word[0..1]}ay"
      else
        translated_word = "#{no_punct_word[1..-1]}#{no_punct_word[0]}ay"
      end

      translated_word = "#{translated_word}#{punctuation}" if punctuation
      output << translated_word

      case_fixed = []
      output.each do |word|
        if word != word.downcase
          case_fixed << word.capitalize
        else
          case_fixed << word
        end
      end
    end

    case_fixed.join(" ")

  end

  def self.starts_with_vowel(word)
    word[0] =~ /[aeiou]/
  end

  def self.first_three_consonants(word)
    word[0..2] !~ /[aeiou]/
  end

  def self.contains_qu(word)
    word[1..2] == "qu"
  end

  def self.first_two_consonants(word)
    word[0..1] !~ /[aeiou]/
  end

  def self.first_two_qu(word)
    word[0..1] == "qu"
  end

end
