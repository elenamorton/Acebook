class CommentChangeColumnName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :comments, :message, :comment
  end
  def self.down
    #do not do anything
  end
end
