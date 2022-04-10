require 'time'
describe Contract do

  describe "#initialize" do
    context "MS Wordのとき" do
      let(:word_processor) {WordProcessor.new("MS Word",18_800)}
      it "製品名がMS Wordであること" do
        expect(word_processor.name).to eq "MS Word"
      end
      it "カテゴリー名がワードプロセッサであること" do
        expect(word_processor.category_name).to eq "ワードプロセッサ"
      end
      it "価格が18,800であること" do
        expect(word_processor.price).to eq 18_800
      end
    end
  end

  describe "#before_revenue_recognition_price" do
    context "収益認識前の価格は" do
      let(:word_processor) {WordProcessor.new("MS Word",18_800)}
      it "収益認識後の価格と変わらないこと(購入直後から収益認識される)" do
        expect(word_processor.before_revenue_recognition_price).to eq 18_800
      end
    end
  end
end