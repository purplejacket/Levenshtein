require 'perimeter_hash.rb'
require 'set'

describe PerimeterHash do
  before do
    @corpus = {'aa' => true, 'a' => true, 'ab' => true, 'xaa' => true, 'mississippi' => true}
  end
  
  it "lists variants" do
    perimeter = {'aa' => true}
    expected_variants =  %w(ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az)
    expected_variants += %w(ba ca da ea fa ga ha ia ja ka la ma na oa pa qa ra sa ta ua va wa xa ya za)
    expected_variants += %w(aaa baa caa daa eaa faa gaa haa iaa jaa kaa laa maa naa oaa paa qaa raa saa taa uaa vaa waa xaa yaa zaa)
    expected_variants += %w(aba aca ada aea afa aga aha aia aja aka ala ama ana aoa apa aqa ara asa ata aua ava awa axa aya aza)
    expected_variants += %w(aab aac aad aae aaf aag aah aai aaj aak aal aam aan aao aap aaq aar aas aat aau aav aaw aax aay aaz)
    expected_variants += %w(a)
    @phash = PerimeterHash.new(perimeter, @corpus)
    variants = @phash.variants
    Set.new(variants).should == Set.new(expected_variants)
  end
end
