require 'perimeter_words.rb'
require 'set'

class Array
  def to_hash
    Hash[*self.collect { |v| [v, true]}.flatten]
  end
end

describe PerimeterWords do
  before do
    @corpus = {'aa' => true, 'a' => true, 'ab' => true, 'xaa' => true, 'b' => true, 'bb' => true, 'mississippi' => true}
  end
  
  describe "variants" do
    perimeter_hash1 = {'aa' => true}
    expected_variants1 =  %w(ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az)
    expected_variants1 += %w(ba ca da ea fa ga ha ia ja ka la ma na oa pa qa ra sa ta ua va wa xa ya za)
    expected_variants1 += %w(aaa baa caa daa eaa faa gaa haa iaa jaa kaa laa maa naa oaa paa qaa raa saa taa uaa vaa waa xaa yaa zaa)
    expected_variants1 += %w(aba aca ada aea afa aga aha aia aja aka ala ama ana aoa apa aqa ara asa ata aua ava awa axa aya aza)
    expected_variants1 += %w(aab aac aad aae aaf aag aah aai aaj aak aal aam aan aao aap aaq aar aas aat aau aav aaw aax aay aaz)
    expected_variants1 += %w(a)
    
    perimeter_hash2 = {'aa' => true, 'a' => true}
    expected_variants2 = Array.new expected_variants1
    expected_variants2 -= %w(a)
    expected_variants2 += %w(b c d e f g h i j k l m n o p q r s t u v w x y z)
    
    @test_values = {perimeter_hash1 => expected_variants1.to_hash, perimeter_hash2 => expected_variants2.to_hash}
    
    @test_values.each_pair do |perimeter_hash, expected_variants|
      it "are listed correctly" do
        perimeter_words = PerimeterWords.new(perimeter_hash, @corpus, {})
        variants = perimeter_words.variants
        perimeter_words.variants.should == expected_variants
      end
    end
  end
  
  
  describe "next_perimeter" do
    xit "is evaluated correctly when there are no words inside the clique yet" do
      perimeter = {'aa' => true}
      pwords = PerimeterWords.new(perimeter, @corpus, {})
      expected_hits = {  :todo => :TODO  }
      hits = pwords.hits
      Set.new(hits).should == Set.new(expected_hits)
    end
  end
  
end
