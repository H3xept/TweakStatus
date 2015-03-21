require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'terminal-notifier'
require 'colorize'

$URL = Hash.new

def getNumber(url)
	page = Nokogiri::HTML(open(url))   
	return b = page.xpath("//td")[3].to_s[7..-10].to_i
end

def createFile
	File.new("url.txt", "w")
end

def readFile
	urlFile = File.new("url.txt","r")
	content = urlFile.gets.chomp
	if content != ""
		content.to_s.split(",").each do |str|
			$URL[str] = 0
		end
	else
		puts '[!]No URLs found in url.txt file. Separate URLs with a comma.'.red
	end
end

def checkValue(url,number)
	if $URL[url] < number-10
		tweakName = url.split("=")[1].split("&")[0]
		TerminalNotifier.notify('%s'%[tweakName], :title => 'New Stat - %s Downloads'%[number])
		$URL[url] = number
		puts "[🍺 ]Update for #{tweakName}! - #{number}"
		return true
	end
end
# -- END DEFs

# -- File exists? 
unless File.exist?('url.txt')
	createFile
else 
	readFile
end

# -- For each url, get down. number
puts "[+]Initializing...".green
while 1 do 
	$URL.each do |url|
		$returnedVal = checkValue(url[0],getNumber(url[0]))
	end

	if $returnedVal == true
		puts ("-"*10).green
	end

	sleep(10)
end

