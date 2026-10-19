# Use Ubuntu 22.04 for Clang with SafeStack support
FROM ubuntu:22.04 AS builder

# Install required packages: clang, cmake
RUN apt-get update && \
    apt-get install -y clang cmake && \
    rm -rf /var/lib/apt/lists/*

# Copy local Lua directory into container
COPY . /opt/lua

# Set working directory
WORKDIR /opt/lua

# Create build directory and build with CMake using Clang and SafeStack
RUN mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_C_COMPILER=clang \
          -DCMAKE_C_FLAGS="-fsanitize=safe-stack" \
          -DCMAKE_SHARED_LINKER_FLAGS="-fsanitize=safe-stack" \
          .. && \
    cmake --build . --config Release

# Final stage: just keep the artifact
FROM scratch AS artifact
COPY --from=builder /opt/lua/build/lib64/liblua54.so /
