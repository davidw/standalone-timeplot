# Rakefile - create a big, fat, copy of the timeline widget.

COMPRESS="java -jar yuicompressor-2.4.2.jar"
COMPRESSED_OUTPUT_FILE='timeplot-complete-min.js'
OUTPUT_FILE='timeplot-complete.js'
CSS_FILE='timeplot-single.css'

TMP_OUTPUT_FILE="tmp-timeplot-complete.js"


task :default => :all

task :all => [COMPRESSED_OUTPUT_FILE, OUTPUT_FILE, CSS_FILE]

# The animal bits that go in to make the sausage:
Files = %w(simile-ajax/src/webapp/api/simile-ajax-api.js
simile-ajax/src/webapp/api/scripts/jquery-1.3.2.min.js
simile-ajax/src/webapp/api/scripts/platform.js
simile-ajax/src/webapp/api/scripts/debug.js
simile-ajax/src/webapp/api/scripts/xmlhttp.js
simile-ajax/src/webapp/api/scripts/json.js
simile-ajax/src/webapp/api/scripts/dom.js
simile-ajax/src/webapp/api/scripts/graphics.js
simile-ajax/src/webapp/api/scripts/date-time.js
simile-ajax/src/webapp/api/scripts/string.js
simile-ajax/src/webapp/api/scripts/html.js
simile-ajax/src/webapp/api/scripts/data-structure.js
simile-ajax/src/webapp/api/scripts/units.js
simile-ajax/src/webapp/api/scripts/ajax.js
simile-ajax/src/webapp/api/scripts/history.js
simile-ajax/src/webapp/api/scripts/window-manager.js
simile-timeline/src/webapp/api/timeline-api.js
simile-timeline/src/webapp/api/scripts/timeline.js
simile-timeline/src/webapp/api/scripts/band.js
simile-timeline/src/webapp/api/scripts/themes.js
simile-timeline/src/webapp/api/scripts/ethers.js
simile-timeline/src/webapp/api/scripts/ether-painters.js
simile-timeline/src/webapp/api/scripts/event-utils.js
simile-timeline/src/webapp/api/scripts/labellers.js
simile-timeline/src/webapp/api/scripts/sources.js
simile-timeline/src/webapp/api/scripts/original-painter.js
simile-timeline/src/webapp/api/scripts/detailed-painter.js
simile-timeline/src/webapp/api/scripts/overview-painter.js
simile-timeline/src/webapp/api/scripts/compact-painter.js
simile-timeline/src/webapp/api/scripts/decorators.js
simile-timeline/src/webapp/api/scripts/units.js
simile-timeplot/src/webapp/api/timeplot-api.js
simile-timeplot/src/webapp/api/scripts/timeplot.js
simile-timeplot/src/webapp/api/scripts/plot.js
simile-timeplot/src/webapp/api/scripts/sources.js
simile-timeplot/src/webapp/api/scripts/geometry.js
simile-timeplot/src/webapp/api/scripts/color.js
simile-timeplot/src/webapp/api/scripts/math.js
simile-timeplot/src/webapp/api/scripts/processor.js)

Cssfiles = %w(simile-ajax/src/webapp/api/styles/graphics.css
simile-timeline/src/webapp/api/styles/timeline.css
simile-timeline/src/webapp/api/styles/ethers.css
simile-timeline/src/webapp/api/styles/events.css
simile-timeplot/src/webapp/api/styles/timeplot.css)

Imagefiles = %w(simile-timeplot/src/webapp/api/images/copyright.png
simile-timeplot/src/webapp/api/images/line_left.png
simile-timeplot/src/webapp/api/images/line_right.png
simile-timeplot/src/webapp/api/images/progress-running.gif
simile-timeline/src/webapp/api/images/blue-circle.png
simile-timeline/src/webapp/api/images/bubble-bottom-arrow.png
simile-timeline/src/webapp/api/images/bubble-bottom-left.png
simile-timeline/src/webapp/api/images/bubble-bottom.png
simile-timeline/src/webapp/api/images/bubble-bottom-right.png
simile-timeline/src/webapp/api/images/bubble-left-arrow.png
simile-timeline/src/webapp/api/images/bubble-left.png
simile-timeline/src/webapp/api/images/bubble-right-arrow.png
simile-timeline/src/webapp/api/images/bubble-right.png
simile-timeline/src/webapp/api/images/bubble-top-arrow.png
simile-timeline/src/webapp/api/images/bubble-top-left.png
simile-timeline/src/webapp/api/images/bubble-top.png
simile-timeline/src/webapp/api/images/bubble-top-right.png
simile-timeline/src/webapp/api/images/close-button.png
simile-timeline/src/webapp/api/images/copyright.png
simile-timeline/src/webapp/api/images/copyright-vertical.png
simile-timeline/src/webapp/api/images/dark-blue-circle.png
simile-timeline/src/webapp/api/images/dark-green-circle.png
simile-timeline/src/webapp/api/images/dark-red-circle.png
simile-timeline/src/webapp/api/images/dull-blue-circle.png
simile-timeline/src/webapp/api/images/dull-green-circle.png
simile-timeline/src/webapp/api/images/dull-red-circle.png
simile-timeline/src/webapp/api/images/gray-circle.png
simile-timeline/src/webapp/api/images/green-circle.png
simile-timeline/src/webapp/api/images/message-bottom-left.png
simile-timeline/src/webapp/api/images/message-bottom-right.png
simile-timeline/src/webapp/api/images/message-left.png
simile-timeline/src/webapp/api/images/message-right.png
simile-timeline/src/webapp/api/images/message-top-left.png
simile-timeline/src/webapp/api/images/message-top-right.png
simile-timeline/src/webapp/api/images/progress-running.gif
simile-timeline/src/webapp/api/images/red-circle.png
simile-timeline/src/webapp/api/images/top-bubble.png)

def cat_files(outputfile, basename)
  File.open(outputfile, 'w') do |x|
    Files.each do |f|
      x.puts(File.open(f).read.gsub('REPLACEME-REPLACEME', basename))
    end
  end
end

file CSS_FILE => Cssfiles do
  File.open(CSS_FILE, 'w') do |x|
    Cssfiles.each do |f|
      x.puts(File.open(f).read)
    end
  end
end

# Just one big JS file, no compression.
file OUTPUT_FILE => Files do
  basename = File.basename(OUTPUT_FILE, ".js")
  cat_files(OUTPUT_FILE, basename)
end

# Compress it.
file COMPRESSED_OUTPUT_FILE => Files do
  basename = File.basename(COMPRESSED_OUTPUT_FILE, ".js")
  cat_files(TMP_OUTPUT_FILE, basename)
  system "#{COMPRESS} #{TMP_OUTPUT_FILE} >> #{COMPRESSED_OUTPUT_FILE}"
end

# Install the JS, plus all the support files.
task :install => [COMPRESSED_OUTPUT_FILE, OUTPUT_FILE, CSS_FILE] do
  target = ENV['TARGET']
  raise "Need a TARGET directory" if target.nil?
  mkdir_p target + "/styles"
  mkdir_p target + "/images"
  cp COMPRESSED_OUTPUT_FILE, target
  cp OUTPUT_FILE, target
  cp CSS_FILE, target + "/styles"
  Imagefiles.each do |imf|
    cp imf, target + "/images"
  end
end

# Clean up the whole thing.
task :clean do
  rm OUTPUT_FILE
  rm COMPRESSED_OUTPUT_FILE
  rm TMP_OUTPUT_FILE
  rm CSS_FILE
end
