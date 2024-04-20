class InstrumentRepository

  def find_all_instruments
    instruments = Instrument.all
    return I18n.t("warnings.nothing", entity: "instruments") if instruments.empty?

    instruments
  end

  def find_instrument(instrument_id)
    instrument = Instrument.find_by_id(instrument_id)
    raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found", record: "instrument", attribute: instrument_id) if instrument.nil?

    instrument
  end

  def create(params)
    instrument = Instrument.new(params)

    ActiveRecord::Base.transaction do
      instrument.save!
    end

    instrument
  end
end