require 'levenshtein.rb'

describe Levenshtein do
  before do
    @lev = Levenshtein.new('36.word.list')
  end
  
  it "reports the corpus size" do
    @lev.corpus_size.should == 36
    lev_3 = Levenshtein.new('3.word.list')
    lev_3.corpus_size.should == 3
  end
  
  it "evaluates clique" do
    @lev.clique('causativenesses').should == %w(causativenesses)
    @lev.clique('causative').should == %w(causative causatives)
  end
  
  
  
end
