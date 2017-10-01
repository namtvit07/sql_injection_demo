class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :national_id
      t.date :birthday
      t.string :phone
      t.string :address
      t.boolean :is_admin
    end
  end
end
