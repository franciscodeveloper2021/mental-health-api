class CreatePsychologists < ActiveRecord::Migration[7.1]
  def change
    create_table :psychologists do |t|
      t.string :name, null: false, limit: 50
      t.string :password_digest

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE psychologists ADD CONSTRAINT min_length_name
      CHECK (LENGTH(name) >= 2);
    SQL
  end
end
