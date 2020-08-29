class CreatorsController < ApplicationController

    before_action :set_creator, only: [:show, :edit, :update, :destroy] 

    def show 
        @quotations = @creator.quotations
    end

    def index
        @creators = Creator.all
    end

    def new
        @creator = Creator.new
    end

    def create
        @creator = Creator.new(creator_params)
        if @creator.save
            flash[:notice] = "Creator was created successfully."
            redirect_to @creator
        else
            flash[:flash] = "Creator was NOT created."
            render "new"
        end
    end

    def edit
    end

    def update
        
        @creator.update(creator_params)
        if @creator.save
            flash[:notice] = "Creator was updated successfully."
            redirect_to @creator
        else
            flash[:flash] = "Creator was NOT updated."
            render "edit"
        end
    end

    def destroy
        
        @creator.destroy
        redirect_to creators_path
    end

    private

    def set_creator
        @creator = Creator.find(params[:id])
    end

    def creator_params
        params.require(:creator).permit(:author)
    end

end
