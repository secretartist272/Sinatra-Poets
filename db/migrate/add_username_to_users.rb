class AddUsernameToUsers < ActiveREcord::Migration[4.2]
    def change
        add_column :users, :username, :string
    end
end