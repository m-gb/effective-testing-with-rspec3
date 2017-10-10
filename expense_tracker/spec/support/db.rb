# before(:suite) hook runs just once: after all the specs have been loaded, but before the first one actually runs.
RSpec.configure do |c|
  c.before(:suite) do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
    DB[:expenses].truncate # Removes any leftover test data from the table.
  end

  # Loads for any spec that touches the db, but not for unit specs(by requiring it).
  # Avoids littering each db-dependent spec.
  c.around(:example, :db) do |example|
    DB.transaction(rollback: :always) { example.run }
  end
end