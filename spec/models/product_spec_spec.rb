require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "is valid product" do
      @category = Category.new(name: "test_category")
      @product = Product.new(name: "test_category", price: 1, quantity: 1)
      @product.category = @category
  
      expect(@product.valid?).to be true
    end
    
    it "validates new product has name" do
      @category = Category.new(name: "test_category")
      @product = Product.new(price: 1, quantity: 1)
      @product.category = @category
      expect(@product.valid?).to be false

      @product.name = "test_product"
      expect(@product.valid?).to be true
    end
    
    it "validates product has price" do
      @category = Category.new(name: "test_category")
      @product = Product.new(name: "test_product", quantity: 1)
      @product.category = @category
      expect(@product.valid?).to be false

      @product.price = 1
      expect(@product.valid?).to be true
    end

    it "validates product has quantity" do
      @category = Category.new(name: "test_category")
      @product = Product.new(name: "test_product", price: 1)
      @product.category = @category
      expect(@product.valid?).to be false
     
      @product.quantity = 1
      expect(@product.valid?).to be true
    end

    it "validates product has category" do
      @category = Category.new(name: "test_category")
      @product = Product.new(name: "test_product",quantity: 1, price: 1)
      expect(@product.valid?).to be false
     
      @product.category = @category
      expect(@product.valid?).to be true
    end
  end
end
