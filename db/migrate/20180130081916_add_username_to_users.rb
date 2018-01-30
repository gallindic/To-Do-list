class AddUsernameToUsers < ActiveRecord::Migration
  def change  #Anything inside this method is translated to SQL code
    add_column :users, :username, :string #Adds a new column to the "Users" table called "username", type "string"
    add_index :users, :username, unique: true #Ensures that all usernames are unique
  end
end
