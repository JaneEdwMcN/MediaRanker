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
      redirect_to work_path(@work .id)
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id].to_i)
  end

  def update
    @work = Work.find(params[:id].to_i)
    if @work.update(work_params)
      redirect_to work_path(@work .id)
    else
      render :edit
    end
  end

  def destroy
      id = params[:id]
      work = Work.find_by(id: id)
      if work.destroy
        redirect_to root_path
      end
    end

  private

  def work_params
    return params.require(:work).permit(:title, :description, :publication_year, :creator, :category)
  end

end
