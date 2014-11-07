class PigLatin

  def initialize(word)
    @word = word
  end

  def word
    @word
  end

  def translate
    if /[aeiou]/.match(word[0])
      "#{word}ay"
   elsif word[1] !~ /[aeiou]/
      chop_second_char = word[2..-1]
      second_chars = word[0..1]
      "#{chop_second_char}#{second_chars}ay"
    else
      chop_first_char = word[1..-1]
      first_char = word[0]
      "#{chop_first_char}#{first_char}ay"
    end
  end

end
