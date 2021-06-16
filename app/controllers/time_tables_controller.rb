class TimeTablesController < ApplicationController

  # GET /time_tables/new Prefix => new_time_tables
  def new
    @time_table = TimeTable.new
  end

end
