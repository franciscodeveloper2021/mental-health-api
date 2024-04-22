class InstrumentRepository

  def find_all_instruments
    instruments = Instrument.all
    return I18n.t("warnings.nothing", entity: "instruments") if instruments.empty?

    instruments
  end

  def find_instrument(instrument_id)
    instrument = Instrument.find_by_id(instrument_id)
    raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "Instrument", attribute: instrument_id) if instrument.nil?

    instrument
  end

  def create(params)
    instrument = Instrument.new(params)

    ActiveRecord::Base.transaction do
      instrument.save!
    end

    instrument
  end

  def update(instrument_id, params)
    instrument = find_instrument(instrument_id)

    ActiveRecord::Base.transaction do
      instrument.update(params)
    end

    instrument
  end

  def destroy(instrument_id)
    instrument = find_instrument(instrument_id)

    ActiveRecord::Base.transaction do
      instrument.destroy
    end
  end
end