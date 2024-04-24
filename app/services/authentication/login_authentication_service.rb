module Authentication
  class LoginAuthenticationService

    def perform(name, password)
      psychologist = Psychologist.find_by(name: name)

      if psychologist && psychologist.authenticate(password)
        token = JWT.encode({ psychologist_id: psychologist.id}, 'your_secret_key', 'HS256')
        { token: token }
      else
        { error: I18n.t("authentication.invalid_auth") }
      end
    end
  end
end