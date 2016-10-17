class SessionsController < ApplicationController
  skip_before_action :check_auth

  def login
    session[:auth_StaffProf_2016_Enechange] = 'false'
  end

  def auth
    # ざっくり認証
    if params['id'] == 'enechange' && params['pw'] == 'changechange2016'
      session[:auth_StaffProf_2016_Enechange] = 'true'
      redirect_to controller: 'home', action: 'index'
    else
      session[:auth_StaffProf_2016_Enechange] = 'false'
      redirect_to({action: 'login'}, notice: 'error')
    end
  end
end
