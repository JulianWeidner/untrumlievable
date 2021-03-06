class FakerSessionsController < ApplicationController
  def new
    @faker = Faker.new
  end

  def create
    @faker = login(params[:email], params[:password])

    if @faker
      redirect_back_or_to(faker_path(@faker), notice: "Login Successful")
      session[:current_user_id] = @faker.id
    else
      flash.now[:alert] = "Login Failed"
      render action: 'new'
    end 
  end

  def destroy
    logout
    redirect_to(:fakers, notice: "Logged out")
  end
end
