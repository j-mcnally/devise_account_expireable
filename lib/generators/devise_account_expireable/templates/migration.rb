class DeviseUpdate<%= @model_name.camelize.singularize %>ExpireFields < ActiveRecord::Migration
 def change
  add_column :<%=@model_name.tableize%>, :expires_at, :datetime
 end
end