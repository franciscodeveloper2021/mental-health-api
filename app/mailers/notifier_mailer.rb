class NotifierMailer < ApplicationMailer
  def instrument_assigned_email(evaluated_email, instrument_link)
    @instrument_link = instrument_link
    mail(to: evaluated_email, subject: "Instrument Assigned")
  end
end
