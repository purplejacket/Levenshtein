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
    perimeter = PerimeterWords.new({word => true}, @corpus, words_in_clique)
    while true do
      size = words_in_clique.size
      words_in_clique.merge! perimeter.words
      break if size == words_in_clique.size
      perimeter.expand
    end
    words_in_clique
  end
end
