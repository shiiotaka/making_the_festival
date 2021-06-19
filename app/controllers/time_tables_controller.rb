class TimeTablesController < ApplicationController
  # GET /time_tables/new Prefix => new_time_tables
  def new
    @time_table = TimeTable.new
    @artist = Artist.new
  end

  # POST /time_tables Prefix => time_tables
  def create
    @time_table = TimeTable.new(time_table_params)        # インスタンス変数にTimeTableオブジェクトを代入
    @time_table.user_id = current_user.id                 # @time_tableにcurrent_userのidを代入
    @time_table.save!                                     # インスタンスを保存する(例外を発生させる)
    @artist = Artist.new(artist_params[:artist])          # params[:time_table][:artist][:name]をインスタンス変数に代入
    @artist.save!                                         # インスタンスを保存する(例外を発生させる)
    flash[:success] = '成功'                              # フラッシュメッセージ
    redirect_to root_path                                 # root_pathにリダイレクト
  end

  private

  # String Parameters
  def time_table_params
    params.require(:time_table).permit(:name, :stage)
  end

  def artist_params
    params.require(:time_table).permit(artist:[:name])
  end
end
