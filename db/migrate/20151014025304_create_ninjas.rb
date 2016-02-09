class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.references :dojo, index: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
