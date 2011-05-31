require 'levenshtein.rb'

describe Levenshtein do
  it "instantiates" do
    @lev = Levenshtein.new('36.word.list')
  end
end
