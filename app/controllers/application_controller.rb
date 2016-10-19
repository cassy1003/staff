
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :check_auth

  def check_auth
    logger.debug session[:auth_StaffProf_2016_Enechange]
    if session[:auth_StaffProf_2016_Enechange] == 'false'
      redirect_to controller: 'sessions', action: 'login'
    end
  end

  def load_data
    @staffs = Staff.all.sort_by {|staff| staff[:id].to_i}
    @strength_finders = Staff.strength_finders
    @staff_types = Staff.types
  end

  def download_spreadsheet
    Staff.download
    redirect_to({controller: 'home', action: 'index'}, notice: 'downloaded')
  end
end
