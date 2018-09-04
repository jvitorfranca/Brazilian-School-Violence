# -*- coding: utf-8 -*-
import scrapy


class CasesSpider(scrapy.Spider):
    name = "cases"

    start_urls = (
        'http://riopretonorte.com.br/professor-agredido-por-estudante-preparava-seminario-contra-violencia/',
    )

    def parse(self, response):
        self.log('I just visited: ' + response.url)
        item = {
            'title': response.css("h1::text").extract_first(),
            'date': response.css("time::text").extract_first(),
            'text': response.css("div.materia-titulo > p::text").extract(),
        }
        yield item
