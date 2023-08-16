class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
    authorize! :read, Group
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
