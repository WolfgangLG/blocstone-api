class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false, default: "", unique: true

      t.timestamps null: false
    end
  end
end
