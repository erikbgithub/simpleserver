all:
	podman build -t simpleserver .

install:
	mkdir -p ~/.config/systemd/user
	cp simpleserver.service ~/.config/systemd/user/
	# because /usr/local/bin will be in the PATH that user systemd knows and looks for
	sudo cp start-simpleserver.sh /usr/local/bin/
	sudo chown $(USER):$(USER) /usr/local/bin/start-simpleserver.sh
	systemctl --user daemon-reload
