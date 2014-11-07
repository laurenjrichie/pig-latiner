class PigLatin

  def initialize(input)
    @input = input
  end

  def input
    @input
  end

  def translate
    output = []
    input.split(" ").each do |word|
      if (word[0]) =~ /[aeiou]/   # all that start with vowel
        output << "#{word}ay"
      elsif word[0..2] !~ /[aeiou]/ || word[1..2] == "qu" # first three are consonants or _qu
        output << "#{word[3..-1]}#{word[0..2]}ay"
      elsif word[1] !~ /[aeiou]/ || word[0..1] == "qu" # first two are consonants or qu
        output << "#{word[2..-1]}#{word[0..1]}ay"
      else                          # everything else
        output << "#{word[1..-1]}#{word[0]}ay"
      end
    end

    fixed_output = []
    output.each do |word|
      if word != word.downcase
        fixed_output << word.capitalize
      else
        fixed_output << word
      end
    end

    fixed_output.join(" ")

  end

end
