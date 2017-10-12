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
#
# Testing Rails models:
# RSpec.configure do |config|
#   config.define_derived_metadata(type: :model) do |meta|
#     # ...
#   end
# end
#
# Specs will report every failed expectation:
# RSpec.configure do |config|
#   config.define_derived_metadata do |meta|
#     # Sets the flag unconditionally;
#     # doesn't allow examples to opt out
#     meta[:aggregate_failures] = true
#   end
# end