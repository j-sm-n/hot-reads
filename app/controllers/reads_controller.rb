class ReadsController < ApplicationController
  def index
    @hot_reads = Read.hot
  end
end
