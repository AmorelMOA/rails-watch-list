class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmarks = List.bookmark
  end

  def destroy
    raise
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @list
    else
      render :new
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
