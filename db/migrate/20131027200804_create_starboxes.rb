class CreateStarboxes < ActiveRecord::Migration
  def change
    create_table :starboxes do |t|

      t.timestamps
    end
  end
end
