class CreatePoems < ActiveRecord::Migration[4.2]
    def change
        create_table :poems do |t|
            t.string :title
            t.integer :author_id
            t.text :content

            t.timestamps null: false
        end
    end
end