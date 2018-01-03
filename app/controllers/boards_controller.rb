class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @like = Like.where(user_id: current_user.id, board_id: params[:id])
    puts @like.length
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = current_user.boards.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    puts "삭제 요청옴"
    @board.destroy
    puts "삭제됨"
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_like_board
    @like = Like.where(user_id: current_user.id, board_id: params[:board_id]).first
    # 만약에 좋아요를 이미 누른 상태라면
    unless @like.nil?
      @like.destroy
      puts '좋아요 취소'
    # 만약에 처음 좋아요를 누른 상태라면
    else
      @like = Like.create(user_id: current_user.id, board_id: params[:board_id])
      puts '좋아요 누름'
    end
    # sleep(5)
  end

  def create_comment
    @comment = Comment.create(user_id: current_user.id, board_id: params[:id], contents: params[:contents])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, :contents)
    end
end
