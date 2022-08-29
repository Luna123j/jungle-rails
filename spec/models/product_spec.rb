require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "initial example test" do
      it "should create product with four field set" do
        @cat = Category.new(name: "category1")
        @product = Product.new(
          name:  'Cliff Collard',
          description: "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week.
          It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red.
          
          These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth.
          They can be brewed as tea.
          
          As a defense mechanism the Cliff Collard grows thick thorns.
          They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.",
          quantity: 23,
          price: 79.99,
          category: @cat
        )
        @product.save!
        expect(@product.id).to be_present
      end
    end
    context "validates tests" do
      it "should return error if name is not presence" do
        @cat = Category.new(name: "category1")
        @product = Product.new(
          description: "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week.
          It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red.
          
          These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth.
          They can be brewed as tea.
          
          As a defense mechanism the Cliff Collard grows thick thorns.
          They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.",
          quantity: 23,
          price: 79.99,
          category: @cat
        )
        @product.validate
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it "should return error if name is not presence" do
        @cat = Category.new(name: "category1")
        @product = Product.new(
          name:  'Cliff Collard',
          description: "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week.
          It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red.
          
          These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth.
          They can be brewed as tea.
          
          As a defense mechanism the Cliff Collard grows thick thorns.
          They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.",
          quantity: 23,
          category: @cat
        )
        @product.validate
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it "should return error if name is not presence" do
        @cat = Category.new(name: "category1")
        @product = Product.new(
          name:  'Cliff Collard',
          description: "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week.
          It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red.
          
          These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth.
          They can be brewed as tea.
          
          As a defense mechanism the Cliff Collard grows thick thorns.
          They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.",
          price: 79.99,
          category: @cat
        )
        @product.validate
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it "should return error if name is not presence" do
        @cat = Category.new(name: "category1")
        @product = Product.new(
          name:  'Cliff Collard',
          description: "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week.
          It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red.
          
          These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth.
          They can be brewed as tea.
          
          As a defense mechanism the Cliff Collard grows thick thorns.
          They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.",
          quantity: 23,
          price: 79.99,
        )
        @product.validate
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
