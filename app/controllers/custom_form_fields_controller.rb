class CustomFormFieldsController < ApplicationController
  before_action :set_custom_form_field, only: [:edit, :update, :destroy]
  before_action :fill_form, only: [:new, :edit]

  # GET /custom_forms/1/fields/new
  def new
    @custom_form_field = CustomFormField.new
    @custom_form_field.custom_form = CustomForm.find(params[:custom_form_id])
  end

  # GET /custom_forms/1/fields/1/edit
  def edit
  end

  # POST /custom_forms/1/fields
  def create
    @custom_form_field = CustomFormField.new(custom_form_field_params)
    @custom_form_field.custom_form = CustomForm.find(params[:custom_form_id])

    if @custom_form_field.save
      redirect_to new_custom_form_field_path(@custom_form_field.custom_form), notice: 'Custom form field was successfully created.'
    else
      fill_form
      render :new
    end
  end

  # PATCH/PUT /custom_forms/1/fields/1
  def update
    param_value = custom_form_field_params(@custom_form_field.class.name)
    if @custom_form_field.update(param_value)
      redirect_to new_custom_form_field_path(@custom_form_field.custom_form), notice: 'Custom form field was successfully updated.'
    else
      fill_form
      render :edit
    end
  end

  # DELETE /custom_forms/1/fields/1
  def destroy
    @custom_form_field.destroy
    redirect_to new_custom_form_field_path(@custom_form_field.custom_form), notice: 'Custom form field was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_form_field
      @custom_form_field = CustomFormField.find(params[:id])
    end
    
    def fill_form
        @type_values = CustomFormField.subclasses.map {|i| [i, i]}
        @fields = CustomFormField.where(custom_form_id: params[:custom_form_id])
    end

    def custom_form_field_params class_name="CustomFormField"
      #the STI pattern chenges the name for diferent types chosen
      param_name = class_name.underscore.to_sym
      params.require(param_name).permit(:order, :title, :value, :type)
    end
end
