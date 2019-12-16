require 'rails_helper'

# 每個 Cart Item 都可以計算它自己的金額（小計）。
# 可以計算整台購物車的總消費金額。
# 特別活動可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百或滿額免運費）。

RSpec.describe Cart, type: :model do
  context "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      cart = Cart.new
      cart.add_item(1)
      expect(cart.empty?).not_to be true
    end

    it "加了相同種類的商品到購物車裡，購買項目不會增加，商品的數量會改變" do
      cart = Cart.new
      cart.add_item(1)
      cart.add_item(1)
      cart.add_item(1)
      cart.add_item(2)
      cart.add_item(2)

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      cart = Cart.new

      p1 = Publisher.create(name: 'kk store')
      c1 = Category.create(name: 'Ruby Book')

      b1 = Book.create(
        title: 'Hello',
        isbn: '333333',
        isbn13: '3333333',
        list_price: 100,
        sell_price: 50,
        page_num: 30,
        published_at: '2019-12-12',
        publisher: p1,
        category: c1
      )

      cart.add_item(b1.id)

      p cart
      p cart.items
      p cart.items.first.product

      expect(cart.items.first.product).to be_a Book
    end
  end
end
