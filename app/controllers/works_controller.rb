class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    id = params[:id]
    @work = Work.find_by(id: id)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id].to_i)
  end

  def update
    @work = Work.find(params[:id].to_i)
    # @task.name = params[:task][:name]
    # @task.description = params[:task][:description]
    if @work.update(work_params)
      redirect_to root_path
    else
      render :edit
    end
    # edit_work_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :description, :publication_year, :creator, :category)
  end

end
