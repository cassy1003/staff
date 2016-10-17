class ApiController < ApplicationController
  before_action :load_data
  def staffs
    result = {}
    if params[:type] == 'corporate'
      result = @staffs.select {|staff| staff[:id].to_i < 100000}.map do |staff|
        {
          name: {
            jp: staff[:familyname][:jp] ? staff[:familyname][:jp] + ' ' + staff[:firstname][:jp] : nil,
            en: staff[:firstname][:en] + ' ' + staff[:familyname][:en]
          },
          roll: staff[:roll],
          image: staff[:image],
          about: staff[:about],
          comment: staff[:comment]
        }
      end
    end
    render json: result.to_json
  end
end
