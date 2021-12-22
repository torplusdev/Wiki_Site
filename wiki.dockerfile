FROM alpine:3.14
WORKDIR /xowa
ENV SWT_GTK3=0
ENV XOWA_DIR=/xowa
RUN apk update && \
    apk add --no-cache openjdk8 
RUN wget -nc https://github.com/gnosygnu/xowa/releases/download/v4.6.15.2101/xowa_app_linux_64_v4.6.15.2101.zip && \
    unzip xowa_app_linux_64_v4.6.15.2101.zip
RUN chmod 777 $XOWA_DIR/xowa_linux_64.jar
CMD java -Xmx256m -splash:$XOWA_DIR/bin/any/xowa/file/app.general/waiting.gif -jar $XOWA_DIR/xowa_linux_64.jar --app_mode http_server --http_server_port 80
