class PayementsController < ApplicationController
def create
     #byebug
    @post = Post.find(params[:post_id])
    @payement = @post.payements.create(payement_params)
    @payement.user_id =current_user.id
    @payement.save
    redirect_to new_post_payement_path
  end
 
  private
    def payement_params
      params.require(:payement).permit(:post_id, :email, :card, :exp, :cvv, :user_id)
    end

end
