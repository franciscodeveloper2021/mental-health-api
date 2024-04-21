class CreateEvaluatedInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluated_instruments do |t|
      t.references :evaluated, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
