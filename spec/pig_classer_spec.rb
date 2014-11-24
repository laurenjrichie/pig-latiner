require 'spec_helper'

describe PigClasser do
  it "translates a word beginning with a vowel" do
    translation = PigClasser.translate("apple")
    expect(translation).to be ==  "appleay"
  end

  it "translates a word beginning with a consonant" do
    translation = PigClasser.translate("banana")
    expect(translation).to be ==  "ananabay"
  end

  it "translates a word beginning with two consonants" do
    translation = PigClasser.translate("cherry")
    expect(translation).to be ==  "errychay"
  end

  it "translates two words" do
    translation = PigClasser.translate("eat pie")
    expect(translation).to be ==  "eatay iepay"
  end

  it "translates a word beginning with three consonants" do
    translation = PigClasser.translate("three")
    expect(translation).to be == "eethray"
  end

  it "counts 'sch' as a single phoneme" do
    translation = PigClasser.translate("school")
    expect(translation).to be ==  "oolschay"
  end

  it "counts 'qu' as a single phoneme" do
    translation = PigClasser.translate("quiet")
    expect(translation).to be ==  "ietquay"
  end

  it "counts 'qu' as a consonant even when xit's preceded by a consonant" do
    translation = PigClasser.translate("square")
    expect(translation).to be ==  "aresquay"
  end

  it "translates many words" do
    translation = PigClasser.translate("the quick brown fox")
    expect(translation).to be == "ethay ickquay ownbray oxfay"
  end

  it "handles capitalization of a word" do
    translation = PigClasser.translate("Square")
    expect(translation).to be == "Aresquay"
  end

  it "handles capitalization within a sentence" do
    translation = PigClasser.translate("the quick brown Fox")
    expect(translation).to be == "ethay ickquay ownbray Oxfay"
  end

  it "leaves punctuation alone" do
    translation = PigClasser.translate("The quick, brown fox.")
    expect(translation).to be == "Ethay ickquay, ownbray oxfay."
  end
end
