class PomodorosController < ApplicationController
  before_action :set_pomodoro, only: %i[ show edit update destroy ]

  # GET /pomodoros or /pomodoros.json
  def index
    @pomodoros = Pomodoro.all
  end

  # GET /pomodoros/1 or /pomodoros/1.json
  def show
  end

  # GET /pomodoros/new
  def new
    @pomodoro = Pomodoro.new
  end

  # GET /pomodoros/1/edit
  def edit
  end

  # POST /pomodoros or /pomodoros.json
  def create
    @pomodoro = Pomodoro.new(pomodoro_params)

    respond_to do |format|
      if @pomodoro.save
        format.html { redirect_to @pomodoro, notice: "Pomodoro was successfully created." }
        format.json { render :show, status: :created, location: @pomodoro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pomodoros/1 or /pomodoros/1.json
  def update
    respond_to do |format|
      if @pomodoro.update(pomodoro_params)
        format.html { redirect_to @pomodoro, notice: "Pomodoro was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @pomodoro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pomodoros/1 or /pomodoros/1.json
  def destroy
    @pomodoro.destroy!

    respond_to do |format|
      format.html { redirect_to pomodoros_path, notice: "Pomodoro was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pomodoro
      @pomodoro = Pomodoro.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pomodoro_params
      params.expect(pomodoro: [ :task_id, :duracao, :concluido, :inicio_task, :fim_task ])
    end
end
