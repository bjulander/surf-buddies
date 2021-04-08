class BeachesController < ApplicationController 
    before_action :set_beach, except: [:index, :new, :create]
    
    def index
        if params[:name]
            @beaches = Beach.beaches_search(params[:name])
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
            flash[:message] = "Update Successful"
        else
            @breaks = @beach.breaks.select{|b| b.user_id == current_user.id}  
            render :edit
        end
    end


    #Coding exercises not related to the project 
    # def most
    #     @beach = Beach.all.max {|a, b| a.breaks.count <=> b.breaks.count }
    # end 

    # def beaches_users
    #     if params[:beach_id]
    #         @beach = Beach.users_search(params[:beach_id]).first
    #         @users = @beach.users
    #     end
    # end

    private 

    def beach_params
        params.require(:beach).permit(:name, :street, :parking, :city, breaks_attributes: [:name, :user_id, :id, :beach_name, :location, :beach_id, :break_type, :direction, :height, :water_level, :suggested_skill_level, :shakas])
    end

    def set_beach
        @beach = Beach.find_by(id: params[:id])
    end

end