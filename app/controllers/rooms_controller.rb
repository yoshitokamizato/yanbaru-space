class RoomsController < ApplicationController

  def index
    @currentEntries = current_user.entries
     myRoomIds = @currentEntries.map { |entry| entry.room.id }
    @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @direct_messages = @room.direct_messages
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create(name: "DM")
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = @roome.entries.create(entry_params)
    redirect_to @room
  end

  def destroy
      room = Room.find(params[:id])
      room.destroy
      redirect_to users_rooms_path
  end

  private

  def entry_params
    params.require(:entry).permit(:user_id, :room_id)
  end

end
