class AddPermalinkAndTreeToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :parent_id, :integer
    add_column :pages, :lft, :string
    add_column :pages, :rgt, :string
    add_column :pages, :permalink, :string
    add_column :pages, :active, :boolean, :default => true
  end

  def self.down
    remove_column :pages, :parent_id
    remove_column :pages, :lft
    remove_column :pages, :rgt
    remove_column :pages, :permalink
    remove_column :pages, :active
  end
end
