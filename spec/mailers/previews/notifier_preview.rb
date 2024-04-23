# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview
  def instrument_assigned_email_preview
    NotifierMailer.instrument_assigned_email('franciscosantanaalvesleite@gmail.com', 'http://localhost:8000')
  end
end
