class ItemsController < ApplicationController
  before_action :is_admin?, only: [:create_items_dofus_api]

  def create_items_dofus_api

    require 'net/http'
    require 'uri' 
    require 'json'

    # consumables
    # pets
    # weapons
    # equipments
    # idols
    type_of_item = "idols"

    uri = URI.parse("https://fr.dofus.dofapi.fr/#{type_of_item}")
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    @response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    if @response.code == "200"
      items = JSON.parse(@response.body)

      @cpt_new_items = 0
      items.each do |item|
        new_item = Item.check_db(item["ankamaId"])
        if new_item.blank?
          new_item = Item.new()
          new_item.name = item["name"]
          new_item.ankama_id = item["ankamaId"]
          new_item.level = item["level"]
          new_item.category = type_of_item
          new_item.url_img = item["imgUrl"]
          new_item.save
          @cpt_new_items = @cpt_new_items + 1
        end
      end
    end

  end

end