class AddAssociationsProdCat < ActiveRecord::Migration
  def change
  	add_reference(:products, :category)
  end
end
