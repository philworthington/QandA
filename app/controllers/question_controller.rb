class QuestionController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]


  def index
    @questions = Question.all.sort_by {|q| q.has_been_updated_by_user?(current_user) ? 0 : 1}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end


  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end


  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end


  def edit
    @question = Question.find(params[:id])
  end


  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        update_user_question_associations
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html {
          flash[:alert] = "Question has not been created."
          render action: "new"
        }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @question = Question.find(params[:id])
    update_user_question_associations

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question has been deleted"

    respond_to do |format|
      format.html { redirect_to question_url }
      format.json { head :no_content }
    end
  end

private
  def update_user_question_associations
    @question.users << current_user
  end
end
