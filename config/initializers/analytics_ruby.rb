require 'segment/analytics'

Analytics = Segment::Analytics.new({
    write_key: 'N9ehzBighTbavZVRWxXYGzgtC0E5YF5R',
    on_error: Proc.new { |status, msg| print msg }
})