class CreateWhatsNewItems < ActiveRecord::Migration
  def change
    create_table :whats_new_items do |t|
      t.text :title
      t.text :description
      t.string :experiment
      t.string :link
      t.date :start_date
      t.date :end_date
      t.string :release
      t.integer :position

      t.timestamps
    end
  end
end
