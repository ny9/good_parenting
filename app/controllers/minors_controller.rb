class MinorsController < ApplicationController
	
  def index
  end

  def show
  end

  def new
    @minor = Minor.new
  end

  def edit
    logger.debug("user-controller-edit #{params.inspect}")

  end

  def create
    logger.debug("minors-controller - #{params.inspect}")

    activation_token = rand(36**10).to_s(36)
    minor = Minor.new
    minor.first_name = params[:minor][:first_name]
    minor.last_name = params[:minor][:last_name]
    minor.minor_email = params[:minor][:minor_email]
    minor.user_id = params[:minor][:user_id]
    minor.activation_token = activation_token
    # logger.debug("minors-controller - #{minor_first_name.inspect}******#{minor_last_name}*********#{minor_email}**********#{}")
    minor.save

    # MinorInviteMailer.invite_minor(activation_token, params[:minor][:first_name] ).deliver

    redirect_to root_path
  end



  def update
  end

  def destroy
  end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def week_params
    params.require(:minor).permit(:first_name, :last_name, :minor_email)
  end


end
