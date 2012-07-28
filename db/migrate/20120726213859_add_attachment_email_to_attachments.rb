class AddAttachmentEmailToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.has_attached_file :email
    end
  end

  def self.down
    drop_attached_file :attachments, :email
  end
end
