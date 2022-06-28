class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image
      t.string :tags, array: true, default: []
      t.text :description
      t.string :live
      t.string :source
      t.string :demo
      t.string :mobileImage

      t.timestamps
    end
  end
end
