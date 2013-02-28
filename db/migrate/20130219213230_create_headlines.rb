class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
