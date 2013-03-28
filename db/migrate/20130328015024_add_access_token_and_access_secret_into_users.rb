class AddAccessTokenAndAccessSecretIntoUsers < ActiveRecord::Migration
  def up
    add_column :users, :access_token, :string 
    add_column :users, :access_secret, :string
  end

  def down
  end
end
