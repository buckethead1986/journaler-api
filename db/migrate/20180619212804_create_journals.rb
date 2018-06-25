class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
