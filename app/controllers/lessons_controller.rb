class LessonsController < ApplicationController
  before_action :require_authorized_for_current_course, only: [:show]

  def show
  end

  private

  def require_authorized_for_current_course
    if current_user.enrolled_in?(current_lesson.section.course) == false
      flash[:error] = '<strong>Denied:</strong> You cannot view individual lessons unless you are enrolled in the course.'
      redirect_to course_path(current_lesson.section.course)
    end
  end

#  helper_method :current_course
#  def current_course
#    @current_course ||= Course.find(params[:course_id])
#  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
