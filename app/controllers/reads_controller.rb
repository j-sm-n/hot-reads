class ReadsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @hot_reads = Read.hot
  end

  def create
    @read = Read.new(read_params)
    if @read.save
      render json: @read, status: 201
    else
      render json: @read.errors.full_messages, status: 500
    end
  end

  private

  def read_params
    params.permit(:title, :url)
  end
end
