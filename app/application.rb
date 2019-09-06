class Application
 
    @@items = []

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/)
        search_item = req.path.split("/items/").last
        item = @@items.find{|i| i.name == search_item}
        if item
            resp.write "The price of #{item.name} is #{item.price}"
        else
            resp.write "Item not found"
            resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end