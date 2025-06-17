class CreateSubTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_topics do |t|
      t.string :name
      t.boolean :status, default: false
      t.string :leetcode_link
      t.string :youtube_link
      t.string :article_link
      t.string :level
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
