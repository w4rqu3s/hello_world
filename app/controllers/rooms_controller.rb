class RoomsController < ApplicationController
  before_action :set_room, only: [ :show ]

  def index
    @rooms = Room.order(:name)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "Sala criada."
    else
      render :new
    end
  end

  def show
    @messages = @room.messages.order(created_at: :asc).limit(200)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
