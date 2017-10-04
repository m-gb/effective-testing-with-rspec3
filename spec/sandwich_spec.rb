Sandwich = Struct.new(:taste, :toppings)

RSpec.describe 'An ideal sandwich' do # Creates an example group.
  let(:sandwich) { Sandwich.new('delicious', []) } # Binds a name to the result of a block.
  # Rspec will run the block the first time any example calls sandwich.
  
  it 'is delicious' do # Creates an example (individual test).

    taste = sandwich.taste

    expect(taste).to eq('delicious') # Verifies an expected outcome.
  end

  it 'lets me add toppings' do

    sandwich.toppings << 'cheese'
    toppings = sandwich.toppings

    expect(toppings).not_to be_empty
  end
end