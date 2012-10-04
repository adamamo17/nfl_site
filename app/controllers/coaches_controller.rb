class CoachesController < ApplicationController
  def new
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
end
