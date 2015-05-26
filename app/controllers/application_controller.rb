class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_bowtie_user


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
    current_user
  end

  def create_user
    unless User.exists?(bowtie_id: :current_user_id )
      u = User.create(
        :bowtie_id => current_user_id,
        :name => request.headers['HTTP_X_BOWTIE_USER_NAME'],
        :email => request.headers['HTTP_X_BOWTIE_USER_EMAIL']
        )
      end
    end


end
