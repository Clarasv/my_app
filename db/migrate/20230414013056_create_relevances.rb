class CreateRelevances < ActiveRecord::Migration[7.0]
  def change
    create_table :relevances do |t|
      t.integer :following_id, null: false
      t.integer :follower_id, null: false

      t.timestamps
    end
  end
end
