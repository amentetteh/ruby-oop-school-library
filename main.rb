require_relative './app'
def main
  app = App.new
  app.run
end

def test
  app = App.new
  retour = 0
  until retour == '7'
    retour = app.display_menu
    if retour == '7'
      app.save_data
      puts 'Exiting the program'
    else
      app.process_input(retour)
    end

  end
  puts 'Progam exit '
end
test
