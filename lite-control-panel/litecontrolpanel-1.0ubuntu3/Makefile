DESTDIR?=

CFLAGS=--target-glib=2.38 --pkg gtk+-3.0
LDFLAGS=-X -DGETTEXT_PACKAGE=\"$(BINARY)\"
SOURCE=lite-control-panel.vala
BINARY=lite-control-panel

all:
	valac $(CFLAGS) $(LDFLAGS) $(SOURCE) -o $(BINARY)

clean:
	rm $(BINARY)

install: all
	install -Dm755 $(BINARY) $(DESTDIR)/usr/bin/$(BINARY)
	install -Dm644 data/$(BINARY).desktop $(DESTDIR)/usr/share/applications/$(BINARY).desktop
	install -Dm644 data/$(BINARY).png $(DESTDIR)/usr/share/icons/hicolor/96x96/apps/$(BINARY).png

uninstall:
	rm $(DESTDIR)/usr/bin/$(BINARY)
	rm $(DESTDIR)/usr/share/applications/$(BINARY).desktop
	rm $(DESTDIR)/usr/share/icons/hicolor/96x96/apps/$(BINARY).png