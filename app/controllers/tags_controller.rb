class TagsController < ApplicationController
    before_action :set_tag, only: [:show, :edit, :update, :destroy] 

    def show 
    end

    def index
        @tags = Tag.all
    end

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)
        session[:tag_id] = @tag.id
        if @tag.save
            flash[:notice] = "Tag was created successfully."
            redirect_to root_path
        else
            flash[:flash] = "Tag was NOT created."
            render "new"
        end
    end

    def edit
    end

    def update
        
        @tag.update(tag_params)
        if @tag.save
            flash[:notice] = "Tag was updated successfully."
            redirect_to @tag
        else
            flash[:flash] = "Tag was NOT updated."
            render "edit"
        end
    end

    def destroy
        @tag.destroy
        redirect_to tags_path
    end

    private

    def set_tag
        @tag = Tag.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:tag_name)
    end
end
