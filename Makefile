# constants
PROJECT = nodejs
CURRENT_DIR = $(shell pwd | sed -e "s/\/cygdrive//g")
DOCKER_MACHINE_NAME = default
DOCKER_MACHINE_CPU = 4
DOCKER_MACHINE_MEMORY = 4096

# .PHONY: install
# ifeq (install,$(firstword $(MAKECMDGOALS)))
#   RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
#   $(eval $(RUN_ARGS):;@:)
# endif
# # boot containers
# install: ## Create VM and containers : ## make install
# 	@echo "\n ===> Install started... \n" && \
# 	[ $(docker-machine status $(DOCKER_MACHINE_NAME)) ] || \
# 	docker-machine create -d virtualbox \
# 			--virtualbox-cpu-count $(DOCKER_MACHINE_CPU) \
# 			--virtualbox-memory $(DOCKER_MACHINE_MEMORY) \
# 			$(DOCKER_MACHINE_NAME) || true && \
# 	echo "\n ===> start docker-machine \n" && \
# 	docker-machine start $(DOCKER_MACHINE_NAME) || true && \
# 	echo "\n ===> docker-machine env $(DOCKER_MACHINE_NAME)" && \
# 	docker-machine env $(DOCKER_MACHINE_NAME) || true

# remove virtual machine
destroy: ## Warn! Destroy virtual machine : ## make destroy
	docker-machine rm -f $(DOCKER_MACHINE_NAME)

.PHONY: start
ifeq (start,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif
start: ## Create and start containers : ## make up, make up mysql
	docker-compose -f docker-compose.yml -p $(PROJECT) up -d $(RUN_ARGS) --build

.PHONY: restart
ifeq (restart,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif
restart: ## Restart services : ## make restart, make restart app
	docker-compose -f docker-compose.yml -p $(PROJECT) kill $(RUN_ARGS) && \
	docker-compose -f docker-compose.yml -p $(PROJECT) rm -f --all $(RUN_ARGS) && \
	docker-compose -f docker-compose.yml -p $(PROJECT) up -d $(RUN_ARGS) --build

ps: ## List containers : ## make ps
	docker-compose -f docker-compose.yml -p $(PROJECT) ps

.PHONY: kill
ifeq (kill,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif
kill: ## kill containers : ## make kill, make kill mysql
	docker-compose -f docker-compose.yml -p $(PROJECT) kill $(RUN_ARGS)

.PHONY: logs
ifeq (logs,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif
logs: ## Display container's log : ## make logs, make logs app
	docker-compose -f docker-compose.yml -p $(PROJECT) logs $(RUN_ARGS)