class AnalyticsController < ApplicationController
    def index
        @apps = App.all
    end

    def show
        
    end

    def sessions
       @play_sessions = PlaySession.group_by(:closed_on)
       render 'sessions'
    end
end
