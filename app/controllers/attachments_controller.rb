class AttachmentsController < ApplicationController

private  
  def resource_params
    params.permit(:resource_id, :resource_type, :file)
  end                                           
end
