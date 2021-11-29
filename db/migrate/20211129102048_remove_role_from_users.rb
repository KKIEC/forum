class RemoveRoleFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :role, null: false, foreign_key: true
  end
end
