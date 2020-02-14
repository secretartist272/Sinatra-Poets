class CreateUsers < ActiveRecord::Migration
    def change
        create_table :Users do |t|
            t.string :name
            t.integer :age
            t.string :username

            t.timestamps
        end
    end
end