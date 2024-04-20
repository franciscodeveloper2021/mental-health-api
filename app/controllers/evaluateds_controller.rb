class EvaluatedsController < ApplicationController

  def initialize
    super
  end

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birthdate)
  end
end
