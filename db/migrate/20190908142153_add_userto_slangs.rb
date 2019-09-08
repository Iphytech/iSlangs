class AddUsertoSlangs < ActiveRecord::Migration[5.2]
  def change

    add_reference :slangs, :user, foreign_key: true
  end
end
