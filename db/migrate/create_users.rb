class CreateUsers < ActiveRecord::Migration[4.2]
    def change
        create_table :Users do |t|
            t.string :name
            t.integer :age
            t.string :username

            t.timestamps
        end
    end
end