class AnalyticsController < ApplicationController
    def index
        @apps = App.all
    end

    def show
        
    end

    def charts
        render 'charts'
    end

    def sessions
      if params[:unique] == "true"
        Rails.logger.info "Doing the unique sessions"
        return unique_sessions
      else
        Rails.logger.info "Doing non unique. #{params[:unique]}"
      end
       #Fanangle the data a bit to make it work with chartkick, which takes a hash from time to count
       sessions_data = PlaySession.group_by(:closed_on)
       @play_sessions = {}
       sessions_data.each do|sess|
         tim = sess[:_id]
         @play_sessions[DateTime.new(tim[:year], tim[:month], tim[:day])] = sess[:count]
       end
       render json: @play_sessions
    end

    def unique_sessions
      # Grab all sessions, sorted by user_id, closed_on
      # This allows us to just grab the first of each user_id
      sessions_data = PlaySession.where(:closed_on => {:$exists => true}).asc(:user_id).asc(:closed_on)
      @play_sessions = {}
      last_id = nil
      sessions_data.each do |sess|
        # Skip over any that have the same ID as the previous
        if(last_id == sess.user_id)
          next
        end
        last_id = sess.user_id
        # Accumulate in the date map
        date = DateTime.new(sess.closed_on.year, sess.closed_on.month, sess.closed_on.day)
        @play_sessions[date] = @play_sessions[date].to_i + 1
      end
      render json: @play_sessions
    end
end
