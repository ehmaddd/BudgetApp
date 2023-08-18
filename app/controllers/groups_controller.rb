class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @groups = current_user.groups
    # @groups.each do |group|
    # group.total_amount = group.deals.sum(:amount)
    @groups = current_user.groups
    @groups.each do |group|
      group_deals = group.deals
      total_amount = group_deals.sum(:amount)
      puts "Group: #{group.name}, Deals: #{group_deals.count}, Total Amount: #{total_amount}"
      group.total_amount = total_amount
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @deals = @group.deals.order(created_at: :desc)
    @total_amount = @deals.sum(:amount)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path, notice: 'Group was successfully destroyed.'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
