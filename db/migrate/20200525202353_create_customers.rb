class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.text :desc
      t.boolean :status, default: 0

      t.timestamps
    end
  end
end
