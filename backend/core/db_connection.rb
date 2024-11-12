# frozen_string_literal: true

require 'active_record'

class DatabaseConnection
  def establish
    ActiveRecord::Base.establish_connection(db_configuration['development'])
  end

  private

  def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __dir__), 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file), aliases: true)
  end
end
