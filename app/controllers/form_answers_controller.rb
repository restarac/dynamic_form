class FormAnswersController < ApplicationController
  before_action :set_form_answer, only: [:show, :edit, :update, :destroy]

  # GET /form_answers
  def index
    @form_answers = FormAnswer.all
  end

  # GET /form_answers/1
  def show
  end

  # GET /form_answers/new
  def new
    @form_answer = FormAnswer.new
  end

  # GET /form_answers/1/edit
  def edit
  end

  # POST /form_answers
  def create
    @form_answer = FormAnswer.new(form_answer_params)

    if @form_answer.save
      redirect_to @form_answer, notice: 'Form answer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /form_answers/1
  def update
    if @form_answer.update(form_answer_params)
      redirect_to @form_answer, notice: 'Form answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /form_answers/1
  def destroy
    @form_answer.destroy
    redirect_to form_answers_url, notice: 'Form answer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_answer
      @form_answer = FormAnswer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_answer_params
      params.require(:form_answer).permit(:custom_form_id)
    end
end
