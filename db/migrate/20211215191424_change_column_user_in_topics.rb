class ChangeColumnUserInTopics < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:topics, :user_id, true)
  end
end
