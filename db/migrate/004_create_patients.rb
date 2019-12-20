
class CreatePatients < ActiveRecord::Migration
  def up
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
    end
  end

  def down
    drop_table :patients
  end
end