class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.string :shop
      t.string :location
      t.string :content
      t.integer :user_id
      t.integer :status
      t.datetime :end_on

      t.timestamps
    end
  end
end
