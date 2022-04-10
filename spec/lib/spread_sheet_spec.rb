require 'time'
describe Contract do

  describe "#initialize" do
    context "MS Excelのとき" do
      let(:spread_sheet) {SpreadSheet.new("MS Excel",27_800)}
      it "製品名がMS Excelであること" do
        expect(spread_sheet.name).to eq "MS Excel"
      end
      it "カテゴリー名がスプレッドシートであること" do
        expect(spread_sheet.category_name).to eq "スプレッドシート"
      end
      it "価格が27,800であること" do
        expect(spread_sheet.price).to eq 27_800
      end
    end
  end
  describe "#before_revenue_recognition_price" do
    context "収益認識前の価格は" do
      let(:spread_sheet) {SpreadSheet.new("MS Excel",27_800)}
      it "2/3 + 端数 である18,534円返ってくる" do
        expect(spread_sheet.before_revenue_recognition_price).to eq 18_534
      end
    end
  end
end