class WorksController < ApplicationController
  def index
    @current_user = User.find_by(id: session[:user_id])

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
      flash[:success] = "Work Created!"
      redirect_to work_path(@work .id)
    else
      flash.now[:danger] = "Work not created."
      @work.errors.messages.each do |field, messages|
        flash.now[field] = messages
      end
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id].to_i)
  end

  def update
    @work = Work.find(params[:id].to_i)
    if @work.update(work_params)
      flash[:success] = "Work Updated!"
      redirect_to work_path(@work .id)
    else
      flash.now[:danger] = "Work not edited."
      @work.errors.messages.each do |field, messages|
        flash.now[field] = messages
      end
      render :edit
    end
  end

  def destroy
    id = params[:id]
    work = Work.find_by(id: id)
    if work.destroy
      flash[:success] = "Work #{work.id} deleted!"
      redirect_to root_path
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :description, :publication_year, :creator, :category)
  end

end
