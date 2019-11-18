class Toogle::Scraper

    def get_page
       Watir::Browser.new :chrome, headless: true, options: {options: {detach: true}}
    end

    def query_data(users_search, chosen_pages)
        # typed_in = Toogle::CLI.new
        this = get_page
        total_pages = chosen_pages
        this.goto("http://google.com")
        this.input(name: 'q').send_keys(users_search, :return)

        results = {:titles => [], :links => [], :descriptions => []}

        next_page = 1
        while next_page <= total_pages.to_i
            this.elements(css: "div.srg div.rc").each do |ele|
                results[:titles] << ele.element(css: "h3.LC20lb").text
                results[:links] << ele.element(css: "div.r a:nth-of-type(1)").attribute('href')
                results[:descriptions] << ele.element(css: "div.s span.st").text
            end
            this.element(css: "table tbody tr td a#pnnext").click
            next_page += 1
        end
        results
    end

end