class AddAttachmentProfilePicToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    drop_attached_file :users, :profile_pic
  end
end
