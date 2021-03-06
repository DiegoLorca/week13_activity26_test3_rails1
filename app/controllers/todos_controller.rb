class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    # if @todo.save
    #   flash[:notice] = "Descripción guardada correctamente."
    redirect_to todos_path
    # else
    #   flash.now[:alert] = "Error: #{@todo.errors.full_messages.join(', ')} "
    #   render todos_new_path
    # end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @todos = Todo.all
    # debugger
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
