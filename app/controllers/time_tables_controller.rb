class TimeTablesController < ApplicationController
  # GET /time_tables/new Prefix => new_time_tables
  def new
    @time_table = TimeTable.new
    (0..9).each do |index|
      @time_table.schedules.build(appearance_time: "#{10 + index}:00")
    end
    @artists = Artist.all # 仮で入れているアーティストをselect_collectionで表示できるようにする
  end

  # POST /time_tables Prefix => time_tables
  def create
    @time_table = TimeTable.new(time_table_params)        # インスタンス変数にTimeTableオブジェクトを代入
    @time_table.user_id = current_user.id                 # @time_tableにcurrent_userのidを代入
    if @time_table.save
      flash[:success] = 'タイムテーブルが作成されました'
      redirect_to root_path # root_pathにリダイレクト
    else
      flash.now[:danger] = 'タイムテーブルの作成に失敗しました'
      render :new
    end
  end

  # GET /time_tables/:id
  def show
    @time_table = TimeTable.find(params[:id])
    @artists = @time_table.artists
    # @artist = Artist.find(params[:id])
    # @time = 21.times.map.each_with_index {|i| Time.parse("10:00")+30.minutes*i}
    @user = User.find(params[:id])
  end

  private

  # StrongParameters
  def time_table_params
    params.require(:time_table).permit(:name, :stage, :commitment, schedules_attributes: %i[id appearance_time artist_id])
  end
end
