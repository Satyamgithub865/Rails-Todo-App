class TodosController < ApplicationController
    def index
        @todos = Todo.all
    end

    def create
        @todo = Todo.create(description: params[:todo][:description])
        if @todo.valid?
            redirect_to todos_path 
        end
    end
end
