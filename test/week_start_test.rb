require_relative "test_helper"

class WeekStartTest < Minitest::Test
  # week starting on monday

  def test_week_end_of_week_mon
    assert_result_date :week, "2013-03-18", "2013-03-24 23:59:59", false, week_start: :mon
  end

  def test_week_start_of_week_mon
    assert_result_date :week, "2013-03-25", "2013-03-25 00:00:00", false, week_start: :mon
  end

  def test_week_end_of_week_with_time_zone_mon
    assert_result_date :week, "2013-03-11", "2013-03-18 06:59:59", true, week_start: :mon
  end

  def test_week_start_of_week_with_time_zone_mon
    assert_result_date :week, "2013-03-18", "2013-03-18 07:00:00", true, week_start: :mon
  end

  # week starting on saturday

  def test_week_end_of_week_sat
    assert_result_date :week, "2013-03-16", "2013-03-22 23:59:59", false, week_start: :sat
  end

  def test_week_start_of_week_sat
    assert_result_date :week, "2013-03-23", "2013-03-23 00:00:00", false, week_start: :sat
  end

  def test_week_end_of_week_with_time_zone_sat
    assert_result_date :week, "2013-03-09", "2013-03-16 06:59:59", true, week_start: :sat
  end

  def test_week_start_of_week_with_time_zone_sat
    assert_result_date :week, "2013-03-16", "2013-03-16 07:00:00", true, week_start: :sat
  end

  # day of week week start monday

  def test_day_of_week_end_of_day_week_start_mon
    assert_result :day_of_week, 1, "2013-01-01 23:59:59", false, week_start: :mon
  end

  def test_day_of_week_start_of_day_week_start_mon
    assert_result :day_of_week, 2, "2013-01-02 00:00:00", false, week_start: :mon
  end

  def test_day_of_week_end_of_week_with_time_zone_week_start_mon
    assert_result :day_of_week, 1, "2013-01-02 07:59:59", true, week_start: :mon
  end

  def test_day_of_week_start_of_week_with_time_zone_week_start_mon
    assert_result :day_of_week, 2, "2013-01-02 08:00:00", true, week_start: :mon
  end

  # global

  def test_week_start
    Groupdate.week_start = :mon
    assert_result_date :week, "2013-03-18", "2013-03-24 23:59:59"
  ensure
    Groupdate.week_start = :sun
  end

  def test_week_start_and_start_option
    Groupdate.week_start = :mon
    assert_result_date :week, "2013-03-16", "2013-03-22 23:59:59", false, week_start: :sat
  ensure
    Groupdate.week_start = :sun
  end
end
