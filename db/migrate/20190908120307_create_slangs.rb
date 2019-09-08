class CreateSlangs < ActiveRecord::Migration[5.2]
  def change
    create_table :slangs do |t|
      t.string :slang
      t.text :meaning
      t.text :usage

      t.timestamps
    end
  end
end
