class BeachesController < ApplicationController
    
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
        @beach.breaks.build  
    end

    def create 
        @beach = Beach.new(beach_params)
        @beach.breaks.each {|b| b.user = current_user}
        if @beach.save
            redirect_to beach_path(@beach)
        else
            @errors = @beach.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        if @beach.update(beach_params)
            redirect_to(beach_path(@beach))
        else
            @errors = @beach.errors.full_messages
            render :edit
        end
    end

    def destroy
        @beach.delete
        redirect_to beaches_path
    end

    private 

    def beach_params
        params.require(:beach).permit(:name, breaks_attributes: [:name])
    end

    # def set_item
    #     @beach = Beach.find_by(id: params[:id])
    # end

end