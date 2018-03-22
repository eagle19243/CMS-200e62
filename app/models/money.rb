class Money
  include ActionView::Helpers::NumberHelper

  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def to_s
    "$#{number_with_delimiter(amount.to_i)}"
  end

end
