class Qlt::ParamsMapper

  class << self
    def for_lookup params
      new(params).for_lookup
    end

    def for_create params
      new(params).for_create
    end
  end

  def initialize params
    @params = params
  end

  def for_lookup
    {
      wireless: @params.fetch(:with_wireless, true),
      lng: @params[:longitude],
      lat: @params[:latitude],
      price: true,
      sla: @params.fetch(:sla, 'economy'),
      speed: @params[:speed],
      term: @params[:contract_length],
    }
  end

  def for_create
    for_lookup.merge!({
      am_name: @params[:account_manager],
      company_name: @params[:company_name],
      address: @params[:address],
      OPT_ref: @params[:opt_ref]
    })
  end


end