require 'pinchoff'

describe Pinchoff::Throttler do

  it 'throttles the execution of a block' do
    interval = 0.1

    throttler = Pinchoff::Throttler.new(interval)

    times = 10.times.collect do
      throttler.throttle { Time.now.utc }
    end

    times.inject(times.shift) do |prev_time, cur_time|
      expect(cur_time - prev_time).to be >= interval
      puts cur_time - prev_time
      cur_time
    end
  end

end
