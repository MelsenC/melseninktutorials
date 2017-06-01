class Instructor::SectionsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @section = Section.new
  end
end
