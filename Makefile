.PHONY: install

ENV_NAME = cs2310nb
ENV_FILE = environment.yml
CONDA_BASE=$(shell conda info --base)
ENV_BASE=$(CONDA_BASE)/envs/$(ENV_NAME)
ACTIVATE_DIR=$(ENV_BASE)/etc/conda/activate.d
DEACTIVATE_DIR=$(ENV_BASE)/etc/conda/deactivate.d

install:
	@echo "Creating or updating the conda environment..."
	@conda env update --name $(ENV_NAME) --file $(ENV_FILE) --prune || conda env create --name $(ENV_NAME) --file $(ENV_FILE)
	@mkdir -p "$(ACTIVATE_DIR)" "$(DEACTIVATE_DIR)"
	@if [ -f "$(ACTIVATE_DIR)/env_vars.sh" ]; then \
		echo "File exists: $(ACTIVATE_DIR)/env_vars.sh"; \
		printf "Replace it? (y/n) "; \
		read REPLY; \
		case "$$REPLY" in y|Y) cp activate.d/env_vars.sh "$(ACTIVATE_DIR)/env_vars.sh";; *) echo "Skipped replacing activate script.";; esac; \
	else \
		cp activate.d/env_vars.sh "$(ACTIVATE_DIR)/env_vars.sh"; \
	fi
	@if [ -f "$(DEACTIVATE_DIR)/env_vars.sh" ]; then \
		echo "File exists: $(DEACTIVATE_DIR)/env_vars.sh"; \
		printf "Replace it? (y/n) "; \
		read REPLY; \
		case "$$REPLY" in y|Y) cp deactivate.d/env_vars.sh "$(DEACTIVATE_DIR)/env_vars.sh";; *) echo "Skipped replacing deactivate script.";; esac; \
	else \
		cp deactivate.d/env_vars.sh "$(DEACTIVATE_DIR)/env_vars.sh"; \
	fi
	@if [ -d "$(ENV_BASE)/opt/cosmocc" ]; then \
		echo "Directory exists: $(ENV_BASE)/opt/cosmocc"; \
		printf "Replace it? (y/n) "; \
		read REPLY; \
		case "$$REPLY" in y|Y) rm -rf "$(ENV_BASE)/opt/cosmocc" && \
			mkdir -p "$(ENV_BASE)/opt/cosmocc" && \
			wget https://github.com/jart/cosmopolitan/releases/download/4.0.2/cosmocc-4.0.2.zip && \
				unzip cosmocc-4.0.2.zip -d "$(ENV_BASE)/opt/cosmocc" && \
				rm cosmocc-4.0.2.zip;; \
			*) echo "Skipped installing cosmocc.";; \
		esac; \
	else \
		mkdir -p "$(ENV_BASE)/opt/cosmocc" && \
		wget https://github.com/jart/cosmopolitan/releases/download/4.0.2/cosmocc-4.0.2.zip && \
			unzip cosmocc-4.0.2.zip -d "$(ENV_BASE)/opt/cosmocc" && \
			rm cosmocc-4.0.2.zip; \
	fi