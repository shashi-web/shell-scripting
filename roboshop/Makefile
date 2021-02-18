help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common:
	@sh components/common.sh

cart: common
cart:				## Install Cart Component
	@sh components/cart.sh

catalogue: common
catalogue:			## Install Catalogue Component
	@sh components/catalogue.sh

frontend: common
frontend:			## Install Frontend Component
	@sh components/frontend.sh
mongodb: common
mongodb:			## Install Mongodb Component
	@sh components/mongodb.sh
redis: common
redis:			## Install redis Component
	@sh components/redis.sh
user: common
user:			## Install user Component
	@sh components/user.sh
mysql: common
mysql:			## Install mysql Component
	@sh components/mysql.sh
shipping: common
shipping:			## Install shipping Component
	@sh components/shipping.sh