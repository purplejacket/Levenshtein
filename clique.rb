# AUTHOR: Rodrigo

# @corpus : dict of words
# @inside : hits with traversed edges
# @wildcards : wildcards visited
# @perimeter : hits with untraversed edges

def setup
  @corpus = {}
  @inside = {}
  @wildcards = {}
  @perimeter = {'causes' => true}
  File.foreach("word.list") do |x|
    @corpus[x.chomp] = true
  end
end

def new_word?(word)
  @corpus[word] && !@inside[word]
end

ALPHABET = ('a'..'z').to_a
def wildcard(prefix, suffix)
  result = {}
  ('a'..'z').map do |middle|
    variant = prefix + middle + suffix
    result[variant] = true if new_word?(variant)
  end
  result
end

def variants(words)
  result = {}
  words.each do |word, value|
    (0...word.size).each do |index|
      prefix = word[0, index]
      middle = word[index, 1]
      suffix = word[index + 1, word.size - index - 1]
      result.merge! wildcard(prefix, middle + suffix)
      result.merge! wildcard(prefix, suffix)
      variant = prefix + suffix
      result[variant] = true if new_word?(variant)
    end
    result.merge! wildcard(word, "")
  end
  result
end

def gen_inside
  while @perimeter.size > 0 do
    @inside.merge! @perimeter
    @perimeter = variants(@perimeter)
    puts "i#{@inside.size} p#{@perimeter.size}"
  end 
end

t0 = Time.now
setup
gen_inside
t1 = Time.now
puts "elapsed time: #{t1-t0}"
