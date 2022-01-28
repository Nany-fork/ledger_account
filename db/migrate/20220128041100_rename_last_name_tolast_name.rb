class RenameLastNameTolastName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :lastName, :last_name
  end
end
