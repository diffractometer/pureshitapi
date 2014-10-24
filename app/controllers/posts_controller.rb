class PostsController < ApplicationController

private  
  def resource_params
    params.permit(:title, :body, :user_id, :image)
  end                                           
end                                             
