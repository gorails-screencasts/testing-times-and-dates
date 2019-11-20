class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.datetime :trial_ends_at

      t.timestamps
    end
  end
end
