#!/bin/sh

bun install

# Copy node_modules to host
if [ ! -d /app/node_modules ] || [ -z "$(ls -A /app/node_modules)" ]; then
  echo "node modules not found"
  bun install

  cp -r node_modules/* /app/node_modules/
else
  echo "Skip copy"
fi

# Development mode
bun run dev --host 0.0.0.0 --port 5173


