require 'hash_kv_store'
require 'support/kv_store_shared_examples'

RSpec.describe HashKVStore do
  it_behaves_like 'KV store', HashKVStore
end

# Calling it_behaves_like twice doesn't override each other, unlike include_examples.
# Use include_examples when you're sure the shared group's context won't conflict with anything in the group.