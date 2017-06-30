class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to posts_url
    else
      render template: 'users/new'
    end
  end

  # def destroy
  #   p 'my destroy'
  #   sign_out
  #   redirect_to root_url
  # end

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end

    # Overwriting the sign_out redirect path method
    # def after_sign_out_path_for(resource)
    #   p 'after sign out'
    #   redirect_to root_url
    # end
    # def url_after_destroy(resource)
    #   p 'after sign destroy'
    #   redirect_to root_url
    # end

  end



end
