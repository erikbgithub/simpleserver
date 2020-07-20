all:
	podman build -t simpleserver .

install:
	cp simpleserver.service /etc/systemd/system/
	systemctl daemon-reload
