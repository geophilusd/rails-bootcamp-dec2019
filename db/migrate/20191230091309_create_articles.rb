class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title, null: false
    	t.text :description
    	t.integer :word_count, default: 0

    	t.timestamps
    end
  end
end
