class TasksController < ApplicationController
    def new
        @task = Task.new
        @task.list_id = params[:list_id]
        
        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @task }
        end
    end
    
    def create
        @task = Task.create(params[:task].permit(:content, :list_id, :image))
        @task.finished = false
        
        if @task.save
          redirect_to task_path(@task.list_id), :notice => "A new list has been successfully created"  
        else
          render "new"
        end
    end
    
    def show
        @list = List.find(params[:id])
        @tasks = Task.all.where("list_id = ?", @list.id)
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to task_path(@task.list_id), :notice => "Your task has been deleted"
    end
    
    def edit
        @task = Task.find(params[:id])
        
        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @task }
        end
    end
    
    def update
        @task = Task.find(params[:id])
        if @task.update_attributes(params[:task].permit(:finished, :content, :image))
            redirect_to task_path(@task.list_id)
        else
            render "new"
        end
    end
end
