require "test_helper"

class CreateUpdateTaskTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "create_update_task" do

  sign_in users(:two)

  get new_category_task_path(tasks(:two).category)

  #create task

  post category_tasks_path, params: {
    task: {
      name: "new task for test"
    }
  }

  assert :redirect
  follow_redirect!
  assert_response :success

  #show/check

  assert_select "span", text: "new task for test", wait: 10

  #edit task

  get edit_category_task_path(tasks(:two).category, tasks(:two))

  patch category_task_path, params: {
    task: {
      name: "updated task from test"
    }
  }

  assert :redirect
  follow_redirect!
  assert_response :success

  #check

  assert_select "span", text: "updated task from test"

  #delete

  assert_difference("Task.count", -1) do
    delete category_task_path(tasks(:two).category, tasks(:two))
  end

  #sign out

  sign_out users(:two)

  end
end
