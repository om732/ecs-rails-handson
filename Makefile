BASE_URI := xxxxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com

build:
	@docker build . -t ecs-rails-handson-rails:local
	@docker build docker/nginx -t ecs-rails-handson-nginx:local

push: build
	@docker tag ecs-rails-handson-rails:local $(BASE_URI)/handson-rails:latest
	@docker tag ecs-rails-handson-nginx:local $(BASE_URI)/handson-nginx:latest
	@`aws ecr get-login --no-include-email --region ap-northeast-1`
	@docker push $(BASE_URI)/handson-rails:latest
	@docker push $(BASE_URI)/handson-nginx:latest

deploy:
	@aws ecs update-service --cluster handson --service handson --force-new-deployment
