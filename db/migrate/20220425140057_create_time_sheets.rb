class CreateTimeSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :time_sheets do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.string :reason
      t.references :user

      t.timestamps
    end
    
  end
end
