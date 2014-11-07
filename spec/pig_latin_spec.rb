require 'spec_helper'

describe PigLatin do
  it "translates a word beginning with a vowel" do
    translation = PigLatin.new("apple").translate
    expect(translation).to be ==  "appleay"
  end

  it "translates a word beginning with a consonant" do
    translation = PigLatin.new("banana").translate
    expect(translation).to be ==  "ananabay"
  end

  it "translates a word beginning with two consonants" do
    translation = PigLatin.new("cherry").translate
    expect(translation).to be ==  "errychay"
  end

  xit "translates two words" do
    translation = PigLatin.new("eat pie").translate
    expect(translation).to be ==  "eatay iepay"
  end

  xit "translates a word beginning with three consonants" do
    translation = PigLatin.new("three").translate
    expect(translation).to be == "eethray"
  end

  xit "counts 'sch' as a single phoneme" do
    translation = PigLatin.new("school").translate
    expect(translation).to be ==  "oolschay"
  end

  xit "counts 'qu' as a single phoneme" do
    translation = PigLatin.new("quiet").translate
    expect(translation).to be ==  "ietquay"
  end

  xit "counts 'qu' as a consonant even when xit's preceded by a consonant" do
    translation = PigLatin.new("square").translate
    expect(translation).to be ==  "aresquay"
  end

  xit "translates many words" do
    translation = PigLatin.new("the quick brown fox").translate
    expect(translation).to be == "ethay ickquay ownbray oxfay"
  end

  xit "handles capitalization of a word" do
    translation = PigLatin.new("Square").translate
    expect(translation).to be == "Aresquay"
  end

  xit "handles capitalization within a sentence" do
    translation = PigLatin.new("the quick brown Fox").translate
    expect(translation).to be == "ethay ickquay ownbray Oxfay"
  end

  xit "leaves punctuation alone" do
    translation = PigLatin.new("The quick, brown fox.").translate
    expect(translation).to be == "Ethay ickquay, ownbray oxfay."
  end
end
