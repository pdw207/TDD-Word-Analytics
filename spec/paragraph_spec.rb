require 'pry'
require 'rspec'

require_relative '../lib/paragraph.rb'

describe Paragraph do

  let(:long_string){Paragraph.new('The quick brown fox jumps
                                  over the lazy dog.')}

  let(:symbol_string){Paragraph.new('dfsaf 324%^&##$%4 sfda.')}

  let(:multiple_paragraphs){Paragraph.new('Use TDD to drive the design of a
                                          WordAnalysis class. There should
                                          be an instance method defined for
                                          each of the bullets listed above.')}


  it 'has word count' do

    expect(long_string.word_count).to eq({"the"=>2, "quick"=>1,
                                          "brown"=>1, "fox"=>1, "jumps"=>1,
                                          "over"=>1, "lazy"=>1, "dog."=>1})

    expect(symbol_string.word_count).to eq({"dfsaf"=>1, "324%^&#\#$%4"=>1,
                                            "sfda."=>1})

    expect(multiple_paragraphs.word_count).to eq({"use"=>1, "tdd"=>1, "to"=>1,
                                                  "drive"=>1, "the"=>2, "design"=>1,
                                                  "of"=>2, "a"=>1, "wordanalysis"=>1,
                                                  "class."=>1, "there"=>1, "should"=>1,
                                                  "be"=>1, "an"=>1, "instance"=>1,
                                                  "method"=>1, "defined"=>1, "for"=>1,
                                                  "each"=>1, "bullets"=>1, "listed"=>1,
                                                  "above."=>1})
  end

  it 'has letter count' do

    expect(long_string.letter_count).to eq({"t"=>2, "h"=>2, "e"=>3, "q"=>1, "u"=>2, "i"=>1,
                                            "c"=>1, "k"=>1, "b"=>1, "r"=>2, "o"=>4, "w"=>1,
                                            "n"=>1, "f"=>1, "x"=>1, "j"=>1, "m"=>1, "p"=>1,
                                            "s"=>1, "v"=>1, "l"=>1, "a"=>1, "z"=>1, "y"=>1,
                                            "d"=>1, "g"=>1})

    expect(symbol_string.letter_count).to eq({"d"=>2, "f"=>3, "s"=>2, "a"=>2})

    expect(multiple_paragraphs.letter_count).to eq({"u"=>3, "s"=>10, "e"=>16, "t"=>9, "d"=>10,
                                                    "o"=>8, "r"=>4, "i"=>6, "v"=>2, "h"=>6,
                                                    "g"=>1, "n"=>6, "f"=>4, "a"=>8, "w"=>1,
                                                    "l"=>6, "y"=>1, "c"=>3, "b"=>3, "m"=>1})
  end

  it 'has symbol count' do
    expect(long_string.symbol_count).to eq({"."=>1})
    expect(symbol_string.symbol_count).to eq({"3"=>1, "2"=>1, "4"=>2, "%"=>2, "^"=>1, "&"=>1, "#"=>2, "$"=>1, "."=>1})
    expect(multiple_paragraphs.symbol_count).to eq({"."=>2})
  end

  it 'has top three words' do
    expect(long_string.top_words).to eq(["the", "quick", "brown"])
    expect(symbol_string.top_words).to eq(["dfsaf", "324%^&#\#$%4", "sfda."])
    expect(multiple_paragraphs.top_words).to eq(["the", "of", "use"])
  end

  it 'has top three letters'
  it 'lists number of words used only once'
  it 'returns all letters not used in the string'

end
