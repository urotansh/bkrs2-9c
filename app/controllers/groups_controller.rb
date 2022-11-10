class GroupsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def index
    @book = Book.new
    @groups = Group.all
  end
  
  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def show
    @group = Group.find(params[:id])
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
  
  def is_matching_login_user
    owner_id = Group.find(params[:id]).owner_id.to_i
    login_user_id = current_user.id
    if owner_id != login_user_id
      redirect_to groups_path
    end
  end
  
end
