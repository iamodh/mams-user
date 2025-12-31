require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
    @marathon = @course.marathon
  end


  test "should get new" do
    get new_marathon_course_url(@marathon)
    assert_response :success
  end

  test "should create course" do
    assert_difference("Course.count") do
      post marathon_courses_url(@marathon), params: { course: { capacity: @course.capacity, marathon_id: @course.marathon_id, name: "새로운 코스 이름" } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { capacity: @course.capacity, marathon_id: @course.marathon_id, name: @course.name } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference("Course.count", -1) do
      delete course_url(@course)
    end

    assert_redirected_to marathon_url(@marathon)
  end
end
