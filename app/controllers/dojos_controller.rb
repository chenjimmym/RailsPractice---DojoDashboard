class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
        render "index"
    end
    def new
        render "new"
    end
    def create
        create = Dojo.create(dojo_params)
        if create.id == nil
            flash[:error] = "All fields must be filled!"
            redirect_to "/dojos/new"
        else
            flash[:success] = "New Dojo Added!"
            redirect_to "/dojos"
        end
    end


    private
        def dojo_params
            params.require(:dojo).permit(:branch, :street, :city, :state)
        end

end
