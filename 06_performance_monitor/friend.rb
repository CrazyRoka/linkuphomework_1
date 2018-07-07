def measure(number_of_repetitions = 1)
  cur_time = Time.now
  number_of_repetitions.times { yield }
  (Time.now - cur_time) / number_of_repetitions.to_f
end