# def generate_isbn(n)
#   ([*'A'..'Z'] + [*0..9]).sample(n).join
# end

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    published_at { Faker::Date.in_date_period }
    list_price { [*10..100].sample }
    sell_price { [*10..100].sample }
    page_num { [*100..200].sample }
    isbn { SecureRandom.hex(10).upcase }
    isbn13 { SecureRandom.hex(13).upcase}
    publisher
    category
  end
end
