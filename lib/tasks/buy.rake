require 'autobuy'
desc "Make a Coinbase Pro trade"
task :trade do
  products = Autobuy::Base.new.products
  ENV.select{|k,v| k =~ /_USD$/}.each do |product, amount|
    # ENVs can't have '-' so we need to replace _ with - to get product name
    product_id = product.sub('_','-')
    if products.map(&:id).include? product_id
      begin
        Autobuy::Base.new(product: product_id).buy(usd_amount: amount)
      rescue => e
        puts "Error: BUY #{product_id} $#{amount} - #{e}"
      end
    else
      puts "Sorry, no Coinbase Pro product: #{product_id}."
    end
  end
end

