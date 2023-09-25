require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

      it 'saves completely when all fields are set.' do
        @category = Category.create(name: 'Small Trees')
        @product = Product.new(
          name: "Bonsai tree",
          price: 100.00,
          quantity: 7, 
          category: @category
        )
        expect(@product).to be_valid
        expect(product.errors.full_messages).to include("Name can't be blank")
      end

      it 'does not save when the name value is nil.' do
        @category = Category.create(name: 'Small Trees')
        @product = Product.new(
          name: nil,
          price: 100.00,
          quantity: 7, 
          category: @category
        )
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end

      it 'does not save when the price input is nil.' do
        @category = Category.create(name: 'Small Trees')
        @product = Product.new(
          name: "Bonsai tree",
          price: nil,
          quantity: 7, 
          category: @category
        )
        puts @product.errors.full_messages
        # expect(@product).not_to be_valid
      end

  end
end
