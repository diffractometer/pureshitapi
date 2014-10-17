class PostsController < ApplicationController
  def resource_params
    params.permit(:id, :title, :body, :user_id)
  end
end
