# define external port default values here
# these can be overridden at the commandline
# (eg, `REDIS_PORT=16739 make tahoe.up`) or in a .env file
# this is useful to avoid port conflicts if you already
# have services running locally

TAHOE_POSTGRES_PORT ?= 5432
TAHOE_REDIS_PORT ?= 6379

export TAHOE_POSTGRES_PORT
export TAHOE_REDIS_PORT
