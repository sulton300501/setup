.PHONY: install
install:
	@echo "pre-commit hook'larini o'rnatish..."
	pip install flake8


	@echo "Yangi .flake8 faylini yaratish..."
	touch .flake8
	@echo "[flake8]" > .flake8
	@echo "exclude =" >> .flake8
	@echo "    .git," >> .flake8
	@echo "    .gitignore," >> .flake8
	@echo "    manage.py," >> .flake8
	@echo "    migrations," >> .flake8
	@echo "    settings," >> .flake8
	@echo "    *.pot," >> .flake8
	@echo "    *.py[co]," >> .flake8
	@echo "    __pscache__," >> .flake8
	@echo "    __init__.py," >> .flake8
	@echo "    venv," >> .flake8
	@echo "    .env" >> .flake8

	@echo "ignore =" >> .flake8
	@echo "     E121," >> .flake8
	@echo "     E126," >> .flake8
	@echo "     E127," >> .flake8
	@echo "     E128," >> .flake8
	@echo "     E203," >> .flake8
	@echo "     E225," >> .flake8
	@echo "     E226," >> .flake8
	@echo "     E231," >> .flake8
	@echo "     E241," >> .flake8
	@echo "     E251," >> .flake8
	@echo "     E261," >> .flake8
	@echo "     E265," >> .flake8
	@echo "     E302," >> .flake8
	@echo "     E303," >> .flake8
	@echo "     E305," >> .flake8
	@echo "     E402," >> .flake8
	@echo "     E501," >> .flake8
	@echo "     E741," >> .flake8
	@echo "     W291," >> .flake8
	@echo "     W292," >> .flake8
	@echo "     W293," >> .flake8
	@echo "     W391," >> .flake8
	@echo "     W503," >> .flake8
	@echo "     W504," >> .flake8
	@echo "     F403," >> .flake8
	@echo "     B007," >> .flake8
	@echo "     B950," >> .flake8
	@echo "     DJ01," >> .flake8

	@echo "max-line-length = 200" >> .flake8

	@echo ".flake8 fayli muvaffaqiyatli yaratildi va sozlamalar qo'shildi!"


.PHONY: pre-install

pre-install:
	@echo "pre-commit ni o'rnatish..."
	pip install pre-commit
	@echo "pre-commit ni o'rnatish muvaffaqiyatli"


	@echo "pre-commit config faylini yaratish..."
	touch .pre-commit-config.yaml

	@echo "pre-commit config-sample ni yaratish..."
	pre-commit sample-config

	@echo "repos:" | tee .pre-commit-config.yaml
	@echo "  - repo: https://github.com/ambv/black" | tee -a .pre-commit-config.yaml
	@echo "    rev: 22.6.0" | tee -a .pre-commit-config.yaml
	@echo "    hooks:" | tee -a .pre-commit-config.yaml
	@echo "      - id: black" | tee -a .pre-commit-config.yaml
	@echo "        args: [ '--line-length=120' ]" | tee -a .pre-commit-config.yaml

	@echo "  - repo: https://github.com/pycqa/flake8" | tee -a .pre-commit-config.yaml
	@echo "    rev: '6.1.0'" | tee -a .pre-commit-config.yaml
	@echo "    hooks:" | tee -a .pre-commit-config.yaml
	@echo "      - id: flake8" | tee -a .pre-commit-config.yaml
	@echo "        args: [ '--max-line-length=120' ]" | tee -a .pre-commit-config.yaml
	@echo "        language_version: python3" | tee -a .pre-commit-config.yaml

	@echo "  - repo: https://github.com/pre-commit/mirrors-mypy" | tee -a .pre-commit-config.yaml
	@echo "    rev: v1.9.0" | tee -a .pre-commit-config.yaml
	@echo "    hooks:" | tee -a .pre-commit-config.yaml
	@echo "      - id: mypy" | tee -a .pre-commit-config.yaml
	@echo "        name: Run type checks" | tee -a .pre-commit-config.yaml
	@echo "        args: [ '--ignore-missing-imports', '--install-types', '--non-interactive' ]" | tee -a .pre-commit-config.yaml

	@echo "  - repo: local" | tee -a .pre-commit-config.yaml
	@echo "    hooks:" | tee -a .pre-commit-config.yaml
	@echo "      - id: migrations-check" | tee -a .pre-commit-config.yaml
	@echo "        language: system" | tee -a .pre-commit-config.yaml
	@echo "        name: Check for uncreated migrations." | tee -a .pre-commit-config.yaml
	@echo "        entry: bash -c \"python manage.py makemigrations --check --dry-run\"" | tee -a .pre-commit-config.yaml
	@echo "        types: [ 'python' ]" | tee -a .pre-commit-config.yaml
	@echo "        pass_filenames: false" | tee -a .pre-commit-config.yaml

	@echo "  - repo: https://github.com/pycqa/isort" | tee -a .pre-commit-config.yaml
	@echo "    rev: 5.13.2" | tee -a .pre-commit-config.yaml
	@echo "    hooks:" | tee -a .pre-commit-config.yaml
	@echo "      - id: isort" | tee -a .pre-commit-config.yaml
	@echo "        name: isort (python)" | tee -a .pre-commit-config.yaml

	@echo "  - repo: local" | tee -a .pre-commit-config.yaml
	@echo "    hooks:" | tee -a .pre-commit-config.yaml
	@echo "      - id: django-test" | tee -a .pre-commit-config.yaml
	@echo "        name: django-test" | tee -a .pre-commit-config.yaml
	@echo "        entry: python manage.py test" | tee -a .pre-commit-config.yaml
	@echo "        always_run: true" | tee -a .pre-commit-config.yaml
	@echo "        pass_filenames: false" | tee -a .pre-commit-config.yaml
	@echo "        language: system" | tee -a .pre-commit-config.yaml

	@echo "pre-commit konfiguratsiyasi muvaffaqiyatli yaratildi!"



.PHONY: py-pro

py-pro:
	@echo "pyproject.toml faylini yaratish..."
	touch pyproject.toml
	@echo "pyproject.toml faylini yaratildi..."

	@echo "[tool.isort]" > pyproject.toml
	@echo "profile = \"black\"" >> pyproject.toml
	@echo "multi_line_output = 3" >> pyproject.toml
	@echo "line_length = 88" >> pyproject.toml
	@echo "default_section = \"THIRDPARTY\"" >> pyproject.toml
	@echo "known_third_party = []" >> pyproject.toml
	@echo "known_first_party = []" >> pyproject.toml
	@echo "known_django = \"django\"" >> pyproject.toml
	@echo "sections = \"FUTURE,STDLIB,THIRDPARTY,DJANGO,LOCALFOLDER,FIRSTPARTY\"" >> pyproject.toml
	@echo "skip = \"migrations,venv\"" >> pyproject.toml
	@echo "pyproject.toml fayli isort sozlamalari bilan yaratildi!"
