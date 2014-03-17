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

    top_three_elements(word_count)

  end

  def top_letters

    top_three_elements(letter_count)

  end

  private

  def character_count(regex)
    words = Hash.new(0)
    text.downcase.each_char do |letter|
      words[letter] += 1 if letter =~ regex
    end
    words
  end

  def top_three_elements(element)
    element.group_by{|k,v| v}.sort.reverse.first(3).map do |array_pair|
      array_pair.last.map { |e| e.first }
    end
  end



end
