FROM alpine

RUN apk update && apk add curl

CMD ["sh", "-c", "while true; do curl \"$URL\"; sleep \"$SLEEP\"; done"]
