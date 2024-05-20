.PHONY: prepare codegen

prepare:
	@echo "* Common package pub get *"
	@flutter pub get
	@$(MAKE) codegen

# TODO: разобраться почему при вызове make используется версия старая версия дарта не из сдк флаттера
# если поменять flutter pub run на dart run
codegen:
	@flutter pub run build_runner build --delete-conflicting-outputs

