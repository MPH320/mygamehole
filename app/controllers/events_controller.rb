class EventsController < ApplicationController
    
    def create
        puts "Starting evaluation"
        if params[:value].nil?
            params[:value] = nil
        else
            params[:value].to_i
        end
      
        @event = Event.create!(
            name:     params[:name],
            value:    params[:value],
            game_id:  get_game().id,
            user_id:  current_user.id
        )
        
        respond_to do |format|
            if @event.save
                puts "Analytics saved"
                format.js
            end
        end
     
     
    end


end
