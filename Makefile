#! /usr/bin/make -f

default: all

main?=ekzekuto
package?=org.example.${main}
package?=main
log_tag?=${main}
version?=1.0.0

all?= \
 icon.png \
 tmp/512x512.png \
 tmp/screenshot.jpg \
 tmp/480x854/screenshot.png \
 shared/res/main.png \
 #eol

sdb?=${HOME}/tizen-sdk/tools/sdb
developer_destdir?=/opt/usr/apps/tmp/${package}-tmp
tpk_file?=$(shell ls Release/*.tpk)

all: ${all}

check: ${tpk_file}
	unzip -t $<
	ls -l ${CURDIR}/${<}
	md5sum ${CURDIR}/${<}

shared/res/main.png: icon.png
#	./shared/res/main.png: PNG image data, 117 x 117, 8-bit/color RGBA, non-interlaced
	cp -v $< $@

icon.png: docs/logo.png Makefile
	convert -resize 117x117! $< $@

docs/logo.png: 
	cp docs/screenshot.png $@

tmp/screenshot.jpg: docs/screenshot.png
	convert $< $@

tmp/512x512.png: docs/logo.png
	mkdir -p ${@D}
	convert -resize '512x512!' $< $@

tmp/512x512.jpg: docs/logo.png
	mkdir -p ${@D}
	convert -resize '512x512!' $< $@

tmp/480x854/%.png: docs/%.png
	mkdir -p ${@D}
	convert -resize '480x854!' $< $@

clean:
	rm -f *~ .*~

cleanall:
	rm -rf Debug Release SA_Report tmp crash-info

distclean: clean cleanall
	rm -f *.wgt

deploy: ./Debug/${package}-${version}-arm.tpk
	${sdb} install $<

run-app:
	${sdb} shell pkgcmd -l | grep ${package} || ${MAKE} deploy
	${sdb} shell open_app ${package}

run-developer:lib/runme.sh
	${sdb} shell ls -l ${developer_destdir}/$< || ${MAKE} deploy-developer
	${sdb} shell ${developer_destdir}/$< | tee $@.log


deploy-developer: lib
	${sdb} shell ls ${developer_destdir} || ${MAKE} connect
	${sdb} shell mkdir -p ${developer_destdir}
	${sdb} push $< ${developer_destdir}/lib

test-developer: connect run-developer

connect:
	${sdb} devices
	${sdb} devices | grep 'offline' && sdb kill-server || :
	${sdb} devices
	${sdb} devices | grep 'unknown' && sleep 10 || :
	${sdb} get-serialno
	${sdb} get-serialno | grep 'target not exist' && sleep 10 || :
	${sdb} get-state | grep 'device' || sleep 20
	${sdb} shell cat /proc/uptime

connect-more:
	${sdb} kill-server
	-killall -9 sdb
	${sdb} start-server
	sleep 10
	${MAKE} connect
	${sdb} get-state | grep 'offline' && ${sdb} status-window || :
	${sdb} shell id


log:
	${sdb} shell dlogutil -c
	${sdb} dlog "${log_tag}" \
 | sed -u -e 's|I/${main}(.*): ||g' \
 | tee "$@.log" \
 | { grep -q "# ${package}: exit" && killall sdb ; } || :
	${MAKE} connect


test-app: run-app log
 # 
 #&& killall sdb || :

reboot:
	${sdb} root on || echo "TODO: must do it manually"
	${sdb} shell /sbin/reboot || echo "TODO: reboot if not done"
	sleep 20
	echo "should be booting"
	sleep 20
	echo "should be booted"
	sleep 10
	${MAKE} connect || sleep 60
	${MAKE} connect || sleep 60
	${MAKE} connect || sleep 120


test: reboot test-app reboot test-developer 

%.log.txt: %.log Makefile
	sed -e 's|^[0-9.:]* ||g'  < $< > $@

analyze: run-developer.log.txt log.log.txt
	meld $^

ps:
	sdb shell \
 'find /proc/ -iname 'cmdline' 2>/dev/null | grep -v 'task' \
 | while read t; do echo "$${t}: $$(tr '\0' : < $${t})";  done '


