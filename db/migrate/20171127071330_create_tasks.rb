class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.references :user, type: :uuid, index: true
      t.timestamps
    end
  end
end
