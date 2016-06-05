all: animal-farm.desktop \
     po/com.ubuntu.developer.robert-ancell.animal-farm.pot \
     share/locale/de/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/el/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/hu/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/it/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo \
     share/locale/pt/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo

QML_SOURCES = main.qml AnimalButton.qml

click:
	click build --ignore=Makefile --ignore=*.pot --ignore=*.po --ignore=*.qmlproject --ignore=*.qmlproject.user --ignore=*.in --ignore=po .

animal-farm.desktop: animal-farm.desktop.in po/*.po
	intltool-merge --desktop-style po $< $@

po/com.ubuntu.developer.robert-ancell.animal-farm.pot: $(QML_SOURCES) animal-farm.desktop.in
	touch po/com.ubuntu.developer.robert-ancell.animal-farm.pot
	xgettext --language=JavaScript --from-code=UTF-8 --keyword=tr --keyword=tr:1,2 --add-comments=TRANSLATORS $(QML_SOURCES) -o po/com.ubuntu.developer.robert-ancell.animal-farm.pot
	intltool-extract --type=gettext/keys animal-farm.desktop.in
	xgettext --keyword=N_ animal-farm.desktop.in.h -j -o po/com.ubuntu.developer.robert-ancell.animal-farm.pot
	rm -f animal-farm.desktop.in.h

share/locale/%/LC_MESSAGES/com.ubuntu.developer.robert-ancell.animal-farm.mo: po/%.po
	msgfmt -o $@ $<

clean:
	rm -f share/locale/*/*/*.mo animal-farm.desktop

run:
	/usr/bin/qmlscene $@ main.qml
