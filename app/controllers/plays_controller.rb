class PlaysController < ApplicationController
    def create
        play = current_user.plays.create(cosmetic_id: params[:cosmetic_id]) #user_idとcosmetic_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        play = Play.find_by(cosmetic_id: params[:cosmetic_id], user_id: current_user.id)
        play.destroy
        redirect_back(fallback_location: root_path)
      end
end
