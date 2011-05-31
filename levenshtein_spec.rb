require 'levenshtein.rb'

describe Levenshtein do
  it "instantiates" do
    @lev = Levenshtein.new('36.word.list')
  end
  
  it "reports the corpus size" do
    @lev.corpus_size.should == 36
  end
end
