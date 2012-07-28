class AddEmailToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :email, :text
  end
end
