/*
1st: everything api = GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=ead34f9b941f473092b91a1f1ddd0e32
2nd: top-headlines api = GET https://newsapi.org/v2/top-headlines?country=de&apiKey=ead34f9b941f473092b91a1f1ddd0e32
3rd: search api = https://newsapi.org/v2/everything?q=bitcoin&apiKey=ead34f9b941f473092b91a1f1ddd0e32
4th: plugin to launch url
5th: open article
6th: source api-  https://newsapi.org/v2/sources?country=us&category=businessapiKey=ead34f9b941f473092b91a1f1ddd0e32
pagination = https://newsapi.org/v2/everything?q=bitcoin&pageSize=20&page=1&apiKey=ead34f9b941f473092b91a1f1ddd0e32
sort by = https://newsapi.org/v2/everything?q=bitcoin&from=21-02-2021&pageSize=20&page=1&apiKey=ead34f9b941f473092b91a1f1ddd0e32



String url = https://newsapi.org/v2
api format = url/endpoint?q=query&from=2021-03-22&sortBy=popularity&apikey

q = keyword or words to search
endpoint = {
1: everything
2: top-headlines
3: sources
}*/
