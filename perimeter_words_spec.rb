require 'perimeter_words.rb'
require 'set'

describe PerimeterWords do
  before do
    @corpus = {'aa' => true, 'a' => true, 'ab' => true, 'xaa' => true, 'mississippi' => true}
  end
  
  describe "variants" do
    perimeter1 = %w(aa)
    expected_variants1 =  %w(ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az)
    expected_variants1 += %w(ba ca da ea fa ga ha ia ja ka la ma na oa pa qa ra sa ta ua va wa xa ya za)
    expected_variants1 += %w(aaa baa caa daa eaa faa gaa haa iaa jaa kaa laa maa naa oaa paa qaa raa saa taa uaa vaa waa xaa yaa zaa)
    expected_variants1 += %w(aba aca ada aea afa aga aha aia aja aka ala ama ana aoa apa aqa ara asa ata aua ava awa axa aya aza)
    expected_variants1 += %w(aab aac aad aae aaf aag aah aai aaj aak aal aam aan aao aap aaq aar aas aat aau aav aaw aax aay aaz)
    expected_variants1 += %w(a)
    
    perimeter2 = %w(a aa)
    expected_variants2 = Array.new expected_variants1
    expected_variants2 += %w(aa)
    expected_variants2 += %w(b c d e f g h i j k l m n o p q r s t u v w x y z)
    
    @test_values = {perimeter1 => expected_variants1, perimeter2 => expected_variants2}
    
    @test_values.each_pair do |perimeter, expected_variants|
      it "are listed correctly" do
        pwords = PerimeterWords.new(perimeter, @corpus)
        variants = pwords.variants
        Set.new(variants).should == Set.new(expected_variants)
      end
    end
  end
  
  describe "hits" do
    it "are evaluated correctly" do
      perimeter = %w(aa)
      pwords = PerimeterWords.new(perimeter, @corpus)
      expected_hits = %w(a ab xaa)
      hits = pwords.hits
      Set.new(hits).should == Set.new(expected_hits)
    end
  end
  
end
