class VotesController < ApplicationController
  def create
    work = Work.find_by(id: params[:id].to_i)
    vote = Vote.upvote(work, @current_user)

    if vote
      if vote.save
        flash[:success] = "Successfully upvoted!"
      else
        flash[:warning] =" A problem occurred: Could not upvote"
        vote.errors.messages.each do |field, messages|
          flash[field] = messages
        end
      end
      redirect_to work_path(work .id)
    else
      flash[:warning] = "A problem occurred:  You must be logged in to do that!"
      redirect_to works_path
    end
  end

end
