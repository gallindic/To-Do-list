class ListsController < ApplicationController
  def index
    @lists = List.all.where("user_id = ?", current_user.id)
  end
  
  def show
    @list = List.find(params[:id])
    @tasks = Task.all.where("list_id = ?", @list.id)
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.create(params[:list].permit(:name))
    @list.finished = false
    @list.user_id = current_user.id
    
    if @list.save
      redirect_to task_path(@list.id), :notice => "A new list has been successfully created"  
    else
      render "new"
    end
  end
  
  def edit
    @list = List.find(params[:id])
    
    respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @task }
    end
  end
  
  def update
    @list = List.find(params[:id])
    @list.finished = true
    if @list.update_attributes(params[:list].permit(:finished, :name))
        redirect_to lists_path
    else
        render "new"
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, :notice => "Your list has been deleted"
  end

end
