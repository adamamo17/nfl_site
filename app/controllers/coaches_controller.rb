class CoachesController < ApplicationController
  def new
    @coach = Coach.new
  end

  def index
    @coaches = Coach.all
  end

  def show
    @coach = Coach.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @coach }
      format.json { render :json => @coach }
    end
  end

  def create
    @coach = Coach.new(params[:coach])
    if @coach.save
      flash[:success] = "Welcome Coach!"
      redirect_to @coach
    else
      render 'new'
    end
  end
end
