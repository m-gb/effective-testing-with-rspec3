require 'pp'

RSpec.describe Hash, :outer_group do
  it 'is used by RSpec for metadata', :fast, :focus do |example|
    pp example.metadata # Returns a hash  containing all the metadata.
  end

  context 'on a nested group' do
    it 'is also inherited' do |example|
      pp example.metadata
    end
  end
end

# By having the it block take an argument, we can access the example's properties at runtime. 