class QuotationsController < ApplicationController
    before_action :set_quotation, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @quotations = Quotation.all
    end

    def new
        @creators = Creator.all
        @quotation = Quotation.new
    end

    def create
        @quotation = Quotation.new(quotation_params)
        @creators = Creator.all

        if @quotation.save
            flash[:notice] = "Quotation was added successfully"
            redirect_to @quotation
        else
            flash[:flash] = "Quotation was NOT added"
            render "new"
        end
    end

    def edit
    end

    def update
        
        @quotation.update(quotation_params)
        if @quotation.save
            flash[:notice] = "Quotation was updated successfully."
            redirect_to @quotation
        else
            flash[:flash] = "Quotation was NOT updated."
            render "edit"
        end
    end

    def destroy
        @quotation = Quotation.find(params[:id])
        @quotation.destroy
        redirect_to quotations_path
    end

    private

    def set_quotation
        @quotation = Quotation.find(params[:id])
    end

    def quotation_params
        params.require(:quotation).permit(:quote, :creator_id)
    end

end
