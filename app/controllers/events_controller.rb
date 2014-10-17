class EventsController < ApplicationController
  def event_params
    params[:event]
  end
end
