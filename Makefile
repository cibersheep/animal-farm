all: animal-farm.desktop \
     po/com.ubuntu.developer.robert-ancell.animal-farm.pot \
     share/locale/de/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/el/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/hu/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/it/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/nl/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/pt/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/zh_CN/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo     

QML_SOURCES = main.qml AnimalButton.qml

click:
	click build --ignore=Makefile --ignore=*.pot --ignore=*.po --ignore=*.qmlproject --ignore=*.qmlproject.user --ignore=*.in --ignore=po .

animal-farm.desktop: animal-farm.desktop.in po/*.po
	msgfmt --desktop --template=animal-farm.desktop.in -d po/ -o $@

po/com.ubuntu.developer.robert-ancell.animal-farm.pot: $(QML_SOURCES) animal-farm.desktop.in
	xgettext --language=JavaScript --from-code=UTF-8 --keyword=tr --keyword=tr:1,2 --add-comments=TRANSLATORS --force-po $(QML_SOURCES) -o po/com.ubuntu.developer.robert-ancell.animal-farm.pot
	xgettext --language=Desktop -k -kName -kComment -kKeywords --add-comments=TRANSLATORS animal-farm.desktop.in -j -o $@

share/locale/%/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo: po/%.po
	msgfmt -o $@ $<

clean:
	rm -f share/locale/*/*/*.mo animal-farm.desktop

run:
	/usr/bin/qmlscene $@ main.qml
