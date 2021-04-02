class BreaksController < ApplicationController
    before_action(:set_break, except: [:index, :new, :create])

    def index
        if params[:direction]
            @breaks = Break.breaks_search(params[:direction])
        else
            @breaks = Break.all
        end
    end
    
    def new
        if params[:beach_id]
            @beach = Beach.find_by(id: params[:beach_id])
            @breaks = @beach.breaks.build
        else 
            @break = Break.new
        end
    end

    def create 
        @break = Break.create(break_params)
        @break.user = current_user 
        if params[:beach_id]
            @break.beach_id = params[:beach_id]
        end
        if @break.save
            redirect_to breaks_path
        else
            render :new
        end
    end

    def edit
        break_owner
    end

    def update
        if @break.update(break_params)
            redirect_to (break_path(@break))
        else 
            render :edit
        end
    end

    def destroy
        break_owner
        @break.delete
    end

    private

    def break_params
        params.require(:break).permit(:location, :name, :break_type, :direction, :height, :water_level, :suggested_skill_level, :shakas, :beach_name, :beach_id, :user_id)
    end

    def set_break
        @break = Break.find_by(id: params[:id])
    end

end