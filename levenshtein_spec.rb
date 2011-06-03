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
    @lev.clique('causativenesses').should == {'causativenesses' => true}
    @lev.clique('causative').should == {'causative' => true, 'causatives' => true}
    @lev.clique('causatives').should == {'causative' => true, 'causatives' => true}
    @lev.clique('cause').should == {"causers"=>true, "causer"=>true, "cauter"=>true, "causes"=>true, "causeys"=>true, "cautels"=>true, "cautel"=>true, "causen"=>true, "causey"=>true, "caused"=>true, "cause"=>true}
  end
end
