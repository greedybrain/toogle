class Toogle::FontArt 

    def self.line_1
        puts "#{('_'.yellow * 14) + ('_'.red * 14)}"
    end

    def self.get_font_art
        tg = "#{'T'.blue} #{'E'.red} #{'R'.yellow} #{'M'.blue} #{'I'.green} #{'N'.red} #{'A'.blue} #{'L'.red}  #{'G'.blue} #{'O'.red} #{'O'.yellow} #{'G'.blue} #{'L'.green} #{'E'.red}" 
        intro = " \n#{tg}"
        puts intro
    end 

    def self.line_2
        puts "#{('_'.green * 14) + ('_'.blue * 14)}"
    end

end