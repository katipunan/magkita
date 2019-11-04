# frozen_string_literal: true

class Admin::CommunitiesController < ApplicationController
  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def edit
    @community = Community.find(params[:id])
  end

  def create
    @community = Community.new(community_params)

    if @community.save
      redirect_to admin_communities_path
    else
      render 'new'
    end
  end

  def update
    @community = Community.find(params[:id])

    if @community.update(community_params)
      redirect_to admin_communities_path
    else
      render 'edit'
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy

    redirect_to admin_communities_path
  end

  private

  def community_params
    params.require(:community).permit(:name, :description)
  end
end
