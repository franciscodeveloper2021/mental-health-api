class PsychologistsController < ApplicationController

  def initialize
    super

    @service = UseCases::Psychologists::CreatePsychologistService.new
    @login_authentication_service = Authentication::LoginAuthenticationService.new
  end

  def create
    psychologist = @service.create(psychologist_params)

    render json: psychologist, status: :created
  end

  def log_in
    result = @login_authentication_service.perform(params[:name], params[:password])

    if result[:token]
      render json: result
    else
      render json: result, status: :unauthorized
    end
  end

  private

  def psychologist_params
    params.require(:psychologist).permit(:name, :password)
  end
end
