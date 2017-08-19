require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Tom") }

  let(:cake) { Dessert.new("cake", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    let(:cookie) { Dessert.new("cookie", "50", "Tom") }

    it "raises an argument error when given a non-integer quantity" do
      expect { cookie }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    let(:ice_cream) { Dessert.new("ice cream", 50, "Porf") }

    it "adds an ingredient to the ingredients array" do

      ice_cream.add_ingredient("sprinkles")

      expect(ice_cream.ingredients).to eq(["sprinkles"])
    end
  end

  describe "#mix!" do
    let(:banana_nut_pudding) { Dessert.new("banana nut pudding", 50, "Porf") }

    it "shuffles the ingredient array" do
      ingredients = %w[bananas nuts chocalate pudding mix]

      ingredients.each do |ingredient|
        banana_nut_pudding.add_ingredient(ingredient)
      end

      banana_nut_pudding.mix!
      
      expect(banana_nut_pudding.ingredients).not_to eq(["bananas", "nuts", "chocalate", "pudding mix"])
    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      cake.eat(25)

      expect(cake.quantity).to eq(25)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(60) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tom the Great Baker")
      expect(cake.serve).to match(/Chef Tom/)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
