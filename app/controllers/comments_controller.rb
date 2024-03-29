class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
    
    # GET /comments or /comments.json
    def index
        @comments = Comment.all
    end
    
    # GET /comments/1 or /comments/1.json
    def show
    end
    
    # GET /comments/new
    def new
        @comment = Comment.new
    end
    
    # GET /comments/1/edit
    def edit
    end
    
    # POST /comments or /comments.json
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        # puts @comment.inspect

        respond_to do |format|
        if @comment.save
            format.html { redirect_to request.referrer, notice: "Comment was successfully created." }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
        end
    end
    
    # PATCH/PUT /comments/1 or /comments/1.json
    def update
        puts "******************************"
        puts comment_params
        respond_to do |format|
        if @comment.update(comment_params)
            format.html { redirect_to request.referrer, notice: "Comment was successfully updated." }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
        end
    end
    
    # DELETE /comments/1 or /comments/1.json
    def destroy
        @comment.destroy
        respond_to do |format|
        format.html { redirect_to request.referrer, notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
        end
    end
    
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_comment
        @comment = Comment.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def comment_params
        params.require(:comment).permit(:comment, :recipe_id, :likes, users_liked:[])
        end
end
