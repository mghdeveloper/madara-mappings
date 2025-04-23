FROM oven/bun

WORKDIR /app

COPY package.json .
RUN bun install --production

COPY src src
COPY tsconfig.json .
COPY .env .

ENV NODE_ENV production

# Show the public IP when the container starts
CMD sh -c "echo 'Fetching public IP...' && curl https://api.ipify.org && echo && bun src/index.ts"

EXPOSE 3000
