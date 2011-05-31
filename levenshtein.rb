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
end
