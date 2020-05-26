class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :video_url
      t.string :thumbnail_url
      t.integer :likes, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

