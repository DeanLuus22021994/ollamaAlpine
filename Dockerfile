FROM alpine/ollama
ARG TARGETARCH
RUN apk add --no-cache libstdc++
COPY ./${TARGETARCH}/ /usr/lib/ollama/runners/
ENV OLLAMA_HOST=0.0.0.0
EXPOSE 11434
RUN cat <<< "#!/bin/sh\nollama pull 14b-q4_K_M\nexec ollama serve" > /entrypoint.sh && chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]