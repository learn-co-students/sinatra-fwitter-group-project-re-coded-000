class CreateDoctors < ActiveRecord::Migration
  def up
    create_table :doctors do |t|
      t.string :name
      t.integer :password_digest
      t.string :email
      t.string :department
    end
  end

  def down
    drop_table :doctors
  end
end