class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :order_items

  validates :recipient, :tel, :address, presence: true
  validates :num, uniqueness: true 

  before_create :generate_num

  def total_price
    (order_items.reduce(0) { |sum, item| sum += item.sell_price }).to_i
  end

  aasm column: 'state', no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :delivered, :cancelled

    event :pay do
      before do |args|
        self.transaction_id = args
      end

      transitions from: :pending, to: :paid
    end

    event :deliver do
      transitions from: :paid, to: :delivered
      after do
        puts "-" * 10
        puts "發送訊息 to: #{user.name}"
        puts "-" * 10
      end
    end

    event :cancel do
      transitions from: [:pending, :paid, :delivered], to: :cancelled
    end
  end

  private
  def generate_num
    all = ([*'A'..'Z'] + [*0..9]) - [0, 1, 'I', 'O']
    self.num = all.sample(10).join
  end
end
