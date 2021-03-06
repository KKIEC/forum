class CreateCategorizations < ActiveRecord::Migration[6.1]
  def change
    create_table :categorizations do |t|
      t.belongs_to :topic, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
