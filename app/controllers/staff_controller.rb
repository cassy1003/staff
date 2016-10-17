class StaffController < ApplicationController
  before_action :load_data

  def index
    @staff = @staffs.select {|staff| staff[:id] == params[:id]} .first
    if @staff.nil?
      render 'not_found' and return
    end

    if @staff[:slide].present? && !@staff[:slide].include?('https://docs.gooogle.com')
      @staff[:slide] = "https://docs.google.com/a/enechange.co.jp/presentation/d/1NKVXOBMYpLvXbSF9pWLWyl1OM1PenUpap7DRcAHCQcM/embed?start=false&slide=id." + @staff[:slide]
    end
  end
end
