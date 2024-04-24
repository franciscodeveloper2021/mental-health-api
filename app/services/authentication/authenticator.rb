module Authentication
  class Authenticator
    def self.authenticate_psychologist!(request)
      token = request.headers['Authorization']&.split(' ')&.last
      decoded_token = JWT.decode(token, 'your_secret_key', true, algorithm: 'HS256')
      psychologist_id = decoded_token[0]['psychologist_id']
      @current_psychologist = Psychologist.find_by(id: psychologist_id)
      raise JWT::DecodeError unless @current_psychologist

      @current_psychologist
    end
  end
end
