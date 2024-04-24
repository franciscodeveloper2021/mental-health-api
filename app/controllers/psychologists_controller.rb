class PsychologistsController < ApplicationController

  def initialize
    super

    @service = UseCases::Psychologists::CreatePsychologistService.new
  end

  def create
    psychologist = @service.create(psychologist_params)

    render json: psychologist, status: :created
  end

  private

  def psychologist_params
    params.require(:psychologist).permit(:name, :password)
  end
end
