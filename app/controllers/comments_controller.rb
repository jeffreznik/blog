class CommentsController < ApplicationController

  http_basic_authenticate_with name: 'jeff', password: 'asdfasdf', only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
