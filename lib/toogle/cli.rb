class Toogle::CLI   

    def call
        show_title_intro
        creation
        get_and_show_data
        perform_new_search?
    end

    def show_title_intro
        font_art = Toogle::FontArt
        font_art.line_1
        font_art.get_font_art
        font_art.line_2
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

    def creation
        Toogle::Query.create
    end

    def get_and_show_data
        Toogle::Query.all.each do |ele| 
            puts "\n#{ele.title.green}"
            puts "_".yellow * ele.title.length
            puts "\n#{ele.link.blue}"
            puts ele.description.red
            puts
        end
    end

    def perform_new_search?
        while true
            puts "\nWould you like to enter a new search?(Y/n)"
            input = gets.chomp.downcase
            if input == 'y'
                creation 
                get_and_show_data
            elsif input == 'n' || input != 'y'
                goodbye
            end
        end
    end

    def goodbye
        puts "\nSee you soon!"
        puts
        exit!
    end

end