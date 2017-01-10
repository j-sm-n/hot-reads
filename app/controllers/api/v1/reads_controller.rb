class Api::V1::ReadsController < ApplicationController

  def create
    @link = Read.new( title: link_params[:title],
                      url: link_params[:url],
                      user_id: current_user.id )
    if @link.save
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Read.find params[:id]
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      Read.create(link: @link) if just_read
      head :no_content
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def index
    @links = Read.where(user_id: current_user.id)
    if @links
      render json: @links, status: 200
    else
      render json: { "error": "No links for you"}, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read, :id)
  end
end
