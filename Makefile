.PHONY: venv freeze install test build clean

# Создание виртуального окружения
venv:
	python -m venv .venv

# Заморозка текущих зависимостей в requirements.txt
freeze:
	.venv\Scripts\activate && pip freeze > requirements.txt

# Установка зависимостей из requirements.txt
install:
	.venv\Scripts\activate && pip install -r requirements.txt

# Тестирование проекта с использованием pytest
test:
	# Устанавливаем пакет в режиме разработки, чтобы тесты виделимодули
	.venv\Scripts\activate && pip install -e .
	# Запуск тестов с помощью pytest
	.venv\Scripts\activate && pytest -q

# Очистка артефактов сборки и окружения
clean:
	if exist build rmdir /S /Q build
	if exist dist rmdir /S /Q dist
	if exist *.egg-info rmdir /S /Q *.egg-info
	if exist .venv rmdir /S /Q .venv

# Сборка проекта (sdist и wheel) через модуль build (рекомендованный способ)
build:
	.venv\Scripts\activate && python -m build