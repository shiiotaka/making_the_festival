class TimeTablesController < ApplicationController

  # GET /time_tables/new Prefix => new_time_tables
  def new
    @time_table = TimeTable.new
  end

  private

  # String Parameters
  def time_table_params
    params.require(:time_table).permit(:name, :stage)
  end

end
