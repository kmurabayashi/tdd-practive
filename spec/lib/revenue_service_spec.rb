
describe RevenueService do
  let(:revenue_service){ RevenueService.new }

  describe "#revenue_recognition" do
    context "契約以外のインスタンスが与えられると" do
      let(:contract){ "contract" }
      ## 契約による設計
      it "nilが返ってくる" do
        expect(revenue_service.revenue_recognition(contract, '2022/02/01')).to eq nil
      end
    end
    describe "ワードプロセッサである" do
      context "2/1のMS Wordの契約と2/1の日付が与えらえると" do
        let(:contract){ Contract.new("MS Word","ワードプロセッサ",18_800,'2022/02/01') }
        it "18800円返ってくる" do
          expect(revenue_service.revenue_recognition(contract, '2022/02/01')).to eq 18_800
        end
      end

      context "2/1の一太郎の契約と2/1の日付が与えらえると" do
        let(:contract){ Contract.new("一太郎","ワードプロセッサ",20_000,'2022/02/01') }
        it "全額の20000円返ってくる" do
          expect(revenue_service.revenue_recognition(contract, '2022/02/01')).to eq 20_000
        end
      end
    end

    describe "スプレッドシートである" do
      context "2/1のMS Excelの契約と30日後以降の最小値である3/3の日付が与えらえると" do
        let(:contract){ Contract.new("MS Excel","スプレッドシート",27_800,'2022/02/01') }
        it "全額の27_800円返ってくる" do
          expect(revenue_service.revenue_recognition(contract, '2022/03/03')).to eq 27_800
        end
      end

      context "2/1のMS Excelの契約と2/1の日付が与えらえると" do
        let(:contract){ Contract.new("MS Excel","スプレッドシート",27_800,'2022/02/01') }
        it "2/3 + 端数 である18,534円返ってくる" do
          expect(revenue_service.revenue_recognition(contract, '2022/02/01')).to eq 18_534
        end
      end

      context "2/1の三四郎の契約と30日後以降の最小値である3/3の日付が与えらえると" do
        let(:contract){ Contract.new("三四郎","スプレッドシート",5_000,'2022/02/01') }
        it "全額の5_000円返ってくる" do
          expect(revenue_service.revenue_recognition(contract, '2022/03/03')).to eq 5_000
        end
      end

      context "2/1の三四郎の契約と2/1の日付が与えらえると" do
        let(:contract){ Contract.new("MS Excel","スプレッドシート",5_000,'2022/02/01') }
        it "2/3 + 端数 である3,334円返ってくる" do
          expect(revenue_service.revenue_recognition(contract, '2022/02/01')).to eq 3_334
        end
      end
    end

    describe "過去日を与えられると" do
      context "2/1のMS Wordの契約と1/31の日付が与えらえると" do
        let(:contract){ Contract.new("MS Word","ワードプロセッサ",18_800,'2022/02/01') }
        it "0円が返ってくる" do
          expect(revenue_service.revenue_recognition(contract, '2022/01/31')).to eq 0
        end
      end
    end
  end
end