class EventsController < ApplicationController
    
    def create
        
        if params[:value].nil?
            params[:value] = nil
        else
            params[:value].to_i
        end
        
        variable = current_user
        if variable.nil?
         @event = Event.create!(
            name:     params[:name],
            value:    params[:value],
            game_id:  get_game().id
        )
        else
         @event = Event.create!(
            name:     params[:name],
            value:    params[:value],
            game_id:  get_game().id,
            user_id:  variable.id
        )
        end

        respond_to do |format|
            if @event.save
                puts "Analytics saved"
                format.js
            end
        end
     
     
    end


end
