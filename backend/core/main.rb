# frozen_string_literal: true

require_relative 'db_connection'
require_relative 'seeds'
require_relative 'cleaner'

class Main
  def self.execute
    DatabaseConnection.new.establish

    Seeds.call

    Cleaner.flush_db
  end
end

Main.execute
