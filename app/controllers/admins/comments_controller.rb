class Admins::CommentsController < ApplicationController

def index
	@comments = Comment.paginate(page: params[:page], per_page: 50)
end


end