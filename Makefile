build:
	- protoc -I proto proto/auth/*.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative


DEFAULT_MSG := "Default commit message"
DEFAULT_TAG := 0.0.2

gac:
	clear
	git add -A
	git commit -m "$(if $(msg),$(msg),$(DEFAULT_MSG))"
	git tag "v$(if $(tag),$(tag),$(DEFAULT_TAG))"
	git push origin "v$(if $(tag),$(tag),$(DEFAULT_TAG))"