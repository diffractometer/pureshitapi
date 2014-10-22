class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by using :null_session
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  def index
    # allow any scope
    scope_name = params['scope'] || 'all'

    @data = model_name.send(scope_name)
    render json: {
      status: "success",
      data: @data
    }
  end

  def show
    @resource = model_name.find(params[:id])
    render json: {
      status: "success",
      data: @resource
    }
  end

  def new
    @resource = model_name.new
    render json: {
      status: "success",
      data: @resource
    }
  end

  def create
    @resource = model_name.new(resource_params)
    if @resource.save
        return render json: {
          status: "success",
          data: @resource
        }
    else
        return render json: {
          status: "failure",
          errors: @resource.errors.messages
        }, status: "400"
    end
  end

  def update
    binding.pry_remote
    @resource = model_name.find(params[:id])
    if @resource.update(resource_params)
      return render json: @resource
    else
      return render json: {
        status: "failure",
        errors: @resource.errors.messages
      }, status: "400"
    end
  end

  def destroy
    @resource = model_name.find(params[:id])
    if @resource.destroy
      return render json: {
        status: "success"
      }
    else
      return render json: {
        status: "failure",
        errors: @resource.errors.messages
      }, status: '400'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
    devise_parameter_sanitizer.for(:account_update) << :nickname
  end

  def model_name
    controller_name.classify.constantize
  end

end
