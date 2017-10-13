# before(:suite) hook runs just once: after all the specs have been loaded, but before the first one actually runs.
RSpec.configure do |c|
  c.before(:suite) do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
    DB[:expenses].truncate # Removes any leftover test data from the table.

    FileUtils.mkdir_p('log') # Configures sequel to record each executed sql statement to the log file.
    require 'logger'
    DB.loggers << Logger.new('log/sequel.log')
  end

  # Avoids littering each db-dependent spec.
  # Loads for any spec that touches the db, but not for unit specs(by requiring it).
  c.around(:example, :db) do |example|
    # Adds example descriptions into Sequel's log.
    DB.log_info "Starting example: #{example.metadata[:description]}"
    DB.transaction(rollback: :always) { example.run }
    DB.log_info "Ending example: #{example.metadata[:description]}"
  end
end