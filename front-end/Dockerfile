FROM oven/bun:1.1.42-slim

WORKDIR /app

COPY package.json bun.lock ./

RUN bun install

COPY . .

EXPOSE 5173

# Run entrypoint
CMD ["sh", "entrypoint.sh"]