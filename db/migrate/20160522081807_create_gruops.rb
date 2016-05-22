class CreateGruops < ActiveRecord::Migration
  def change
    create_table :gruops do |t|
      t.string :name

      t.timestamps
    end
  end
end
