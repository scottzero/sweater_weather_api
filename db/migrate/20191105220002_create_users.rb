class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :api_key
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
