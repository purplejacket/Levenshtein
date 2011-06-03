class PerimeterWords
  def initialize perimeter, corpus, words_inside_clique
    @perimeter = perimeter
    @corpus = corpus
    @words_inside_clique = words_inside_clique
  end
  
  def variants
    @perimeter.keys.inject({}) { |accumulator, word| accumulator.merge! levenshtein_word_variants(word) }
  end
  
  def next_perimeter
    variants.keys.inject({}) do |accumulator, word| 
      accumulator[word] = true if @corpus[word] && !@words_inside_clique[word]
      accumulator
    end
  end
  
  def words
    @perimeter
  end
  
  def expand
    @perimeter = next_perimeter
  end
  
  private
  
  def levenshtein_word_variants word
    retval = {}
    retval.merge! add_a_letter_at_each_position(word)
    retval.merge! change_a_letter_at_each_position(word)
    retval.merge! remove_a_letter_at_each_position(word)
    retval
  end
  
  @@alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  
  def add_a_letter_at_each_position word
    retval = {}
    (0..(word.size)).each do |position|
      @@alphabet.each do |letter|
        w = String.new word
        w.insert(position, letter)
        retval[w] = true if not @perimeter[w]
      end
    end
    retval
  end
  
  def change_a_letter_at_each_position word
    retval = {}
    (0..(word.size - 1)).each do |position|
      @@alphabet.each do |letter|
        w = String.new word
        w[position] = letter
        retval[w] = true if not @perimeter[w]
      end
    end
    retval
  end

  def remove_a_letter_at_each_position word
    return {} if word.length < 2
    retval = {}
    (0..(word.size - 1)).each do |position|
      w = String.new word
      w[position] = ""
      retval[w] = true if not @perimeter[w]
    end
    retval
  end
  
end
