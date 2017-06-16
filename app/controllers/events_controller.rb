class EventsController < ApplicationController
    
    def create
      
       @event = Event.create!(
            name:     params[:name],
            game_id:  params[:game_id],
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
