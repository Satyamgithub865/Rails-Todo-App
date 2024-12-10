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

    def destroy
        if Todo.find(params[:id]).destroy
          redirect_to todos_path  
        end
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(description: params[:todo][:description], status: params[:todo][:status])
          redirect_to todos_path, notice: "Todo updated successfully"
        else
          redirect_to todos_path, alert: "Failed to update todo"
        end
    end

    def edit
    end
end
