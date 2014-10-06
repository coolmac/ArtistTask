class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :search_term
      t.integer :user_id

      t.timestamps
    end
  end
end
