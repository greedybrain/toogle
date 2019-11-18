class Toogle::CLI   

    def call
        instructions
        get_and_show_data
    end

    def instructions
        puts "#{('_'.yellow * 14) + ('_'.red * 14)}"
        puts "#{Toogle::FontArt.get_font_art}"
        puts "#{('_'.green * 14) + ('_'.blue * 14)}"
    end

    def scraper_gets_user_info
        scraper = Toogle::Scraper.new
        while true 
            puts "\nEnter your".red + " search term/s".green
            print "\n> ".green
            query = gets.chomp.to_s.downcase
            if query == ""
                puts "\nSorry, you must enter a valid search, or if you wish to exit type 'exit' or press Control C"
            elsif query == 'exit'
                goodbye
            else
                print "\nHow many pages would you like for you search, choose between 1 and 5? "
                pages = gets.chomp.to_i 
                if !(1..5).include?(pages)
                    puts "\nSorry, you can only search within the first 5 pages"
                elsif pages.to_s == 'exit'
                    goodbye
                else
                    break
                end
            end
        end
        puts "\nLoading".yellow + " search".green + " results".blue + " ...".red
        scraper.query_data(query, pages)
    end

    def get_and_show_data
        Toogle::Query.create
        Toogle::Query.all.each do |ele| 
            puts "\n#{ele.title.green}"
            puts "_".yellow * ele.title.length
            puts "\n#{ele.link.blue}"
            puts ele.description.red
            puts
        end
    end

    def goodbye
        puts "\nSee you soon!"
        puts
        exit!
    end

end