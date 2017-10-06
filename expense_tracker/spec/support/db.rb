RSpec.configure do |c|
  c.before(:suite) do # before(:suite) hook runs just once: after all the specs have been loaded, but before the first one actually runs.
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
    DB[:expenses].truncate # Removes any leftover test data from the table.
  end

  c.around(:example, :db) do |example|
    DB.transaction(rollback: :always) { example.run }
  end
end
# Loads for any spec that touches the db, but not for unit specs(by requiring it).