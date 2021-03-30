class BreaksController < ApplicationController

    def index
        if params[:break]
            @breaks = Break.breaks_search(params[:direction])
        else
        @breaks = Break.all
        end
    end
    
    def new
        if params[:beach_id]
            @beach = Beach.find_by(id: params[:beach_id])
            @breaks = @beach.breaks.build
            @beaches = Beach.all
        else 
            @break = Break.new
            @beaches = Beach.all 
        end
    end

    def create 
        @break = Break.create(break_params)
        @break.user = current_user
        if params[:beach_id]
            @break.beach_id = params[:beach_id]
        end
        if @break.save
        redirect_to beaches_path
        else
            render :new
        end
    end

    private

    def break_params
        params.require(:break).permit(:name, :beaches_id)


end