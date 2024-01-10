class MonitoringDataController < ApplicationController
    before_action :authenticate, only: [:create]

    def create
        @monitoring_data = MonitoringDatum.new(params.permit(:temperature, :humidity, :lux, :recorded_at))
        if @monitoring_data.save
            render json: @monitoring_data, status: :created
        else
            render json: @monitoring_data.errors, status: :unprocessable_entity
        end
    end

    def monitoring_data_params
        params.permit(:temperature, :humidity, :lux, :recorded_at)
    end

    def authenticate
        authenticate_or_request_with_http_basic do |username, password|
          username == "expected_username" && password == "expected_password"
        end
    end

    def temperature_data
        @temperature = MonitoringDatum.select(:recorded_at, :temperature)
        render json: @temperature
    end
end
