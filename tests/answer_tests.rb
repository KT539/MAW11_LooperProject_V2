require_relative 'tests_helper'

class AnswerTest < Minitest::Test

  def setup
    @fields = [
      Field.new('id' => 1, 'label' => 'Question 1', 'type' => 'single_line', 'form_id' => 1),
      Field.new('id' => 2, 'label' => 'Question 2', 'type' => 'multi_line', 'form_id' => 1)
    ]
  end

  def test_valid_answers
    values = {
      '1' => 'Bonjour',
      '2' => 'Comment ça va ?'
    }

    result = Answer.validate_values!(@fields, values)

    assert_equal [
                   [1, 'Bonjour'],
                   [2, 'Comment ça va ?']
                 ], result
  end

  def test_missing_answer
    values = {
      '1' => 'Bonjour'
    }

    result = Answer.validate_values!(@fields, values)

    assert_equal [
                   [1, 'Bonjour'],
                   [2, '']
                 ], result
  end

  def test_empty_hash
    result = Answer.validate_values!(@fields, {})

    assert_equal [
                   [1, ''],
                   [2, '']
                 ], result
  end

  def test_invalid_data_type
    assert_raises(ValidationError) do
      Answer.validate_values!(@fields, ['Bonjour'])
    end
  end

  def test_unknown_field_id
    values = {
      '1' => 'Bonjour',
      '999' => 'Réponse'
    }

    assert_raises(ValidationError) do
      Answer.validate_values!(@fields, values)
    end
  end

  def test_integer_answer
    values = {
      '1' => 123
    }

    assert_raises(ValidationError) do
      Answer.validate_values!(@fields, values)
    end
  end

  def test_answer_at_maximum_length
    values = {
      '1' => 'a' * 250
    }

    assert_equal 250, Answer.validate_values!(@fields, values)[0][1].length
  end

  def test_answer_too_long
    values = {
      '1' => 'a' * 251
    }

    assert_raises(ValidationError) do
      Answer.validate_values!(@fields, values)
    end
  end

  def test_empty_answer
    answer = Answer.new('status' => 'empty')

    assert answer.empty?
    refute answer.long?
  end

  def test_long_answer
    answer = Answer.new('status' => 'answered_long')

    assert answer.long?
    refute answer.empty?
  end

  def test_short_answer
    answer = Answer.new('status' => 'answered')

    refute answer.long?
    refute answer.empty?
  end

end