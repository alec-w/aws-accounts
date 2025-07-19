PYTHON=python3

fmt:
	terraform fmt -recursive infrastructure

init:
	terraform -chdir=infrastructure init

plan: init
	terraform -chdir=infrastructure plan -out=plan.out

apply: init
	terraform -chdir=infrastructure apply plan.out
