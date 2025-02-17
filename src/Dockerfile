FROM rclone/rclone:1.69.1 AS rclone
FROM restic/restic:0.17.3
COPY --from=rclone /usr/local/bin/rclone /usr/local/bin/rclone

RUN mkdir /carbs
WORKDIR /carbs

COPY . .
RUN chmod a+rwx backup.sh

ENTRYPOINT [ "/bin/sh", "/carbs/install.sh" ]
