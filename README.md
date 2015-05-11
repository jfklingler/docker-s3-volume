docker-s3-volume
==============

Creates a Docker container that is restored and backed up to a directory on s3. You could use this to run short lived processes that work with and persist data to and from S3.

Usage:

```
docker run -it --rm \
  -e AWS_ACCESS_KEY_ID=... \
  -e AWS_SECRET_ACCESS_KEY=... \
  -e AWS_DEFAULT_REGION=... \
  -v /<volume path> \
  jfklingler/s3-volume /<volume path> s3://<BUCKET>/<PATH>
```

This pulls down the contents of a directory on S3. If the container is stopped or sent a `USR1` signal, it will backup the modified local 
contents to S3. A `USR2` signal will force the restoration of S3 contents to the local directory.

You can also pass arbitrary options to the sync process:

```
docker run -it --rm \
  -e AWS_ACCESS_KEY_ID=... \
  -e AWS_SECRET_ACCESS_KEY=... \
  -e AWS_DEFAULT_REGION=... \
  -v /<volume path> \
  jfklingler/s3-volume /<volume path> s3://<BUCKET>/<PATH> -- --exclude /useless --delete
```

See http://docs.aws.amazon.com/cli/latest/reference/s3/sync.html for details.

Options:
* -f, --force - restore even if local directory is not empty
* -o <owner>, --owner <owner> - change ownership of restored files to <owner>
