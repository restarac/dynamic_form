class FormAnswersController < ApplicationController
  before_action :find_form_answer, only: [:show, :new_answer, :save_answer, :edit, :update, :destroy]
  before_action :find_form_fields, only: [:show, :new_answer, :save_answer, :edit, :update]

  # GET /form_answers
  def index
    @form_answers = FormAnswer.all
  end

  # GET /form_answers/1
  def show
  end
  
  # GET /form_answers/1/new_answer
  def new_answer
  end
  
  # POST /form_answers/1/new_answer
  def save_answer
    save_or_update
    
    if !@errors
      redirect_to form_answer_path, notice: 'Your answer was successfully saved.'
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
  end

  # POST /form_answers
  def create
    @form_answer = FormAnswer.new(form_answer_params)

    if @form_answer.save
      redirect_to new_answer_form_answer_path(@form_answer), notice: 'Now you can answer the folowing questions.'
    else
      render :new
    end
  end

  # PATCH/PUT /form_answers/1
  def update
    save_or_update
    
    if !@errors
      redirect_to form_answer_path(@form_answer), notice: 'Form answer was successfully updated.'
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
    def form_answer_params
      params.require(:form_answer).permit(:custom_form_id)
    end

    def find_form_answer
      @form_answer = FormAnswer.find(params[:id])
    end

    def find_form_fields
      @fields = @form_answer.list_form_fields
    end

    def save_or_update
      @fields.each do |field|
        value_answer = params["answer_#{field.id}".to_sym]
        
        #TODO: pensar numa forma melhor de passar a lista de checkbox como parametro
        if (field.type == "CustomFormCheckboxField")
          value_answer = value_answer.to_a.map{|i| i[1]}.join(', ')
        end
        
        break if @errors = @form_answer.save_or_update_answer(field, value_answer)
      end
    end
end
