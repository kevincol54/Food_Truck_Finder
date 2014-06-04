class AddFieldsToCompanies < ActiveRecord::Migration
  def self.up
    add_attachment :companies, :image
  end

  def self.down
    remove_attachment :companies, :image
  end
end
