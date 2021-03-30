class BeachesController < ApplicationController

    before_action(:set_beach, except: [:index, :new, :create])
    
    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @beaches = user.beaches
        else
            @beaches = Beach.all
        end
    end

    def show
    end
    
    def new
        @beach = Beach.new
        @beach.breaks.build(user: current_user)
        @breaks = @beach.breaks.select{|b| b.user_id == current_user.id}  
    end

    def create 
        @beach = Beach.new(beach_params)
        @beach.breaks.each {|b| b.user = current_user}
        if @beach.save
            redirect_to beach_path(@beach)
        else
            render :new
        end
    end

    def edit
        @breaks = @beach.breaks.where(user_id: current_user.id)
    end

    def update
        if @beach.update(beach_params)
            redirect_to(beach_path(@beach))
        else
            @breaks = @beach.breaks.select{|b| b.user_id == current_user.id}  
            render :edit
        end
    end

    def destroy
        @beach.delete
        redirect_to beaches_path
    end

    private 

    def beach_params
        params.require(:beach).permit(:name, breaks_attributes: [:name, :user_id, :id])
    end

    def set_beach
        @beach = Beach.find_by(id: params[:id])
    end

end