# Import required libraries
require 'open-uri'
require 'nokogiri'

# A class for fetching and handling web pages
class WebPageFetcher
  def initialize(urls)
    @urls = urls
  end

  def fetch_pages
    @urls.each do |url|
      begin
        html_content = URI.parse(url).open
        save_to_file(url, html_content)
        display_metadata(url, html_content)
      rescue OpenURI::HTTPError => e
        handle_error("Error fetching #{url}: #{e.message}")
      rescue StandardError => e
        handle_error("An error occurred while processing #{url}: #{e.message}")
      end
    end
  end

  private

  # Save fetched content to a file
  def save_to_file(url, content)
    filename = "#{URI.parse(url).host}.html"
    File.write(filename, content)
    puts "Saved #{url} to #{filename}"
  end

  # Handle and display error messages
  def handle_error(message)
    puts 'ERROR: Details about the error below!'
    puts message
    puts "\n"
  end

  # Display metadata about fetched content
  def display_metadata(url, content)
    doc = Nokogiri::HTML(content)
    num_links = doc.css('a').count
    num_images = doc.css('img').count
    last_fetch = Time.now.utc.strftime('%a %b %d %Y %H:%M:%S UTC')

    puts <<~METADATA
      site: #{url}
      num_links: #{num_links}
      images: #{num_images}
      last_fetch: #{last_fetch}

    METADATA
  end
end

# Command line interface class
class CommandLineInterface
  def initialize
    @urls = ARGV
    @fetcher = WebPageFetcher.new(@urls)
  end

  def run
    @fetcher.fetch_pages
  end
end

# Creating CommandLineInterface instance and runnig the fetcher
cli = CommandLineInterface.new
cli.run
