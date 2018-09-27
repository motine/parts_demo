# Rails in Parts

## Docker

We use Docker for running a reproducible development environment across the team's laptops.
This means, that all dependencies for the project are installed in a container.
We decided move away from Vagrant because of performance and file-syncing issues (and others).
Please make sure you have [Docker](https://www.docker.com/get-started) installed.

### Workflow

Here a compact overview of things you can do:

```bash
# Build the image for the first time:
docker build -t parts/app .

# run the server (for demonstration purposes it will run migrations and seeding):
docker run -p 3000:3000 -v $(pwd):/app parts/app
# run the tests and the linter:
docker run -p 3000:3000 -v $(pwd):/app parts/app rspec
docker run -p 3000:3000 -v $(pwd):/app parts/app rake check:parts

# get a full shell
docker run -p 3000:3000 -v (pwd):/app -ti parts/app -- /bin/bash
```
