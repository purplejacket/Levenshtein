class PerimeterHash
  def initialize perimeter, corpus
    @perimeter = perimeter
    @corpus = corpus
  end
  
  def variants
    @perimeter.keys.inject([]) { |accumulator, word| accumulator += levenshtein_word_variants(word) }
  end
  
  private
  
  def levenshtein_word_variants word
    retval = []
    retval += add_a_letter_at_each_position(word)
    retval += change_a_letter_at_each_position(word)
    retval += remove_a_letter_at_each_position(word)
    retval
  end
  
  @@alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  
  def add_a_letter_at_each_position word
    retval = []
    (0..(word.size)).each do |position|
      @@alphabet.each do |letter|
        w = String.new word
        w.insert(position, letter)
        puts w
        retval << w
      end
    end
    retval
  end
  
  def change_a_letter_at_each_position word
    retval = []
    (0..(word.size - 1)).each do |position|
      @@alphabet.each do |letter|
        w = String.new word
        w[position] = letter.clone
        retval << w
      end
    end
    retval -= [word]
    retval
  end

  def remove_a_letter_at_each_position word
    return [] if word.length < 2
    retval = []
    (0..(word.size - 1)).each do |position|
      w = String.new word
      w[position] = ""
      retval << w
    end
    retval
  end
  
end
