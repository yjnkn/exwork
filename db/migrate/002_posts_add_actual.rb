class PostsAddActual < ActiveRecord::Migration
  def self.up
      add_column(:posts, :actual, :time, :default=>'')
  end

  def self.down
      ramove_column(:posts, :actual)
  end
end