class UserController < ApplicationController
        before_action :set_user, only: %i[ show edit update destroy ]
        # GET /users
      def index
        @users = User.all
      end

      def new
        @user = User.new
      end
  
      def create
          @user = User.new(user_params)
          respond_to do |format|
            if @user.save
              format.html { redirect_to root_path, notice: "Runner was successfully created." }
              format.json { render :show, status: :created, location: @user }
            else
              render :new
            end
      end  

      def update
        respond_to do |format|
          if @user.update(runner_params)
            format.html { redirect_to runner_url(@user), notice: "Runner was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

        
        def show
        end
      
      
        def edit
        end
      

      def destroy
          @user.destroy
      
          respond_to do |format|
            format.html { render :new, notice: "Runner was successfully destroyed." }
            format.json { head :no_content }
          end
        end

end        

private

def user_params
  params.require(:user).permit(:email, :password, :password_confirmation, :name, :age, :status, :bio)
end

def set_user
  @user = User.find(params[:id])
end

end