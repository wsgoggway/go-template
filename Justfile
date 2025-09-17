sqlc-gen:
  sqlc generate

protobuf-gen:
  protoc \
    -I . \
    -I /usr/share/googleapis \
    --go_out ./pkg/infrastructure/grpc/ --go_opt paths=source_relative \
    --go-grpc_out ./pkg/infrastructure/grpc/ --go-grpc_opt paths=source_relative \
    --grpc-gateway_out ./pkg/infrastructure/http/ \
    --grpc-gateway_opt paths=source_relative \
    proto/v1/*.proto
