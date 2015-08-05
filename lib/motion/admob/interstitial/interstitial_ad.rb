module Motion::Admob::Interstitial
  class InterstitialAd
    def initialize(options={})
      @callbacks = {}
      @ad_unit_id = options[:ad_unit_id]
      @once_a_nth = options[:once_a_nth] || 1
      @auto_reload = !!options[:auto_reload]
      raise "ad_unit_id is missing" unless @ad_unit_id
      request
    end

    def present(controller)
      if rand(@once_a_nth) == 0
        @interstitial.presentFromRootViewController controller
      end
    end

    def callback(type, &block)
      @callbacks[type] = block
    end

    def interstitialDidReceiveAd(interstitial)
      @callbacks[:did_receive_ad].call(interstitial) if @callbacks[:did_receive_ad]
    end

    def interstitial(interstitial, didFailToReceiveAdWithError:error)
      @callbacks[:error].call(interstitial, error) if @callbacks[:error]
    end
    
    def interstitialWillPresentScreen(interstitial)
      @callbacks[:will_present_screen].call(interstitial) if @callbacks[:will_present_screen]
    end

    def interstitialWillDismissScreen(interstitial)
      @callbacks[:will_dismiss_screen].call(interstitial) if @callbacks[:will_dismiss_screen]
    end

    def interstitialDidDismissScreen(interstitial)
      request if @auto_reload
      @callbacks[:did_dismiss_screen].call(interstitial) if @callbacks[:did_dismiss_screen]
    end

    def interstitialWillLeaveApplication(interstitial)
      @callbacks[:will_leave_application].call(interstitial) if @callbacks[:will_leave_application]
    end

    private

    def request
      @interstitial = GADInterstitial.alloc.init
      @interstitial.delegate = self
      @interstitial.adUnitID = @ad_unit_id
      @interstitial.loadRequest GADRequest.request
    end
  end
end
