class CreateMyarticles < ActiveRecord::Migration[7.0]
  def change
    create_table :myarticles do |t|

      t.timestamps
    end
  end
end
