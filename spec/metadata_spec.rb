# require 'pp'
# RSpec.describe Hash, :outer_group do
#   it 'is used by RSpec for metadata', :fast, :focus do |example|
#     pp example.metadata # Returns a hash  containing all the metadata.
#   end

#   context 'on a nested group' do
#     it 'is also inherited' do |example|
#       pp example.metadata
#     end
#   end
# end

# By having the it block take an argument, we can access the example's properties at runtime. 
# Run specific specs using $rspec --tag fast.

# /spec/spec_helper.rb
# RSpec will add the :fast metadata to every example in the spec/unit folder.
# RSpec.configure do |config|
#   config.define_derived_metadata(file_path: /spec\/unit/) do |meta|
#     meta[:fast] = true
#   end
# end

# Testing Rails models:
# RSpec.configure do |config|
#   config.define_derived_metadata(type: :model) do |meta|
#     # ...
#   end
# end

# Specs will report every failed expectation:
# RSpec.configure do |config|
#   config.define_derived_metadata do |meta|
#     meta[:aggregate_failures] = true unless meta.key?(:aggregate_failures) # Checks if the key exists before overriding it.
#   end
# end

# Lets individual examples opt out of the behavior:
# RSpec.describe 'Billing', aggregate_failures: false do
#   context 'using the fake payment service' do
#     before do
#       expect(MyApp.config.payment_gateway).to include('sandbox')
#     end 
#     #...
#   end
# end

# Excluding examples
# /spec/spec_helper.rb
RSpec.configure do |config|
  config.filter_run_excluding :jruby_only unless RUBY_PLATFORM == 'java'
end

# Including examples
# /spec/spec_helper.rb
RSpec.configure do |config|
  config.filter_run_when_matching :focus # If nothing matches the filter, RSpec ignores it.
end

# $rspec --tag fast # Runs just the examples tagged with :fast.
# $rspec --tag ~fast # Runs all examples that lack the :fast tag.