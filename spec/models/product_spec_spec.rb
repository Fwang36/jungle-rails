require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "validates new product has name" do
      @category = Category.new(name: "test_category")
      @product = Product.new(name: "test_product", price: 1, quantity: 1)
      @product.category = @category

      expect(@product.valid?).to be true
    end
  end
end
