require 'perimeter_words.rb'

class Levenshtein
  def initialize word_list
    @corpus = {}
    File.foreach(word_list) do |line|
      @corpus[line.chomp] = true
    end
  end
  
  def corpus_size
    @corpus.size
  end
  
  def clique word
    words_in_clique = {}
    perimeter = PerimeterWords.new([word], @corpus)
    while true do
      size = retval.size
      retval += perimeter.words
      break if size == retval.size
      perimeter = PerimeterWords.new(perimeter.hits, @corpus)
    end
    retval
  end
end
