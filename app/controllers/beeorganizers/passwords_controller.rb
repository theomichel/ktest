class Beeorganizers::PasswordsController < Devise::PasswordsController
  include ApplicationHelper

  def new
    super
  end
end
