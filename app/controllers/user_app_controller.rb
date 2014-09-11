class UserAppController < ApplicationController
	private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user_app = User.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user_app).permit(:user, :app, :user_id, :app_id)
    end
end
