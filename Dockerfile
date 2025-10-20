# Dockerfile
FROM nginx:alpine

ENV PORT=8080

# Nginx site config that listens on $PORT
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Serve your Stage-0 site (index.html currently at repo root)
# If you later add more assets, put them in ./site and change the COPY line.
COPY ./index.html /usr/share/nginx/html/index.html

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- "http://127.0.0.1:${PORT}/" >/dev/null || exit 1

EXPOSE 8080
