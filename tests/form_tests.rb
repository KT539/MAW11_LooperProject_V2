require_relative 'tests_helper'

class FormTest < Minitest::Test

  def test_valid_title
    assert_nil Form.validate!('Mathématiques', 'Building')
  end

  def test_empty_title
    assert_raises(ValidationError) do
      Form.validate!('', 'Building')
    end
  end

  def test_title_with_only_spaces
    assert_raises(ValidationError) do
      Form.validate!('   ', 'Building')
    end
  end

  def test_title_too_long
    assert_raises(ValidationError) do
      Form.validate!('a' * 31, 'Building')
    end
  end

  def test_title_at_maximum_length
    assert_nil Form.validate!('a' * 30, 'Building')
  end

  def test_valid_statuses
    ['Building', 'Answering', 'Closed'].each do |status|
      assert_nil Form.validate!('Test', status)
    end
  end

  def test_invalid_status
    assert_raises(ValidationError) do
      Form.validate!('Test', 'Pending')
    end
  end

  def test_building?
    form = Form.new('id' => 1, 'name' => 'Test', 'status' => 'Building')

    assert form.building?
    refute form.answering?
  end

  def test_answering?
    form = Form.new('id' => 1, 'name' => 'Test', 'status' => 'Answering')

    assert form.answering?
    refute form.building?
  end

  def test_fields_count_is_integer
    form = Form.new(
      'id' => 1,
      'name' => 'Test',
      'status' => 'Building',
      'fields_count' => '3'
    )

    assert_equal 3, form.fields_count
  end

end