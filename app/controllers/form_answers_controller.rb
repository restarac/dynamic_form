class FormAnswersController < ApplicationController
  # GET /form_answers
  def index
    @form_answers = FormAnswer.all
  end

  # GET /form_answers/1
  def show
    @form_answer = FormAnswer.find(params[:id])
    @fields = @form_answer.custom_form.custom_form_fields
  end
  
  # GET /form_answers/1/new_answer
  def new_answer
    @form_answer = FormAnswer.find(params[:id])
    @fields = CustomFormField.where(custom_form_id: @form_answer.custom_form.id).order(:order, :title)
  end
  
  # POST /form_answers/1/new_answer
  def save_answer
    save_or_update
    
    if !@errors
      redirect_to answer_form_path, notice: 'Form answer was successfully created.'
    else
      render :new_answer
    end
  end

  # GET /form_answers/new
  def new
    @form_answer = FormAnswer.new
  end

  # GET /form_answers/1/edit
  def edit
    @form_answer = FormAnswer.find(params[:id])
    @fields = CustomFormField.where(custom_form_id: @form_answer.custom_form.id).order(:order, :title)    
  end

  # POST /form_answers
  def create
    @form_answer = FormAnswer.new(form_answer_params)

    if @form_answer.save
      redirect_to new_answer_form_answer_path(@form_answer), notice: 'Form answer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /form_answers/1
  def update
    save_or_update
    
    if !@errors
      redirect_to @form_answer, notice: 'Form answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /form_answers/1
  def destroy
    @form_answer = FormAnswer.find(params[:id])
    @form_answer.destroy
    redirect_to form_answers_url, notice: 'Form answer was successfully destroyed.'
  end

  private
    def form_answer_params
      params.require(:form_answer).permit(:custom_form_id)
    end
    
    def save_or_update
      @form_answer = FormAnswer.find(params[:id])
      @fields = CustomFormField.where(custom_form_id: @form_answer.custom_form.id).order(:order, :title) 
      
      @fields.each do |field|
        value_answer = params["answer_#{field.id}".to_sym]      
        @errors = @form_answer.save_or_update_answer field, value_answer
        if !@errors
          break
        end
      end
    end
end
