class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :full_name
      t.text :position
      t.text :email
      t.text :company
    end
  end
end
