RSpec.describe 'An ideal sandwich' do # Creates an example group.
  it 'is delicious' do # Creates an example (individual test).
    sandwich = Sandwich.new('delicious', [])

    taste = sandwich.taste

    expect(taste).to eq('delicious') # Verifies an expected outcome.
  end
end