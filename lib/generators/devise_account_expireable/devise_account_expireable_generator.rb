require 'rails/generators/migration'

class DeviseAccountExpireableGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Generates a migration to add required field to devise account model."

  def self.source_root
    @_devise_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.orm_has_migration?
    Rails::Generators.options[:rails][:orm] == :active_record
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  class_option :orm
  class_option :migration, :type => :boolean, :default => orm_has_migration?

  def invoke_migration

    model_name = ask("What is the name of your account model? (Leave blank for User): ")
    model_name = "User" if model_name.blank?

    @model_name = model_name.camelize.singularize



    if colum_exists?
      say "* Colum exists on model already exists."
    else
      migration_template 'migration.rb', "db/migrate/devise_update_#{model_name.downcase}_expire_fields.rb"
    end

    puts "Make sure to add :account_expireable to the devise line of your #{@model_name} model file."
  end

  protected

  def colum_exists?
    @model_name.constantize.column_names.include?("expires_at")
  end
end