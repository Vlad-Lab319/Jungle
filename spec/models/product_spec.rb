require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe "Validations" do

    before(:each) do

      @test_category = Category.new(
        name: "Test category"
        )
      @test_product = Product.new(
        name: "New product",
        price_cents: 999,
        quantity: 10,
        category: @test_category
      )
    end
  

    it "valid with all attributes valid" do
      @test_product.save
      expect(@test_product).to be_valid
      expect(@test_product.errors.full_messages).to be_empty
    end

    it "invalid when missing name" do
      @test_product.name = nil
      @test_product.save
      expect(@test_product).to be_invalid
      expect(@test_product.errors.full_messages).to include("Name can't be blank")
    end

    it "invalid when missing price" do
      @test_product.price_cents = nil
      @test_product.save
      expect(@test_product).to be_invalid
      expect(@test_product.errors.full_messages).to include("Price can't be blank")
    end

    it "invalid when missing quantity" do
      @test_product.quantity = nil
      @test_product.save
      expect(@test_product).to be_invalid
      expect(@test_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "invalid when missing category" do
      @test_product.category = nil
      @test_product.save
      expect(@test_product).to be_invalid
      expect(@test_product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
