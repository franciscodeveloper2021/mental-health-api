class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :title, null: false, limit: 40
      t.text :description, null: false, limit: 300
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE instruments ADD CONSTRAINT title_length
        CHECK (LENGTH(title) >= 5);
      ALTER TABLE instruments ADD CONSTRAINT description_length
        CHECK (LENGTH(description) >= 10);
    SQL
  end
end
