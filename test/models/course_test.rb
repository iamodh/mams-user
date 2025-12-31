require "test_helper"

class CourseTest < ActiveSupport::TestCase
  def setup
    @marathon = marathons(:one)
    @course = Course.new(
      name: "10km",
      capacity: 10,
      marathon: @marathon
    )
  end

  test "모든 필수 값이 정상이면 유효하다" do
    assert @course.valid?
  end

  test "이름이 빈 경우 오류가 발생한다" do
    @course.name = ""

    assert_not @course.valid?
    assert_includes @course.errors[:name], "can't be blank"
  end

  test "최소 모집 인원은 1명이여야 한다" do
    @course.capacity = 0

    assert_not @course.valid?
    assert_includes @course.errors[:capacity], "must be greater than or equal to 1"
  end

  test "이름이 10글자 이상인 경우 오류가 발생한다" do
    @course.name = "A" * 11

    assert_not @course.valid?
    assert_includes @course.errors[:name], "length must be 1 ~ 10"
  end

  test "같은 마라톤 내에서 코스 이름은 유일해야 한다" do
    duplicate_course = @course.dup
    duplicate_course.save!

    new_course = Course.new(
      name: @course.name,
      capacity: 50,
      marathon: @marathon
    )

    assert_not new_course.valid?
    assert_includes new_course.errors[:name], "already exists in this marathon"
  end

  # test "모집 인원이 모두 찼을 경우 마감 상태다" do
  # end
end
