class CreateEvaluatedInstrumentsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :evaluateds, :instruments do |t|
      t.index [:evaluated_id, :instrument_id]
      t.index [:instrument_id, :evaluated_id]
    end
  end
end
