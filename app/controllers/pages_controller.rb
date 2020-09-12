class PagesController < ApplicationController
    def home
        rand = Quotation.order(Arel.sql('RANDOM()')).first
        @rand_quote = rand.quote
        @rand_author = rand.creator.author
        @rand_tags = rand.tags
    end
end
