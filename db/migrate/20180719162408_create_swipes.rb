class CreateSwipes < ActiveRecord::Migration[5.2]
  def change
    create_table :swipes do |t|
      t.integer :user_id
      t.integer :swipee_id
      t.boolean :liked

      t.timestamps
    end
  end
end
