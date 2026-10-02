FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="Geozone Checker" \
      org.opencontainers.image.description="Проверка отчётов по геозонам (Excel)"

# убираем дефолтную статику nginx
RUN rm -rf /usr/share/nginx/html/*

# свой конфиг и страница
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1