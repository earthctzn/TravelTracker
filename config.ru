require_relative "./config/env"

use Rack::MethodOverride
use SessionsController
use PlacesController
use StoriesController
use UsersController

# run ApplicationController

run Sinatra::Aplication