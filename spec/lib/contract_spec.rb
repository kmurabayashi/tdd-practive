require 'time'
describe Contract do

  describe "#initialize" do
    context "MS Wordを契約したとき" do
      let(:contract){ Contract.new("MS Word","ワードプロセッサ",18_800,Time.parse('2022/02/01')) }
      it "製品名がMS Wordであること" do
        expect(contract.product_name).to eq "MS Word"
      end
      it "カテゴリー名がワードプロセッサであること" do
        expect(contract.category_name).to eq "ワードプロセッサ"
      end
      it "価格が18,800であること" do
        expect(contract.price).to eq 18_800
      end
      it "日付が今であること" do
        expect(contract.signed_on).to eq Time.parse('2022/02/01')
      end
    end
  end
end