require "test_helper"

class RegistrationTest < ActiveSupport::TestCase
  def setup
    @course = courses(:one)
    @registration = Registration.new(
      name: "홍길동",
      date_of_birth: "1999-01-01",
      phone: "010-1234-1234",
      address: "부산 광역시 남구 대연동 123-123",
      status: :active,
      course: @course,
    )
  end

  test "모든 필수 값이 정상이면 유효하다" do
    assert @registration.valid?
  end

  test "이름은 10글자 이하여야 한다" do
    @registration.name = "A" * 11

    assert_not @registration.valid?
    aasert_includes @registration.errors[:name], "length must be 1 ~ 10"
  end

  test "생년월일 형식이 맞지 않는 경우 오류가 발생한다" do
  end

  test "휴대폰 번호 형식이 맞지 않는 경우 오류가 발생한다" do
  end

  test "주소는 40글자 이하여야 한다" do
  end

  test "상태는 0, 1, 2 중 하나여야 한다" do
  end

  test "같은 코스 내에서 이름과 휴대폰 번호 조합은 유일해야 한다" do
  end
end
