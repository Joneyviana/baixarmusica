import urllib2
opener = urllib2.build_opener(urllib2.HTTPHandler(debuglevel=1))
request = opener.open('https://www.google.com.br/?q=name')
