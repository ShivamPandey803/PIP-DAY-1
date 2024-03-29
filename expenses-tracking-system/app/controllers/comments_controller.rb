class CommentsController < ApplicationController
  before_action :set_ledger, only: [:index, :create]
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /ledgers/:ledger_id/comments
  def index
    comments = @ledger.comments
    render json: comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /ledgers/:ledger_id/comments
  def create
    comment = @ledger.comments.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_ledger
    @ledger = Ledger.find(params[:ledger_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :body)
  end
end
