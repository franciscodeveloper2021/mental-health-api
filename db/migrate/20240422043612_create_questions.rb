class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :content, null: false, limit: 400
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end

    execute <<-SQL
    ALTER TABLE questions ADD CONSTRAINT questions_length
      CHECK (LENGTH(content) >= 5);
    SQL
  end
end
