# spec/models/product_spec.rb

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create!(name: 'Evergreens') }

    it 'should save successfully with all fields set' do
      product = Product.new(
        name: 'Test Plant',
        description: 'Test description',
        image: 'test_image.jpg',
        quantity: 10,
        price: 50.99,
        category: category
      )

      expect(product).to be_valid
    end

    it 'should not save without a name' do
      product = Product.new(
        name: nil,
        description: 'Test description',
        image: 'test_image.jpg',
        quantity: 10,
        price: 50.99,
        category: category
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save without a price' do
      product = Product.new(
        name: 'Test Plant',
        description: 'Test description',
        image: 'test_image.jpg',
        quantity: 10,
        price: nil,
        category: category
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price cents must be greater than 0")
    end

    it 'should not save without a quantity' do
      product = Product.new(
        name: 'Test Plant',
        description: 'Test description',
        image: 'test_image.jpg',
        quantity: nil,
        price: 50.99,
        category: category
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save without a category' do
      product = Product.new(
        name: 'Test Plant',
        description: 'Test description',
        image: 'test_image.jpg',
        quantity: 10,
        price: 50.99,
        category: nil
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
