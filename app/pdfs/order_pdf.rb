class OrderPdf < Prawn::Document

  def initialize(orders,view)
    super()
    @orders = orders
    @line_items = orders.line_items
    logo
    thanks_message
  end
 
  def logo
    #This inserts an image in the pdf file and sets the size of the image
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 197, :height => 31
    move_down 10
    draw_text "Order Receipt", :at => [220, 575], size: 22
  end

  def thanks_message
    move_down 120
    text "Hello #{@orders.name},"
    move_down 15
    text "Thank you for your order.Print this receipt as confirmation of your order.",
    :indent_paragraphs => 40, :size => 13
    move_down 15
    text "Payment Type: #{@orders.pay_type}"
     move_down 15
    text "Order Status: #{@orders.order_status}"
  end
end