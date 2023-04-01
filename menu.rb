require_relative 'app'
class Main
  def initialize
    app = App.new
    app.main_menu
  end
end
