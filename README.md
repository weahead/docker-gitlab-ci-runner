# Gitlab ci runner for rancher
This is the gitlab runner made to be run in a rancher environment.
just fill in the environment variables in the docker-composefile, the ENV is
supposed to be an array with variables that will be injected into the runners build
process `ENV: ["PRIVATE_TOKEN=asdf", ...]` 
