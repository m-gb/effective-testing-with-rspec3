class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 + ingredients.size * 0.25
  end

  def color
    ingredients.include?(:milk) ? :light : :dark
  end

  def temperature
    ingredients.include?(:milk) ? 190.0 : 205.0
  end
end

RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end
  
  context 'with milk' do # groups a set of examples together with a common description. 
  # Used for phrases that modify the object we're testing.
    before { coffee.add :milk }
    
    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end

    it 'is light in color' do
      expect(coffee.color).to be(:light)
    end

    it 'is cooler than 200 degrees Fahrenheit' do
      expect(coffee.temperature).to be < 200.0
    end
  end
end

# To see the output in documentation format:              $ rspec -fd
# Running a specific example by name:                     $ rspec -e milk -fd
# Running the most recent failing spec:                   $ rspec ./spec/coffee_spec.rb:26
# Running all the failures:                               $ rspec --only-failures, or: $ rspec --tag last_run_status:failed
# Running --only-failures and aborting after one failure: $ rspec --next-failure
# Running specific specs: fcontext, fit, fdescribe, or:   $ rspec --tag focus
# Marking work in progress: pending, skip or xit(which is like fit, but it skips the example)
# If a spec is failing because of a bug in a dependency, mark it with: pending 'waiting for a fix for Hitchhiker's Guide bug #42