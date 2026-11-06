require_relative 'tests_helper'

class FieldTest < Minitest::Test

  def test_valid_label
    assert_nil Field.validate!('Question 1', 'single_line')
  end

  def test_empty_label
    assert_raises(ValidationError) do
      Field.validate!('', 'single_line')
    end
  end

  def test_label_with_only_spaces
    assert_raises(ValidationError) do
      Field.validate!('   ', 'single_line')
    end
  end

  def test_label_too_long
    assert_raises(ValidationError) do
      Field.validate!('a' * 51, 'single_line')
    end
  end

  def test_label_at_maximum_length
    assert_nil Field.validate!('a' * 50, 'single_line')
  end

  def test_all_valid_types
    FIELD_TYPES.each do |type|
      assert_nil Field.validate!('Question', type)
    end
  end

  def test_invalid_type
    assert_raises(ValidationError) do
      Field.validate!('Question', 'number')
    end
  end

  def test_empty_type
    assert_raises(ValidationError) do
      Field.validate!('Question', '')
    end
  end

end