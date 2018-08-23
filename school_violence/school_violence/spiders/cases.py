# -*- coding: utf-8 -*-
import scrapy


class CasesSpider(scrapy.Spider):
    name = "cases"

    start_urls = (
        'http://www.focoregional.com.br/Noticia/caso-de-professora-agredida-em-sc-ganha-reper',
    )

    def parse(self, response):
        self.log('I just visited: ' + response.url)
        item = {
            'title': response.css('p.titlenoticiadestaque::text').extract(),
            'date': response.css('span.atualizadonoticia > span::text').extract(),
            'text': response.css('div.textonoticia > p::text').extract(),
        }
        yield item
