class CreateTagTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_topics do |t|

      t.string :tag
      t.timestamps
    end
  end
end
