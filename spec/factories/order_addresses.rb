FactoryBot.define do
  factory :order_address do
    token             {"tok_abcdefghijk00000000000000000"}
    postcode          {'111-2222'}
    prefecture_id     {'3'}
    city              {'青森市'}
    block             {'青森1-1-1'}
    building          {'青い森ビル123'}
    telephone_number  {'04033334444'}
  end
end
