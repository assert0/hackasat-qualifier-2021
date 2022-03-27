CHAL_NAME ?= basic-handoff
CHAL_PORT ?= 12345
CHAL_HOST ?= 172.17.0.1
FLAG ?= flag{0123456789abcdef}
SERVICE_HOST ?= $(CHAL_HOST)
SERVICE_PORT ?= 23456


build: challenge solver



.PHONY:challenge
challenge:
	docker build challenge -t $(CHAL_NAME):challenge

.PHONY:solver
solver: 
	docker build solver -t $(CHAL_NAME):solver

.PHONY:test
test:
	socat -v tcp-listen:$(CHAL_PORT),reuseaddr exec:"docker run --rm -p ${SERVICE_PORT}\:80 -e SERVICE_HOST=${SERVICE_HOST} -e SERVICE_PORT=${SERVICE_PORT} -e FLAG=${FLAG} ${CHAL_NAME}\:challenge" &
	docker run -it --rm -e HOST=$(CHAL_HOST) -e PORT=$(CHAL_PORT) $(CHAL_NAME):solver

# .PHONY:test
# test:
# 	docker run -it --rm -p $(CHAL_PORT):80 -e "CHAL_HOST=$(CHAL_HOST)" -e "CHAL_PORT=$(CHAL_PORT)" -e "FLAG=flag{zulu10571quebec:GKP9suZz2eyyEpgOpgn1fvN67EpR2MYxvtrAdVfdUtPjBA1w0QSGxD9cWz4grDWaOg}" $(CHAL_NAME):challenge &
# 	docker run -it --rm -e "HOST=$(CHAL_HOST)" -e "PORT=$(CHAL_PORT)" $(CHAL_NAME):solver

# .PHONY:test-aws
# 	docker run -it --rm -e "HOST=$(EC2_QA)" -e "PORT=$(6001)" -e "TICKET=ticket{zulu10571quebec:GKP9suZz2eyyEpgOpgn1fvN67EpR2MYxvtrAdVfdUtPjBA1w0QSGxD9cWz4grDWaOg}" $(CHAL_NAME):challenge
# 	docker run -it --rm -e "HOST=$(EC2_QA)" -e "PORT=$(6001)" $(CHAL_NAME):solver
