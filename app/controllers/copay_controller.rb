class CopayController < ApplicationController
    def new
        @copay=Copay.new
    end
    def show
    end

    def edit
    end

    def create
        @copay=Copay.new(copay_params)
    end

    private
    def copay_params
        params.require(:copay).permit(:plan_id, :treatment_id, :in_network, :out_network, :copay_or_coinsurance_in, :copay_or_coinsurance_out, :note)
    end
end
