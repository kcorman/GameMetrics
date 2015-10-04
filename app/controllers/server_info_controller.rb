class ServerInfoController < ApplicationController

    def leader
        render json: {:leader => "http://192.168.1.130:3000" }
    end
end
