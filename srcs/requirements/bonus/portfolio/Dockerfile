FROM alpine:3.16

RUN apk update && apk add --no-cache nodejs npm

WORKDIR /app/

COPY /src/ .

RUN npm i vite -g && npm i @vitejs/plugin-react vite-plugin-svgr @vitejs/plugin-basic-ssl

CMD sh -c "vite preview"
