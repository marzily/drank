class LandingPagesController < ApplicationController
  def show
  end

  def index
    # yelp_key: 9_qQcq_V7lFmnZ_ciFhAaA
    # yelp_secret: HYenVUIQrC9oCA5_yWNpdhF9_PQ
    # yelp_token: s7DIP3mCa0ampOEw2xMrCBlMfi5Ar_uq
    # yelp_token_secret: vcqOeOXOpOpPX9sYRrxFPpTlDLE
    # google_client_id: 470730291228-cja7fsmc4d0pnegabjqq2k4otleb5dv7.apps.googleusercontent.com
    # google_client_secret: VLVXmxgG9p1Ygt9sTtG7RFt4

    @current_conditions = Weather.current_conditions
  end
end
