class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|

      t.integer :url_id, :tag_id
      t.timestamps
    end
  end
end
