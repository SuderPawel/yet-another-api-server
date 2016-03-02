# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 4.hours do
  runner 'Event.clear_events_older_than(4.hours)'
end

every 8.hours do
  runner 'Api.clear_apis_inactive_than(8.hours)'
end

every 2.days do
  runner 'Api.clear_apis_older_than(2.days)'
end
