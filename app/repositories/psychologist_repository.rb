class PsychologistRepository

  def create(params)
    psychologist = Psychologist.new(params)

    ActiveRecord::Base.transaction do
      psychologist.save!
    end

    psychologist
  end
end