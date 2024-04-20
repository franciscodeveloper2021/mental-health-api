class CreateEvaluateds < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluateds do |t|
      t.string :name, null: false, limit: 50
      t.string :cpf, null: false
      t.string :email, null: false, limit: 254
      t.date :birthdate, null: false

      t.timestamps
    end


    execute <<-SQL
    ALTER TABLE evaluateds ADD CONSTRAINT min_length_name
      CHECK (LENGTH(name) >= 2);
    SQL

    add_index :evaluateds, :cpf, unique: true
    add_index :evaluateds, :email, unique: true
  end
end