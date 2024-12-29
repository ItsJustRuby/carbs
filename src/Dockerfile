FROM rclone/rclone:1.68.2 AS rclone
FROM restic/restic:0.17.3
COPY --from=rclone /usr/local/bin/rclone /usr/local/bin/rclone

RUN mkdir /app
WORKDIR /app

COPY . .
# TODO: Check if required
RUN chmod a+rwx -- *.sh

ENTRYPOINT [ "/bin/sh", "/app/install.sh" ]
