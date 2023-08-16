class DealsController < ApplicationController
  before_action :set_group, only: [:index, :new, :create]

  def index
    @group = Group.find(params[:group_id]) # Find the group based on the group_id parameter
    @deals = @group.deals.where(author: current_user).order(created_at: :desc) # Only show deals for the current user in the current group
    @total_amount = @deals.sum(:amount)
  end

  def new
    @group = Group.find(params[:group_id])
    @deal = @group.deals.new
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.author = current_user

  if @deal.save
    @group = Group.find(params[:group_id])
    @deal.groups << @group # Associate the deal with the group
    redirect_to group_deals_path(@group), notice: 'Deal was successfully created.'
  else
    render :new
  end
end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def deal_params
    params.require(:deal).permit(:name, :amount)
  end
end
