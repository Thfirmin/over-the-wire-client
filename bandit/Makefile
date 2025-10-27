FIRST_LVL = bandit0/data.txt
FIRST_PASSWORD = bandit0
ENV_FILE = bandit.env

init: $(FIRST_LVL) $(ENV_FILE)

$(FIRST_LVL):
	mkdir -p $$(dirname -- ${FIRST_LVL})
	echo $(FIRST_PASSWORD) > $(FIRST_LVL)

$(ENV_FILE):
	echo 'BANDIT_HOST=bandit.labs.overthewire.org'"\n"'BANDIT_PORT=2220' > $(ENV_FILE)
