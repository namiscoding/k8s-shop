#!/bin/bash

# Kiểm tra xem secret đã tồn tại chưa để tránh lỗi
if kubectl get secret db-secret -n shop > /dev/null 2>&1; then
    echo "Secret 'db-secret' already exists. Skipping."
else
    echo "Creating secret 'db-secret'..."
    # --from-literal: Tự động mã hóa Base64 chuỗi bạn nhập
    kubectl create secret generic db-secret \
      --from-literal=MYSQL_ROOT_PASSWORD=root \
      --from-literal=MYSQL_USER=admin \
      --from-literal=MYSQL_PASSWORD=pass \
      -n shop
    echo "Secret created successfully!"
fi