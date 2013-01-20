PRJ = StreamOrientedKnuthMorrisPratt

all: $(PRJ).cs $(PRJ).cpp $(PRJ).java $(PRJ).as3 $(PRJ).php $(PRJ).js


$(PRJ).cs: com/databigbang/articles/$(PRJ).hx
	mkdir $(PRJ).cs
	haxe -main com.databigbang.articles.StreamOrientedKnuthMorrisPratt com.databigbang.articles.StreamOrientedKnuthMorrisPratt -cs $(PRJ).cs

$(PRJ).cpp: com/databigbang/articles/$(PRJ).hx
	haxe -main com.databigbang.articles.StreamOrientedKnuthMorrisPratt com.databigbang.articles.StreamOrientedKnuthMorrisPratt -cpp $(PRJ).cpp 

$(PRJ).java: com/databigbang/articles/$(PRJ).hx
	haxe -main com.databigbang.articles.StreamOrientedKnuthMorrisPratt com.databigbang.articles.StreamOrientedKnuthMorrisPratt -java $(PRJ).java

$(PRJ).as3: com/databigbang/articles/$(PRJ).hx
	haxe -main com.databigbang.articles.StreamOrientedKnuthMorrisPratt com.databigbang.articles.StreamOrientedKnuthMorrisPratt -as3 $(PRJ).actionscript

$(PRJ).php: com/databigbang/articles/$(PRJ).hx
	haxe -main com.databigbang.articles.StreamOrientedKnuthMorrisPratt com.databigbang.articles.StreamOrientedKnuthMorrisPratt -php $(PRJ).php

$(PRJ).js: com/databigbang/articles/$(PRJ).hx
	haxe -main com.databigbang.articles.StreamOrientedKnuthMorrisPratt com.databigbang.articles.StreamOrientedKnuthMorrisPratt -js $(PRJ).js


clean:
	rm -r -f $(PRJ).cs $(PRJ).cpp $(PRJ).java $(PRJ).as3 $(PRJ).php $(PRJ).js

