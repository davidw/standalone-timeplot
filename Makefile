FILES=simile-ajax/src/webapp/api/simile-ajax-api.js  simile-ajax/src/webapp/api/scripts/jquery-1.2.6.js simile-ajax/src/webapp/api/scripts/platform.js  simile-ajax/src/webapp/api/scripts/debug.js  simile-ajax/src/webapp/api/scripts/xmlhttp.js  simile-ajax/src/webapp/api/scripts/json.js  simile-ajax/src/webapp/api/scripts/dom.js  simile-ajax/src/webapp/api/scripts/graphics.js  simile-ajax/src/webapp/api/scripts/date-time.js  simile-ajax/src/webapp/api/scripts/string.js  simile-ajax/src/webapp/api/scripts/html.js  simile-ajax/src/webapp/api/scripts/data-structure.js  simile-ajax/src/webapp/api/scripts/units.js  simile-ajax/src/webapp/api/scripts/ajax.js  simile-ajax/src/webapp/api/scripts/history.js  simile-ajax/src/webapp/api/scripts/window-manager.js  simile-timeline/src/webapp/api/timeline-api.js   simile-timeline/src/webapp/api/scripts/timeline.js  simile-timeline/src/webapp/api/scripts/band.js  simile-timeline/src/webapp/api/scripts/themes.js  simile-timeline/src/webapp/api/scripts/ethers.js  simile-timeline/src/webapp/api/scripts/ether-painters.js  simile-timeline/src/webapp/api/scripts/event-utils.js  simile-timeline/src/webapp/api/scripts/labellers.js  simile-timeline/src/webapp/api/scripts/sources.js  simile-timeline/src/webapp/api/scripts/original-painter.js  simile-timeline/src/webapp/api/scripts/detailed-painter.js  simile-timeline/src/webapp/api/scripts/overview-painter.js  simile-timeline/src/webapp/api/scripts/compact-painter.js  simile-timeline/src/webapp/api/scripts/decorators.js  simile-timeline/src/webapp/api/scripts/units.js  simile-timeplot/src/webapp/api/timeplot-api.js simile-timeplot/src/webapp/api/scripts/timeplot.js simile-timeplot/src/webapp/api/scripts/plot.js simile-timeplot/src/webapp/api/scripts/sources.js simile-timeplot/src/webapp/api/scripts/geometry.js simile-timeplot/src/webapp/api/scripts/color.js simile-timeplot/src/webapp/api/scripts/math.js simile-timeplot/src/webapp/api/scripts/processor.js

COMPRESS=java -jar yuicompressor-2.4.2.jar
CAT=cat

big.js: $(FILES) Makefile
	echo "" > big.js
	for f in $(FILES) ; do $(CAT) $$f >> big.js ; echo "" >> big.js ; done
	$(COMPRESS) big.js > big-min.js

clean:
	-rm big.js big-min.js