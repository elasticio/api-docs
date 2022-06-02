# TODO
# # Base image with sources
# FROM node:12.22.0-alpine3.11 AS base
# WORKDIR /home/node/bran


# COPY src/bran/src ./src
# COPY src/bran/config ./config
# COPY src/bran/package.json ./package.json
# COPY src/bran/tsconfig.json ./tsconfig.json
# COPY src/bran/package-lock.json ./package-lock.json

# # Image for building and installing dependencies
# FROM base AS dependencies
# RUN apk add --no-cache make gcc g++ python && \
#     npm ci --unsafe-perm && \
#     npm run build && \
#     npm ci --only=production --unsafe-perm


# # Release image for running quota-service
# FROM base AS release
# COPY --from=dependencies /home/node/bran/node_modules ./node_modules
# COPY --from=dependencies /home/node/bran/dist ./dist

# RUN chown -R node:node /home/node
# USER node

# CMD ["npm", "start"]
