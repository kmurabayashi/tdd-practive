require 'time'
describe Contract do

  describe "#initialize" do
    context "MS Wordを契約したとき" do
      let(:product) {WordProcessor.new("MS Word",18_800)}
      let(:contract){ Contract.new(product, Time.parse('2022/02/01')) }
      it "製品名がMS Wordであること" do
        expect(contract.product.name).to eq "MS Word"
      end
      it "カテゴリー名がワードプロセッサであること" do
        expect(contract.product.category_name).to eq "ワードプロセッサ"
      end
      it "価格が18,800であること" do
        expect(contract.product.price).to eq 18_800
      end
      it "日付が今であること" do
        expect(contract.signed_on).to eq Time.parse('2022/02/01')
      end
    end
  end

  describe "#specific_date_revenue_recognition" do
    context "契約がスプレッドシートであり" do
      context "契約日から30日以降で最大の日付である2022/03/04が与えられた時に" do
        let(:spread_sheet) {SpreadSheet.new("MS Excel",27_800)}
        let(:contract){ Contract.new(spread_sheet, Time.parse('2022/02/01')) }
        it "全額が収益認識されていること" do
          expect(contract.specific_date_revenue_recognition(Time.parse('2022/03/04'))).to eq 27_800
        end
      end
      context "契約日から30日以前で最小の日付である2022/03/03が与えられた時に" do
        let(:spread_sheet) {SpreadSheet.new("MS Excel",27_800)}
        let(:contract){ Contract.new(spread_sheet, Time.parse('2022/02/01')) }
        it "2/3 + 端数 である18,534円返ってくる" do
          expect(contract.specific_date_revenue_recognition(Time.parse('2022/03/03'))).to eq 18_534
        end
      end
    end
    context "契約がワードプロセッサーであり" do
      context "任意の日付が与えられた際に" do
        let(:word_processor) {WordProcessor.new("MS Word",18_800)}
        let(:contract){ Contract.new(word_processor, Time.parse('2022/02/01')) }
        it "全額が収益認識されていること" do
          expect(contract.specific_date_revenue_recognition(Time.parse('2022/03/04'))).to eq 18_800
        end
      end
      context "過去日付が与えられた際に" do
        let(:word_processor) {WordProcessor.new("MS Word",18_800)}
        let(:contract){ Contract.new(word_processor, Time.parse('2022/02/01')) }
        it "0円が返ってくること" do
          expect(contract.specific_date_revenue_recognition(Time.parse('2020/03/04'))).to eq 0
        end
      end
    end
  end
end