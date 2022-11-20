class ApplicationJob < ActiveJob::Base
    queue_as :default
    def perform
        puts "Performing background job"
        sleep 3
        puts "Background job done"
        return "completed"
    end
  end