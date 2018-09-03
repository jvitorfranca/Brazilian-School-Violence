# -*- coding: utf-8 -*-
import scrapy


class CasesSpider(scrapy.Spider):
    name = "cases"

    start_urls = (
        'http://g1.globo.com/sao-paulo/sao-jose-do-rio-preto-aracatuba/noticia/2016/03/estudante-agride-professor-apos-pedido-para-desligar-celular-na-aula.html',
    )

    def parse(self, response):
        self.log('I just visited: ' + response.url)
        item = {
            'title': response.css("h1.entry-title::text").extract_first(),
            'date': response.css("abbr.published::text").extract_first(),
            'text': response.css("div > p::text").extract(),
        }
        yield item
