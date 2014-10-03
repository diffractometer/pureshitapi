class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @data = User.all
    render json: {
      status: "success",
      data: @data
    }
  end

end
