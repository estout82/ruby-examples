

# Release Phase

The release phase allows you to perform certain tasks when a new version of your app is deployed.
- Send JS, CSS, or other assets to a CDN or S3 bucket
- Priming or invalidating cache stores
- Running database migrations

*If a release task fails, the build is not deployed*


A new release us created on a successful build, change of a config var, rollbacks, and other events.
- Dynos don't boot for a new release until the release phase finises

Release Tasks run in a one-off dyno
- Use `heroku ps` to see your release command running

Specify the release task in the `procfile`

```shell
release: rails application:release
web: bundle exec puma
```