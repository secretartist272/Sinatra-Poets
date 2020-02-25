class CreatePoems < ActiveRecord::Migration
    def change
        create_table :poems do |t|
            t.string :title
            t.integer :user_id
            t.text :content

            t.timestamps null: false
        end
    end
end