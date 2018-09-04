# -*- coding: utf-8 -*-
import scrapy


class CasesSpider(scrapy.Spider):
    name = "cases"

    start_urls = (
        'http://www.apeoesp.org.br/publicacoes/observatorio-da-violencia/estudante-agride-professor-apos-pedido-para-desligar-celular-na-aula/',
    )

    def parse(self, response):
        self.log('I just visited: ' + response.url)
        item = {
            'title': response.css("h1::text").extract_first(),
            'text': response.css("div.materia-assinatura > p").extract(),
        }
        yield item
