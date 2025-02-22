class CreateStatusHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :status_histories do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :old_status
      t.integer :new_status

      t.timestamps
    end
  end
end
