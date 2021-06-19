class TimeTablesController < ApplicationController
  # GET /time_tables/new Prefix => new_time_tables
  def new
    @time_table = TimeTable.new
    @artist = Artist.new
  end

  # POST /time_tables Prefix => time_tables
  def create
    @time_table = TimeTable.new(time_table_params)
    @time_table.user_id = current_user.id
    @time_table.save!
    @artist = Artist.new(artist_params[:artist])
    @artist.save!
    flash[:success] = '成功'
    redirect_to root_path
  end

  private

  # String Parameters
  def time_table_params
    params.require(:time_table).permit(:name, :stage)
  end

  def artist_params
    binding.pry
    params.require(:time_table).permit(artist:[:name])
  end
end
