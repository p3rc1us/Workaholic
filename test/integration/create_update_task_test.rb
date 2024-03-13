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

  #proceed to show/check

  assert_select "span", text: "new task for test", wait: 10

  #proceed to edit task

  get edit_category_task_path(tasks(:two).category, tasks(:two))

  patch category_task_path, params: {
    task: {
      name: "updated task from test"
    }
  }

  assert :redirect
  follow_redirect!
  assert_response :success

  #proceed to check

  assert_select "span", text: "updated task from test"

  #proceed to delete

  assert_difference("Task.count", -1) do
    delete category_task_path(tasks(:two).category, tasks(:two))
  end

  #proceed to sign out

  sign_out users(:two)

  end
end
