class CreatePomodoros < ActiveRecord::Migration[8.0]
  def change
    create_table :pomodoros do |t|
      t.references :task, null: false, foreign_key: true
      t.integer :duracao
      t.boolean :concluido
      t.datetime :inicio_task
      t.datetime :fim_task

      t.timestamps
    end
  end
end
