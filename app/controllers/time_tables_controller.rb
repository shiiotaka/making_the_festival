class TimeTablesController < ApplicationController
  # GET /time_tables/new Prefix => new_time_tables
  def new
    @time_table = TimeTable.new
    (0..9).each do |index|
      @time_table.schedules.build(appearance_time: "#{10 + index}:00")
      # @time_table.artists.build# (appearance_time: "#{10 + index}")
    end
    @artists = Artist.all
    # @time_tbale.artists.build
    # 10.times do
    #   @time_table.artists.build
    # end
    # @time_table.artists.build
    # @form = Form::ArtistCollection.new
  end

  # POST /time_tables Prefix => time_tables
  def create
    # binding.pry
    # @form = Form::ArtistCollection.new(artist_collection_params)
    # if @form.save
    #   flash[:success] = '成功'
    #   redirect_to root_path
    # else
    #   flash[:danger] = '失敗'
    #   render :new
    # end
    @time_table = TimeTable.new(time_table_params)        # インスタンス変数にTimeTableオブジェクトを代入
    @time_table.user_id = current_user.id                 # @time_tableにcurrent_userのidを代入
    # binding.pry
    # @artist = Artist.new(artist_params[:artist])          # params[:time_table][:artist][:name]をインスタンス変数に代入
    # @time_table.artist_id = Artist.find(params[:artist_id])                # @time_tableにcurrent_userのidを代入
    if @time_table.valid?
      @time_table.save
      # @time_table.save!                                     # インスタンスを保存する(例外を発生させる)
      # @artist = Artist.new(artist_params[:artist])          # params[:time_table][:artist][:name]をインスタンス変数に代入
      # @artist.save!                                         # インスタンスを保存する(例外を発生させる)
      # binding.pry
      flash[:success] = '成功' # フラッシュメッセージ
      redirect_to root_path # root_pathにリダイレクト
      # flash.now[:danger] = '失敗'
    else
      # rescue
      # binding.pry
      flash.now[:danger] = '失敗' # フラッシュメッセージ
      render :new
    end
  end

  private

  # String Parameters
  def time_table_params
    # params.require(:time_table).permit(:name, :stage, :commitment, artists_attributes: %i[id name], schedules_attributes: %i[id appearance_time artist_id])
    params.require(:time_table).permit(:name, :stage, :commitment, schedules_attributes: %i[id appearance_time artist_id])
  end

  # String Parameters
  def artist_params
    params.require(:time_table).permit(artist: [:name])
  end

  def artist_collection_params
    params.require(:form_artist_collection).permit(artists_attributes: :name)
  end
end
