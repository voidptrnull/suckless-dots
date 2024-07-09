-include config.mk

TARGETS = dwm dmenu slstatus st

all: $(TARGETS) ly
	@echo "BUILT ALL TARGETS. EXITING..."

INIT_CMD :=

ifeq ($(INIT_SYSTEM),systemd)
	INIT_CMD += systemctl enable ly.service
else ifeq ($(INIT_SYSTEM),openrc)
	INIT_CMD += rc-update add ly
else ifeq ($(INIT_SYSTEM),runit)
	INIT_CMD += ln -s /etc/sv/ly /var/service
else
	echo "ERROR: INIT SYSTEM $(INIT_SYSTEM) is not recognised. Exiting..."
	exit -1
endif

$(TARGETS):
	@echo "Building $@..."
	@cd $@ && rm -rf config.h
	@cd $@ && $(MAKE)
	@cd $@ && $(EXEC) $(MAKE) install

ly:
	@echo "Building ly..."
	@cd ly && $(EXEC) zig build --release=$(ZIG_BUILD) install$(INIT_SYSTEM) && $(EXEC) $(INIT_CMD)

clean:
	@for target in $(TARGETS); do \
	$(MAKE) -C $$target clean; \
	done
