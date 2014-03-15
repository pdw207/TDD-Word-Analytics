class Paragraph
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def word_count
    words = Hash.new(0)
    text.downcase.split(" ").each do |word|
      words[word] += 1
    end
    words
  end

  def letter_count
    #count any letter (exclude whitespace and symbols)
    character_count(/[a-zA-Z]/)
  end


  def symbol_count
    #count any character except letters and whitespace
    character_count(/[^a-zA-Z  \n]/)

  end

  def top_words
    top_words =[]
    word_hash = word_count
    3.times {
      key, value = word_hash.max_by { |k, v| v  }
      top_words << key
      word_hash[key] = 0 #after added to top word
    }
    top_words
  end

  private

  def character_count(regex)
    words = Hash.new(0)
    text.downcase.each_char do |letter|
      words[letter] += 1 if letter =~ regex
    end
    words
  end
end
