class CreateNovels < ActiveRecord::Migration[5.0]
  def change
    create_table :novels do |t|
      t.string :name
      t.string :genre
      t.text :description

      t.timestamps
    end
  end
end
