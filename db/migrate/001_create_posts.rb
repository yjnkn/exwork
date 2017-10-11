class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :userid
      t.date :workday
      t.time :extime
      t.string :extype
      t.timestamps
    end
  end
end
