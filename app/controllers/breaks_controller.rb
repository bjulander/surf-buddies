class BreaksController < ApplicationController
    before_action(:set_break, except: [:index, :new, :create])

    def index
        @user = User.find_by(id: params[:user_id])
            if @user 
                @breaks = @user.breaks
                    if params[:direction]
                        @all_breaks = Break.direction_search(params[:direction])
                    else
                        @all_breaks = Break.all
                    end
            else 
            redirect_to beaches_path
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
        @break = Break.new(break_params)
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
            flash[:message] = "Update Successful"
        else 
            render :edit
        end
    end

    def destroy
        break_owner
        @break.delete
        redirect_to user_breaks_path(current_user)
    end

    private

    def break_params
        params.require(:break).permit(:location, :name, :break_type, :direction, :height, :water_level, :suggested_skill_level, :shakas, :beach_name, :beach_id, :user_id)
    end

    def set_break
        @break = Break.find_by(id: params[:id])
    end

    

end