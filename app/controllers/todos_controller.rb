class TodosController < ApplicationController
    before_action :require_login
    
    def index
        @todos = current_user.todos
    end

    def create
        @todo = current_user.todos.create(description: params[:todo][:description])
        if @todo.valid?
            redirect_to todos_path 
        end
    end

    def destroy
        if current_user.todos.find(params[:id]).destroy
          redirect_to todos_path  
        end
    end

    def update
        @todo = current_user.todos.find(params[:id])
        if @todo.update(description: params[:todo][:description], status: params[:todo][:status])
          redirect_to todos_path
        else
          redirect_to todos_path
        end
    end
end
