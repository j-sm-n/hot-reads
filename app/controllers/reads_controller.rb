class ReadsController < ApplicationController
  def index
    @hot_reads = Read.hot

    respond_to do |format|
      format.json { render json: @hot_reads }
      format.html
    end
  end

  def create
    @read = Read.find_or_initialize_by(url: params[:url])
    @read.count += 1
    if @read.save
      render json: @read, status: 201
    else
      render json: @read.errors.full_messages, status: 500
    end
  end
end
