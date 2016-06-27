class ChangeDigesToDigest < ActiveRecord::Migration
  def change
    change_column :users, :password_diges, :password_digest
  end
end
