require 'semaphore'

module Pinchoff

  class Throttler

    @@default_interval = 5

    def self.default_interval
      @@default_interval
    end

    def self.default_duration=(default_interval)
      @@default_duration = Float(default_interval)
    end

    attr_reader :interval

    def initialize(interval = Throttler.default_interval)
      @interval = Float(interval)
      @clearance = CountingSemaphore.new(1)
      @renew_clearance = CountingSemaphore.new(0)
      @worker = _start_worker_thread
    end

    def throttle
      @clearance.down
      begin
        # Execute the throttled operation.
        out = yield if block_given?
      rescue
        @clearance.up
      else
        @renew_clearance.up
      end
      out
    end

    protected

    def _start_worker_thread
      t = Thread.new do
        loop do
          @renew_clearance.down
          sleep(@interval)
          @clearance.up
        end
      end
      t.abort_on_exception = true
      t
    end

  end

end
