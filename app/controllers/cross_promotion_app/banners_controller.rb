# frozen_string_literal: true

module CrossPromotionApp
  class BannersController < ApplicationController
    protect_from_forgery with: :null_session
    layout 'cross_promotion_app'

    before_action :authenticate
    before_action :find_banner, only: %i[edit update activate deactivate destroy]

    # GET /cross_promotion_app
    def index
      @banners = CrossPromotionApp::Banner.all.order(active: :desc)
    end

    # GET /cross_promotion_app/banners/new
    def new
      @banner = CrossPromotionApp::Banner.new
    end

    # POST /cross_promotion_app/banners
    def edit; end

    # GET /cross_promotion_app/banners/:id/edit
    def create
      @banner = CrossPromotionApp::Banner.new(banner_params)

      respond_to do |format|
        if @banner.save
          format.html { redirect_to '/cross_promotion_app', notice: t('.success') }
          format.json { render :index, status: :created, location: @banner }
        else
          format.html { render :new, status: :unprocessable_entity, notice: t('.error') }
          format.json { render json: @banner.errors, status: :unprocessable_entity }
        end
      end
    end

    # POST /cross_promotion_app/banners/:id
    def update
      respond_to do |format|
        if @banner.update(banner_params)
          format.html { redirect_to '/cross_promotion_app', notice: t('.success') }
          format.json { render :index, status: :ok, location: @banner }
        else
          format.html { render :edit, status: :unprocessable_entity, notice: t('.error') }
          format.json { render json: @banner.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /cross_promotion_app/banners/:id/activate
    def activate
      respond_to do |format|
        if @banner.update(active: true) && CrossPromotionApp::Banner.where.not(id: @banner.id).update_all(active: false)
          format.html { redirect_to '/cross_promotion_app', notice: t('.success') }
          format.json { render :index, status: :ok, location: @banner }
        else
          format.html { render :edit, status: :unprocessable_entity, notice: t('.error') }
          format.json { render json: @banner.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /cross_promotion_app/banners/:id/deactivate
    def deactivate
      respond_to do |format|
        if @banner.update(active: false)
          format.html { redirect_to '/cross_promotion_app', notice: t('.success') }
          format.json { render :index, status: :ok, location: @banner }
        else
          format.html { render :edit, status: :unprocessable_entity, notice: t('.error') }
          format.json { render json: @banner.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /cross_promotion_app/banners/:id/destroy
    def destroy
      @banner.destroy

      respond_to do |format|
        format.html { redirect_to '/cross_promotion_app', notice: t('.success') }
        format.json { head :no_content }
      end
    end

    private

    def find_banner
      @banner = CrossPromotionApp::Banner.find(params[:id])
    end

    def banner_params
      params.require(:banner).permit(:name, :link, :image, :active)
    end

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV.fetch('CROSS_PROMOTION_USER') && password == ENV.fetch('CROSS_PROMOTION_PASSWORD')
      end
    end
  end
end
