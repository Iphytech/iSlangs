require 'test_helper'

class SlangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slang = slangs(:one)
  end

  test "should get index" do
    get slangs_url
    assert_response :success
  end

  test "should get new" do
    get new_slang_url
    assert_response :success
  end

  test "should create slang" do
    assert_difference('Slang.count') do
      post slangs_url, params: { slang: { meaning: @slang.meaning, slang: @slang.slang, usage: @slang.usage } }
    end

    assert_redirected_to slang_url(Slang.last)
  end

  test "should show slang" do
    get slang_url(@slang)
    assert_response :success
  end

  test "should get edit" do
    get edit_slang_url(@slang)
    assert_response :success
  end

  test "should update slang" do
    patch slang_url(@slang), params: { slang: { meaning: @slang.meaning, slang: @slang.slang, usage: @slang.usage } }
    assert_redirected_to slang_url(@slang)
  end

  test "should destroy slang" do
    assert_difference('Slang.count', -1) do
      delete slang_url(@slang)
    end

    assert_redirected_to slangs_url
  end
end
