# require 'time'
# describe Contracts do
#
#   describe "#sign" do
#     context "MS Wordを契約したとき" do
#       let(:contract){ Contract.new("MS Word","ワードプロセッサ",18_800,Time.parse('2022/02/01')) }
#       let(:contracts) { Contracts.new }
#       it "契約一覧の値が増えること" do
#         contracts.sign(contract)
#         expect(contract.product_name).to eq "MS Word"
#       end
#     end
#   end
# end