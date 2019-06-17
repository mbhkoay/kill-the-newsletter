require "nokogiri"
require "./server"

Sinatra::Application.new.helpers.instance_eval do
  Dir["public/feeds/*"].each do |feed_path|
    token = File.basename feed_path, ".xml"
    feed = File.read feed_path
    File.write(feed_path, feed.strip.empty? ? <<-FEED : Nokogiri::XML(feed) { |config| config.noblanks }.to_xml)
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <link rel="self" type="application/atom+xml" href="https://www.kill-the-newsletter.com/feeds/#{token}.xml"/>
  <link rel="alternate" type="text/html" href="https://www.kill-the-newsletter.com/"/>
  <title>Kill the Newsletter!</title>
  <subtitle>Kill the Newsletter! Inbox “#{token}@kill-the-newsletter.com”</subtitle>
  <id>urn:kill-the-newsletter:#{token}</id>
  <updated>#{now}</updated>
  <entry>
    <id>urn:kill-the-newsletter:#{fresh_token}</id>
    <title>Kill the Newsletter! Malfunction · Action Required</title>
    <author><name>Kill the Newsletter!</name></author>
    <updated>#{now}</updated>
    <content type="text">
You were affected by a rare Kill the Newsletter! malfuction.

I lost your feed, including its name, and for a while you didn’t receive any updates.

I fixed the problem, and while past entries are lost forver, you should receive updates from now on.

As for the feed name, for now I had to rename it to “Kill the Newsletter!” To restore the original name of the feed, please write to me at kill-the-newsletter@leafac.com with the feed address and the name you want.

I’m sorry about the trouble. Please continue to enjoy your readings.
    </content>
  </entry>
</feed>
FEED
  end
end