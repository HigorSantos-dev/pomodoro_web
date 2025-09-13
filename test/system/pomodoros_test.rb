require "application_system_test_case"

class PomodorosTest < ApplicationSystemTestCase
  setup do
    @pomodoro = pomodoros(:one)
  end

  test "visiting the index" do
    visit pomodoros_url
    assert_selector "h1", text: "Pomodoros"
  end

  test "should create pomodoro" do
    visit pomodoros_url
    click_on "New pomodoro"

    check "Concluido" if @pomodoro.concluido
    fill_in "Duracao", with: @pomodoro.duracao
    fill_in "Fim task", with: @pomodoro.fim_task
    fill_in "Inicio task", with: @pomodoro.inicio_task
    fill_in "Task", with: @pomodoro.task_id
    click_on "Create Pomodoro"

    assert_text "Pomodoro was successfully created"
    click_on "Back"
  end

  test "should update Pomodoro" do
    visit pomodoro_url(@pomodoro)
    click_on "Edit this pomodoro", match: :first

    check "Concluido" if @pomodoro.concluido
    fill_in "Duracao", with: @pomodoro.duracao
    fill_in "Fim task", with: @pomodoro.fim_task.to_s
    fill_in "Inicio task", with: @pomodoro.inicio_task.to_s
    fill_in "Task", with: @pomodoro.task_id
    click_on "Update Pomodoro"

    assert_text "Pomodoro was successfully updated"
    click_on "Back"
  end

  test "should destroy Pomodoro" do
    visit pomodoro_url(@pomodoro)
    click_on "Destroy this pomodoro", match: :first

    assert_text "Pomodoro was successfully destroyed"
  end
end
