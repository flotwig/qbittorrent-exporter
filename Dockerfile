FROM openjdk:17 AS build

COPY . /src
WORKDIR /src
RUN ./gradlew installDist

FROM openjdk:17
COPY --from=build /src/build/install/qbittorrent-exporter /opt/qbittorrent-exporter
ENTRYPOINT ["/opt/qbittorrent-exporter/bin/qbittorrent-exporter"]

EXPOSE 17871
