class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user_id
    request.headers['HTTP_X-BOWTIE_USER_ID']
  end

  def current_user
    User.find_by bowtie_id: current_user_id
  end


  private

  def verify_bowtie_user
    if current_user_id.nil?
      respond_to do |format|
        format.json { render json: { status: :error, message: "Not Authorized" }, status: 403 }
      end
      return false
    end
    



end
