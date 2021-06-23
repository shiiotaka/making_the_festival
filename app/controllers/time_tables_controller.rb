class TimeTablesController < ApplicationController
  # GET /time_tables/new Prefix => new_time_tables
  def new
    @time_table = TimeTable.new
    10.times do
      @time_table.artists.build
    end
    # @time_table.artists.build
    # @form = Form::ArtistCollection.new
  end

  # POST /time_tables Prefix => time_tables
  def create
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
    # @artist = Artist.new(artist_params[:artist])          # params[:time_table][:artist][:name]をインスタンス変数に代入
    if @time_table.save
      # @time_table.save!                                     # インスタンスを保存する(例外を発生させる)
      # @artist = Artist.new(artist_params[:artist])          # params[:time_table][:artist][:name]をインスタンス変数に代入
      # @artist.save!                                         # インスタンスを保存する(例外を発生させる)
      # binding.pry
      flash[:success] = '成功' # フラッシュメッセージ
      redirect_to root_path # root_pathにリダイレクト
      # flash.now[:danger] = '失敗'
    else
      flash.now[:danger] = '失敗' # フラッシュメッセージ
      render :new
    end
  end

  private

  # String Parameters
  def time_table_params
    params.require(:time_table).permit(:name, :stage, artists_attributes: %i[id name])
  end

  # String Parameters
  def artist_params
    params.require(:time_table).permit(artist: [:name])
  end

  def artist_collection_params
    params.require(:form_artist_collection).permit(artists_attributes: :name)
  end
end
