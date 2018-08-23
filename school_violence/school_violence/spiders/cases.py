# -*- coding: utf-8 -*-
import scrapy


class CasesSpider(scrapy.Spider):
    name = "cases"

    start_urls = (
        'https://oglobo.globo.com/sociedade/educacao/professora-agredida-por-aluno-apos-expulsa-lo-de-sala-dilacerada-21730771',
    )

    def parse(self, response):
        self.log('I just visited: ' + response.url)
        item = {
            'title': response.css('h1::text')[2].extract(),
            'date': response.css('time::text').extract_first(),
            'text': response.css('p::text').extract(),
        }
        yield item
